"""Read-only PDF integrity checks and optional all-page Poppler rendering."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import argparse, json, re, subprocess, hashlib
from pypdf import PdfReader
import pdfplumber
from PIL import Image, ImageOps, ImageDraw
root=Path(__file__).resolve().parent.parent
parser=argparse.ArgumentParser()
parser.add_argument('--render',action='store_true')
parser.add_argument('--only',action='append',default=[],help='Limit to paths containing any supplied string; merge records.')
args=parser.parse_args()
pdfs=sorted(root.glob('MM*/*/*.pdf'))+[root/'STUDY-MAP.pdf']
assert len(pdfs)==21,len(pdfs)
if args.only: pdfs=[p for p in pdfs if any(s in str(p.relative_to(root)) for s in args.only)]
inventory=json.loads((root/'qa/exercise-inventory.json').read_text(encoding='utf-8'))
reports=[]
for path in pdfs:
    reader=PdfReader(path)
    texts=[page.extract_text() or '' for page in reader.pages]
    combined='\n'.join(texts)
    assert all(len(t.strip())>10 for t in texts),(path,'blank page')
    assert '\ufffd' not in combined,(path,'replacement glyph')
    assert not re.search(r'PLACEHOLDER|TODO|TBD|FIXME',combined),(path,'placeholder')
    assert reader.outline,(path,'no bookmarks')
    links=sum(len(page.get('/Annots',[])) for page in reader.pages)
    assert links>0,(path,'no links')
    if path.stem in ('exercises','hints','solutions'):
        code=path.parents[1].name[:6]
        found=re.findall(code+r'-[UM]\d\.\d{2}',combined)
        expected=[r['id'] for r in inventory if r['id'].startswith(code)]
        assert sorted(found)==sorted(expected),(path,'exercise ID mismatch',len(found))
        if path.stem=='hints':
            assert combined.count('Hint 1')==109,(path,'hint1')
            assert combined.count('Hint 2')==109,(path,'hint2')
        if path.stem=='solutions':
            assert combined.count('Decisive idea.')==108
            assert combined.count('Check your argument.')==108
    overflow=[]; sparse=[]
    with pdfplumber.open(path) as doc:
        for n,page in enumerate(doc.pages,1):
            chars=page.chars
            bad=[c for c in chars if c['x0']<42 or c['x1']>page.width-42 or c['top']<20 or c['bottom']>page.height-20]
            if bad: overflow.append(dict(page=n,samples=''.join(c['text'] for c in bad)[:100]))
            body=[c for c in chars if 65<c['top']<page.height-65]
            if n>2 and body and max(c['bottom'] for c in body)<200: sparse.append(n)
    reports.append(dict(file=str(path.relative_to(root)),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),pages=len(reader.pages),links=links,overflow=overflow,sparse_pages=sparse))
    print(path.parents[1].name[:6] if path!=root/'STUDY-MAP.pdf' else 'MAP',path.stem,len(reader.pages),'pages',len(overflow),'overflow flags',flush=True)
if args.only:
    old=json.loads((root/'qa/pdf-integrity.json').read_text(encoding='utf-8'))
    selected={r['file'] for r in reports}
    reports=[r for r in old if r['file'] not in selected]+reports
(root/'qa/pdf-integrity.json').write_text(json.dumps(reports,indent=2),encoding='utf-8')
if args.render:
    rendered=root/'qa/rendered';rendered.mkdir(exist_ok=True)
    def render(path):
        code=path.parents[1].name[:6] if path.name!='STUDY-MAP.pdf' else 'MAP'
        target=rendered/(code+'-'+path.stem);target.mkdir(exist_ok=True)
        for old in list(target.glob('page-*.png'))+list(target.glob('contact-*.jpg')):
            assert old.resolve().parent == target.resolve()
            old.unlink()
        subprocess.run(['pdftoppm','-r','100','-png',str(path),str(target/'page')],check=True,stdout=subprocess.DEVNULL,stderr=subprocess.PIPE)
        pages=sorted(target.glob('page-*.png'))
        contacts=[]
        for start in range(0,len(pages),4):
            canvas=Image.new('RGB',(1680,2450),'#d9dfe3')
            draw=ImageDraw.Draw(canvas)
            for slot,imgpath in enumerate(pages[start:start+4]):
                pic=Image.open(imgpath).convert('RGB');pic.thumbnail((810,1160))
                x=15+(slot%2)*835;y=35+(slot//2)*1210
                canvas.paste(pic,(x,y))
                draw.text((x,y-22),f'{code} {path.stem} / page {start+slot+1}',fill='black')
            contact=target/f'contact-{start//4+1:02}.jpg';canvas.save(contact,quality=88)
            contacts.append(str(contact.relative_to(root)))
        return dict(pdf=str(path.relative_to(root)),sha256=hashlib.sha256(path.read_bytes()).hexdigest(),contacts=contacts,pages=len(pages))
    with ThreadPoolExecutor(max_workers=4) as pool:
        rendered_results=list(pool.map(render,pdfs))
    if args.only:
        old=json.loads((root/'qa/render-manifest.json').read_text(encoding='utf-8'))
        selected={r['pdf'] for r in rendered_results}
        rendered_results=[r for r in old if r['pdf'] not in selected]+rendered_results
    (root/'qa/render-manifest.json').write_text(json.dumps(rendered_results,indent=2),encoding='utf-8')
    print('Rendered',sum(x['pages'] for x in rendered_results),'pages into',sum(len(x['contacts']) for x in rendered_results),'contact sheets.',flush=True)
