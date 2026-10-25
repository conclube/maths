"""Automated PDF checks and optional rendering; never records visual approval."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
from urllib.parse import unquote, urlsplit
import argparse, json, re, subprocess, hashlib
from pypdf import PdfReader
import pdfplumber
from PIL import Image, ImageDraw

ROOT=Path(__file__).resolve().parent.parent
VOLUMES=('lectures','handbook','exercises','hints','solutions')
def digest(path): return hashlib.sha256(path.read_bytes()).hexdigest()
def pdf_paths(root=ROOT):
    paths=[]
    for course in sorted(root.glob('MM* - *')):
        if not course.is_dir(): continue
        found=sorted(course.glob('*/*.pdf'))
        assert sorted(p.stem for p in found)==sorted(VOLUMES),(course,'five volumes')
        paths.extend(found)
    paths.append(root/'STUDY-MAP.pdf')
    assert len(paths)==21
    return paths

def local_target(base, uri, root=ROOT):
    parts=urlsplit(uri)
    if parts.scheme or not parts.path: return None
    path=(base/unquote(parts.path)).resolve()
    assert path.is_relative_to(root.resolve()) and path.is_file(),(base,uri)
    return path.relative_to(root).as_posix()

def inspect(path,inventory):
    reader=PdfReader(path)
    texts=[page.extract_text() or '' for page in reader.pages]
    combined='\n'.join(texts)
    assert all(len(t.strip())>10 for t in texts),(path,'blank page')
    assert '\ufffd' not in combined,(path,'replacement glyph')
    assert not re.search(r'PLACEHOLDER|TODO|TBD|FIXME',combined),(path,'placeholder')
    assert reader.outline,(path,'no bookmarks')
    def check_bookmarks(items):
        count=0
        for item in items:
            if isinstance(item,list): count+=check_bookmarks(item)
            else:
                number=reader.get_destination_page_number(item)
                assert number is not None and 0<=number<len(reader.pages),(path,'broken bookmark')
                count+=1
        return count
    bookmarks=check_bookmarks(reader.outline)
    page_refs={(page.indirect_reference.idnum,page.indirect_reference.generation) for page in reader.pages}
    def check_destination(destination):
        if isinstance(destination,str):
            assert destination in reader.named_destinations,(path,'unknown named destination',destination)
            number=reader.get_destination_page_number(reader.named_destinations[destination])
            assert number is not None and 0<=number<len(reader.pages),(path,'broken named destination')
        else:
            assert destination,(path,'empty destination')
            target=destination[0]
            if hasattr(target,'idnum'):
                assert (target.idnum,target.generation) in page_refs,(path,'broken internal link')
            else:
                assert isinstance(target,int) and 0<=target<len(reader.pages),(path,'invalid destination page')
    links=0;targets=set()
    for page in reader.pages:
        for ref in page.get('/Annots',[]):
            links+=1
            annotation=ref.get_object()
            action=annotation.get('/A',{})
            if '/Dest' in annotation: check_destination(annotation['/Dest'])
            if action.get('/S')=='/GoTo': check_destination(action['/D'])
            if action.get('/S')=='/URI':
                target=local_target(path.parent,str(action['/URI']))
                if target:targets.add(target)
            elif action.get('/S')=='/GoToR':
                spec=action['/F']
                uri=str(spec.get('/F')) if isinstance(spec,dict) else str(spec)
                target=local_target(path.parent,uri)
                if target:targets.add(target)
    assert links>0,(path,'no links')
    if path.stem in ('exercises','hints','solutions'):
        code=path.parents[1].name[:6]
        records=[r for r in inventory if r['id'].startswith(code)]
        found=re.findall(code+r'-[UM]\d\.\d{2}',combined)
        assert sorted(found)==sorted(r['id'] for r in records),(path,'exercise IDs',len(found))
        assert combined.count('Optional challenge')==sum(r['optional'] for r in records),(path,'optional labels')
        if path.stem=='hints':
            for number in (1,2):
                assert len(re.findall(r'Hint '+str(number)+r'\s*[—-]',combined))==len(records),(path,'hint',number)
        if path.stem=='solutions':
            assert combined.count('Decisive idea.')==sum(r['idea'] is not None for r in records),(path,'ideas')
            assert combined.count('Check your argument.')==len(records),(path,'criteria')
            expanded=sum(bool(re.search(r'-U\d\.(12|13)$',r['id'])) for r in records)
            for marker in ('Finding the approach.','A tempting dead end.','Hypotheses.'):
                assert combined.count(marker)==expanded,(path,marker)
    overflow=[];sparse=[]
    with pdfplumber.open(path) as doc:
        for n,page in enumerate(doc.pages,1):
            bad=[c for c in page.chars if c['x0']<42 or c['x1']>page.width-42 or c['top']<20 or c['bottom']>page.height-20]
            if bad: overflow.append(dict(page=n,samples=''.join(c['text'] for c in bad)[:120]))
            body=[c for c in page.chars if 65<c['top']<page.height-65]
            if n>2 and body and max(c['bottom'] for c in body)<200:sparse.append(n)
    return dict(file=path.relative_to(ROOT).as_posix(),sha256=digest(path),pages=len(reader.pages),
        text_sha256=hashlib.sha256(combined.encode()).hexdigest(),links=links,bookmarks=bookmarks,
        local_link_targets=sorted(targets),overflow=overflow,sparse_pages=sparse)

def render(path):
    code=path.parents[1].name[:6] if path.name!='STUDY-MAP.pdf' else 'MAP'
    root=(ROOT/'qa/rendered').resolve()
    target=(root/(code+'-'+path.stem)).resolve()
    assert target.parent==root
    target.mkdir(parents=True,exist_ok=True)
    for old in list(target.glob('page-*.png'))+list(target.glob('contact-*.jpg')):
        assert old.resolve().parent==target
        old.unlink()
    subprocess.run(['pdftoppm','-r','100','-png',str(path),str(target/'page')],check=True,
        stdout=subprocess.DEVNULL,stderr=subprocess.PIPE)
    pages=sorted(target.glob('page-*.png'))
    contacts=[];hashes={}
    for start in range(0,len(pages),4):
        canvas=Image.new('RGB',(1680,2450),'#d9dfe3')
        draw=ImageDraw.Draw(canvas)
        for slot,imgpath in enumerate(pages[start:start+4]):
            with Image.open(imgpath) as source:
                pic=source.convert('RGB');pic.thumbnail((810,1160))
            x=15+(slot%2)*835;y=35+(slot//2)*1210
            canvas.paste(pic,(x,y))
            draw.text((x,y-22),f'{code} {path.stem} / page {start+slot+1}',fill='black')
        contact=target/f'contact-{start//4+1:02}.jpg'
        canvas.save(contact,quality=88)
        name=contact.relative_to(ROOT).as_posix()
        contacts.append(name);hashes[name]=digest(contact)
    return dict(pdf=path.relative_to(ROOT).as_posix(),sha256=digest(path),pages=len(pages),
        contacts=contacts,contact_sha256=hashes)

def merge(path,records,key,partial):
    if partial and path.exists():
        selected={r[key] for r in records}
        records=[r for r in json.loads(path.read_text(encoding='utf-8')) if r[key].replace('\\','/') not in selected]+records
    path.write_text(json.dumps(records,indent=2),encoding='utf-8',newline='\n')
    return records

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--render',action='store_true')
    parser.add_argument('--only',action='append',default=[])
    args=parser.parse_args()
    paths=pdf_paths()
    if args.only:paths=[p for p in paths if any(s in p.relative_to(ROOT).as_posix() for s in args.only)]
    assert paths,'No matching PDFs'
    inventory=json.loads((ROOT/'qa/exercise-inventory.json').read_text(encoding='utf-8'))
    reports=[]
    for path in paths:
        result=inspect(path,inventory);reports.append(result)
        print(path.parents[1].name[:6] if path.name!='STUDY-MAP.pdf' else 'MAP',
            path.stem,result['pages'],'pages;',len(result['overflow']),'overflow flags',flush=True)
    for uri in re.findall(r'\]\(([^)]+)\)',(ROOT/'README.md').read_text(encoding='utf-8')):
        local_target(ROOT,uri)
    merge(ROOT/'qa/pdf-integrity.json',reports,'file',bool(args.only))
    assert not any(r['overflow'] for r in reports),'Text exceeds safe page bounds; see pdf-integrity.json'
    if args.render:
        with ThreadPoolExecutor(max_workers=4) as pool: rendered=list(pool.map(render,paths))
        all_renders=merge(ROOT/'qa/render-manifest.json',rendered,'pdf',bool(args.only))
        print('Rendered',sum(r['pages'] for r in all_renders),'pages into',
            sum(len(r['contacts']) for r in all_renders),'contact sheets. Visual approval remains separate.')

if __name__=='__main__':main()
