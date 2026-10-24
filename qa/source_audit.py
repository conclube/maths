"""Read-only exercise inventory and compact statement/solution review export."""
from pathlib import Path
import re, json, sys
root = Path(__file__).resolve().parent.parent
def fields(line):
    start = line.index('(') + 1
    out, segment, stack, quoted, escaped = [], start, [], False, False
    for i in range(start, len(line)):
        c = line[i]
        if escaped: escaped = False; continue
        if c == '\\': escaped = True; continue
        if c == '"': quoted = not quoted; continue
        if quoted: continue
        if c in '[({': stack.append(c)
        elif c in '])}':
            if not stack:
                out.append(line[segment:i].strip()); return out
            stack.pop()
        elif c == ',' and not stack:
            out.append(line[segment:i].strip()); segment = i+1
    raise ValueError(line)
records = []
for course in sorted(root.glob('MM* - *')):
    if not course.is_dir(): continue
    code = course.name[:6]
    for path in sorted((course/'3. Exercises').glob('*.typ')):
        data = [fields(line.strip()) for line in path.read_text(encoding='utf-8').splitlines() if re.match(r'\s*p\(\d', line)]
        if not data: continue
        unit = ('U'+str(int(path.stem[1:]))) if path.stem.startswith('u') else ('M'+path.stem[-1])
        expected = 12 if unit.startswith('U') else 6
        assert len(data)==expected, (path,len(data))
        levels = [r[1].strip('"') for r in data]
        assert levels == (['E']*4+['C']*5+['A']*3 if expected==12 else ['E']*2+['C']*2+['A']*2), (path,levels)
        for n, row in enumerate(data,1):
            assert len(row)==8, (path,n,len(row))
            assert row[0]==str(n), (path,n)
            assert all(x not in ('[]','""','') for x in row), (path,n)
            records.append(dict(id=f'{code}-{unit}.{n:02}',level=levels[n-1],objective=row[2],question=row[3],hint1=row[4],hint2=row[5],solution=row[6],criteria=row[7]))
assert len(records)==432, len(records)
assert len({r['id'] for r in records})==432
(root/'qa'/'exercise-inventory.json').write_text(json.dumps(records,ensure_ascii=False,indent=2),encoding='utf-8')
if len(sys.argv)>1:
    for r in records:
        if r['id'].startswith(sys.argv[1]):
            print(r['id'], r['level'],r['question']);print('SOLUTION:',r['solution'])
else: print('432 unique complete records; all 32 core sheets and eight mocks have the specified E/C/A distribution.')
