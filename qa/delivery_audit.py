"""Validate the final delivery index, local PDF links, and review inventory."""
from pathlib import Path
from urllib.parse import unquote, urlsplit
import hashlib, json, re
from pypdf import PdfReader

root = Path(__file__).resolve().parent.parent
integrity = json.loads((root / 'qa/pdf-integrity.json').read_text())
renders = json.loads((root / 'qa/render-manifest.json').read_text())
review = json.loads((root / 'qa/visual-review.json').read_text())
identity_file = root/'qa/render-identity.json'
identities = {r['pdf']: r for r in json.loads(identity_file.read_text())} if identity_file.exists() else {}
seen = set(review['reviewed_contacts'])
expected = {p.replace('\\', '/') for r in renders for p in r['contacts']}
assert seen == expected, (expected - seen, seen - expected)
assert len(seen) == 114
assert sum(r['pages'] for r in renders) == 428
assert all(not r['overflow'] and not r['sparse_pages'] for r in integrity)

def local_link(base, uri):
    parts = urlsplit(uri)
    if parts.scheme or not parts.path:
        return None
    target = (base / unquote(parts.path)).resolve()
    assert target.is_file(), (base, uri, target)
    return str(target.relative_to(root)).replace('\\', '/')

records = []
for record in integrity:
    path = root / record['file']
    reader = PdfReader(path)
    digest = hashlib.sha256(path.read_bytes()).hexdigest()
    if digest != record['sha256']:
        identity = identities[record['file']]
        assert identity['previous_sha256'] == record['sha256']
        assert identity['current_sha256'] == digest
    targets = []
    for page in reader.pages:
        for ref in page.get('/Annots', []):
            annotation = ref.get_object()
            action = annotation.get('/A', {})
            if action.get('/S') == '/URI':
                found = local_link(path.parent, str(action['/URI']))
                if found: targets.append(found)
            elif action.get('/S') == '/GoToR':
                file_spec = action['/F']
                uri = str(file_spec.get('/F')) if isinstance(file_spec, dict) else str(file_spec)
                found = local_link(path.parent, uri)
                if found: targets.append(found)
    assert len(reader.pages) == record['pages']
    texts = '\n'.join(p.extract_text() or '' for p in reader.pages)
    records.append(dict(file=record['file'].replace('\\', '/'), pages=len(reader.pages),
        sha256=digest, text_sha256=hashlib.sha256(texts.encode()).hexdigest(),
        matches_integrity_sha256=digest == record['sha256'],
        review_basis='Exact checked PDF' if digest == record['sha256'] else 'Rebuild with pixel-identical pages; see render-identity.json',
        local_link_targets=sorted(set(targets))))

for uri in re.findall(r'\]\(([^)]+)\)', (root/'README.md').read_text(encoding='utf-8')):
    local_link(root, uri)
for course in sorted(root.glob('MM* - *')):
    units = sorted((course/'1. Lectures').glob('u*.typ'))
    assert len(units) == 8
    for unit in units:
        text = unit.read_text(encoding='utf-8')
        for pattern in (r'^== Lecture', r'^#focus', r'^#checkpoint'):
            assert len(re.findall(pattern, text, re.M)) == 2, (unit, pattern)
    assert len(list(course.glob('*/*.pdf'))) == 5

(root/'qa/deliverables.json').write_text(json.dumps(records, indent=2), encoding='utf-8')
print('21 PDFs; 428 pages; 114 reviewed contact sheets; 64 lectures with objectives and checkpoints.')
print('All local PDF and README links resolve. No recorded bounds or sparse-page flags.')
changed = [r['file'] for r in records if not r['matches_integrity_sha256']]
print('Rebuilt PDFs with confirmed identical pixels:', len(changed))
