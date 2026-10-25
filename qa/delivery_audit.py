"""Require current, explicitly reviewed PDF hashes; export the delivery index."""
from pathlib import Path
import hashlib,json,re
from pypdf import PdfReader
from source_audit import inventory
from verify_pdfs import pdf_paths,local_target
ROOT=Path(__file__).resolve().parent.parent

def validate_evidence(key,digest,pages,a,b,c):
    assert a['sha256']==b['sha256']==c['sha256']==digest,(key,'stale evidence')
    assert a['pages']==b['pages']==c['pages']==pages,(key,'page count')
    assert not a['overflow'],(key,'overflow')
    assert set(c['contacts'])==set(b['contacts']),(key,'unreviewed pages')
    assert c['contact_sha256']==b['contact_sha256'],(key,'contact identity')
    assert set(c.get('sparse_pages_reviewed',[]))==set(a['sparse_pages']),(key,'unreviewed sparse pages')

def main():
    sources=inventory()
    reports=json.loads((ROOT/'qa/pdf-integrity.json').read_text(encoding='utf-8'))
    renders=json.loads((ROOT/'qa/render-manifest.json').read_text(encoding='utf-8'))
    review=json.loads((ROOT/'qa/visual-review.json').read_text(encoding='utf-8'))
    assert review['status']=='complete','Visual inspection is not complete'
    by_file={r['file']:r for r in reports}
    by_render={r['pdf']:r for r in renders}
    by_review={r['pdf']:r for r in review['reviewed_pdfs']}
    paths=pdf_paths()
    expected={p.relative_to(ROOT).as_posix() for p in paths}
    assert set(by_file)==set(by_render)==set(by_review)==expected
    records=[]
    for path in paths:
        key=path.relative_to(ROOT).as_posix()
        a,b,c=by_file[key],by_render[key],by_review[key]
        digest=hashlib.sha256(path.read_bytes()).hexdigest()
        pages=len(PdfReader(path).pages)
        validate_evidence(key,digest,pages,a,b,c)
        for name,sha in b['contact_sha256'].items():
            image=ROOT/name
            if image.exists():
                assert hashlib.sha256(image.read_bytes()).hexdigest()==sha,(name,'changed contact')
        records.append(dict(file=key,pages=pages,sha256=digest,text_sha256=a['text_sha256'],
            local_link_targets=a['local_link_targets'],review_basis='Exact PDF and rendered contact hashes reviewed'))
    for course in sorted(ROOT.glob('MM* - *')):
        if not course.is_dir():continue
        units=sorted((course/'1. Lectures').glob('u*.typ'))
        assert len(units)==8
        for unit in units:
            text=unit.read_text(encoding='utf-8')
            for pattern in (r'^== Lecture',r'^#focus',r'^#checkpoint'):
                assert len(re.findall(pattern,text,re.M))==2,(unit,pattern)
    for uri in re.findall(r'\]\(([^)]+)\)',(ROOT/'README.md').read_text(encoding='utf-8')):
        local_target(ROOT,uri)
    (ROOT/'qa/deliverables.json').write_text(json.dumps(records,indent=2),encoding='utf-8',newline='\n')
    print(f'{len(records)} PDFs; {sum(r["pages"] for r in records)} pages; '
        f'{sum(len(r["contacts"]) for r in renders)} reviewed contacts; {len(sources)} problems.')
    print('Current hashes, visual coverage, lecture structure, and local links agree.')

if __name__=='__main__':main()
