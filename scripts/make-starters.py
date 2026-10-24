"""Regenerate deliberately incomplete optional lab starters from checked solutions."""
from pathlib import Path
import re
root = Path(__file__).resolve().parent.parent
labs = root / 'MM8036 - Type Theory' / '2. Learning Material' / 'labs'
tasks = {
    1: ['identity', 'constant', 'compose', 'swap', 'cases', 'absurd', 'distribute', 'factor'],
    2: ['zero-right', 'associative', 'two-plus-two'],
    3: ['map', 'append', 'head', 'tail', 'replicate', 'map-identity'],
    4: ['sym', 'trans', 'cong', 'transport', 'transport-refl', 'transport-compose', 'cast', 'cast-refl'],
}
(labs / 'starters').mkdir(exist_ok=True)
for number, names in tasks.items():
    source = (labs / 'solutions' / f'Lab{number:02}.agda').read_text(encoding='utf-8')
    seen = set()
    result = []
    for line in source.splitlines():
        name = next((n for n in names if re.match(re.escape(n) + r'(?:\s|$)', line) and ' : ' not in line), None)
        if name:
            if name not in seen:
                result.append(f'{name} = ?')
                seen.add(name)
        else:
            result.append(line)
    assert seen == set(names), (number, seen)
    result.insert(2, '-- Exercises: replace each ? by a term or pattern-matching clauses. See the handbook.')
    (labs / 'starters' / f'Lab{number:02}.agda').write_text('\n'.join(result) + '\n', encoding='utf-8')
