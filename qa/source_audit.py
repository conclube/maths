"""Audit multiline Typst records; exporting an inventory is not PDF approval."""
from pathlib import Path
import argparse, json, re
ROOT = Path(__file__).resolve().parent.parent

def fields(call):
    start = call.index('(') + 1
    out, segment, stack, quoted, escaped = [], start, [], False, False
    for i in range(start, len(call)):
        c = call[i]
        if escaped: escaped = False; continue
        if c == '\\': escaped = True; continue
        if c == '"': quoted = not quoted; continue
        if quoted: continue
        if c in '[({': stack.append(c)
        elif c in '])}':
            if not stack:
                assert c == ')', call[:80]
                if call[segment:i].strip(): out.append(call[segment:i].strip())
                return out, i+1
            opening = stack.pop()
            assert (opening,c) in (('[',']'),('(',')'),('{','}')), call[:80]
        elif c == ',' and not stack:
            out.append(call[segment:i].strip()); segment = i+1
    raise ValueError('Unclosed problem: '+call[:80])

def calls(text):
    for match in re.finditer(r'^\s*p\(\s*\d', text, re.M):
        start = text.index('p(',match.start())
        row, length = fields(text[start:])
        yield start, start+length, row

def inventory(root=ROOT):
    records=[]
    for course in sorted(root.glob('MM* - *')):
        if not course.is_dir(): continue
        code=course.name[:6]
        for path in sorted((course/'3. Exercises').glob('*.typ')):
            data=list(calls(path.read_text(encoding='utf-8')))
            if not data: continue
            unit='U'+str(int(path.stem[1:])) if path.stem.startswith('u') else 'M'+path.stem[-1]
            core=unit.startswith('U')
            expected=13 if core else 6
            assert len(data)==expected,(path,len(data))
            levels=[row[1].strip('"') for _,_,row in data]
            assert levels==(['E']*4+['C']*5+['A']*4 if core else ['E']*2+['C']*2+['A']*2),path
            for n,(_,_,row) in enumerate(data,1):
                assert len(row)>=8 and row[0]==str(n),(path,n)
                assert all(x not in ('[]','""','') for x in row[:8]),(path,n)
                named={}
                for field in row[8:]:
                    key,value=field.split(':',1)
                    key,value=key.strip(),value.strip()
                    assert key in ('optional','idea','minutes') and key not in named,(path,key)
                    named[key]=value
                optional=named.get('optional','false')=='true'
                assert optional==(core and n==13),(path,n,'optional')
                idea=named.get('idea')
                if core and n>=12:
                    assert idea and idea not in ('none','[]',row[5]),(path,n,'independent idea')
                    for marker in ('*Finding the approach.*','*Argument.*','*A tempting dead end.*','*Hypotheses.*'):
                        assert marker in row[6],(path,n,marker)
                default={'E':15,'C':30,'A':50 if core else 40}[levels[n-1]]
                minutes=int(named.get('minutes',default))
                if optional: assert minutes==60
                records.append(dict(id=f'{code}-{unit}.{n:02}',level=levels[n-1],objective=row[2],
                    question=row[3],hint1=row[4],hint2=row[5],solution=row[6],criteria=row[7],
                    idea=idea,optional=optional,minutes=minutes))
            assert sum(r['minutes'] for r in records[-expected:] if not r['optional'])==(360 if core else 170),path
    assert len(records)==464 and len({r['id'] for r in records})==464
    original={f'{c}-{u}{n}.{p:02}' for c in ('MM5020','MM7030','MM7033','MM8036')
        for u,units,problems in [('U',8,12),('M',2,6)] for n in range(1,units+1) for p in range(1,problems+1)}
    assert {r['id'] for r in records if not r['optional']}==original
    assert sum(r['optional'] for r in records)==32
    for code in ('MM5020','MM7030','MM7033','MM8036'):
        assert sum(r['id'].startswith(code) for r in records)==116
    return records

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('prefix',nargs='?')
    parser.add_argument('--check',action='store_true',help='Validate without exporting.')
    args=parser.parse_args()
    records=inventory()
    if not args.check:
        (ROOT/'qa/exercise-inventory.json').write_text(json.dumps(records,ensure_ascii=False,indent=2),encoding='utf-8')
    if args.prefix:
        for r in records:
            if r['id'].startswith(args.prefix): print(r['id'],r['question'],'\nSOLUTION:',r['solution'])
    else:
        optional=sum(r['optional'] for r in records)
        expanded=sum(r['idea'] is not None for r in records)
        print(f'{len(records)} unique problems; {len(records)-optional} original IDs; '
              f'{optional} optional challenges; {expanded} expanded solutions.')

if __name__=='__main__': main()
