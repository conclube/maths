"""Confirm rebuilt PDF pixels equal the pages already visually reviewed."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import hashlib, json, subprocess, tempfile
from PIL import Image

root = Path(__file__).resolve().parent.parent
manifest = json.loads((root/'qa/render-manifest.json').read_text())
integrity = json.loads((root/'qa/pdf-integrity.json').read_text())
changed = [r for r in manifest if hashlib.sha256((root/r['pdf']).read_bytes()).hexdigest() != r['sha256']]

def compare(record):
    path = root/record['pdf']
    code = path.parents[1].name[:6] if path.name != 'STUDY-MAP.pdf' else 'MAP'
    original = root/'qa/rendered'/(code+'-'+path.stem)
    with tempfile.TemporaryDirectory(prefix='render-compare-', dir=root/'qa') as tmp:
        target = Path(tmp).resolve()
        assert target.parent == (root/'qa').resolve()
        subprocess.run(['pdftoppm','-r','100','-png',str(path),str(target/'page')],
            check=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
        old = sorted(original.glob('page-*.png'))
        new = sorted(target.glob('page-*.png'))
        assert len(old) == len(new) == record['pages']
        for a,b in zip(old,new):
            with Image.open(a) as x, Image.open(b) as y:
                assert x.size == y.size and x.tobytes() == y.tobytes(), (path,a.name)
    return dict(pdf=record['pdf'], previous_sha256=record['sha256'],
        current_sha256=hashlib.sha256(path.read_bytes()).hexdigest(),
        identical_rendered_pages=record['pages'])

with ThreadPoolExecutor(max_workers=4) as pool:
    results = list(pool.map(compare, changed))
(root/'qa/render-identity.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
print('Pixel-identical rebuilds:', len(results), 'PDFs,',sum(r['identical_rendered_pages'] for r in results),'pages.')
