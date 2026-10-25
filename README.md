# Four mathematics courses

Start with [the study map](STUDY-MAP.pdf) or open a course's compiled handbook. This is original, independent study material aligned with the cited Stockholm University syllabi, in English. The unit order is an instructional design, not an official lecture schedule. E/C/A are pedagogical difficulty labels, not official grading criteria.

| Course | Start here | Lecture book | Practice |
|---|---|---|---|
| MM5020 · Mathematics III – Abstract Algebra | [Handbook](MM5020%20-%20Mathematics%20III%20-%20Abstract%20Algebra/2.%20Learning%20Material/handbook.pdf) | [Lectures](MM5020%20-%20Mathematics%20III%20-%20Abstract%20Algebra/1.%20Lectures/lectures.pdf) | [Questions](MM5020%20-%20Mathematics%20III%20-%20Abstract%20Algebra/3.%20Exercises/exercises.pdf) |
| MM7030 · Category Theory | [Handbook](MM7030%20-%20Category%20Theory/2.%20Learning%20Material/handbook.pdf) | [Lectures](MM7030%20-%20Category%20Theory/1.%20Lectures/lectures.pdf) | [Questions](MM7030%20-%20Category%20Theory/3.%20Exercises/exercises.pdf) |
| MM7033 · Advanced Algebra | [Handbook](MM7033%20-%20Advanced%20Algebra/2.%20Learning%20Material/handbook.pdf) | [Lectures](MM7033%20-%20Advanced%20Algebra/1.%20Lectures/lectures.pdf) | [Questions](MM7033%20-%20Advanced%20Algebra/3.%20Exercises/exercises.pdf) |
| MM8036 · Type Theory | [Handbook](MM8036%20-%20Type%20Theory/2.%20Learning%20Material/handbook.pdf) | [Lectures](MM8036%20-%20Type%20Theory/1.%20Lectures/lectures.pdf) | [Questions](MM8036%20-%20Type%20Theory/3.%20Exercises/exercises.pdf) |

Each course contains 16 lectures in eight units, a study handbook, eight sheets of 12 core exercises plus one optional transfer challenge each, and two six-problem mock assessments. Each exercise has an objective, effort estimate, two hints, a solution, and self-assessment criteria. Edition 2 preserves all 432 original problems and adds 32 optional challenges, for 464 problems in total (116 per course). The final core problem and the new challenge in each unit have expanded solutions explaining the approach, complete argument, a tempting dead end, and the hypotheses. Open `hints.pdf` only after an attempt and `solutions.pdf` after using the hints. All five volumes have editable Typst sources alongside them. Exercise statements, hints, and solutions are stored together in each unit's `.typ` data file; editing it updates all three practice volumes.

The PDFs are readable offline without installing software. Keep the directory structure intact for relative links between volumes; some PDF viewers require permission to open local links. Each handbook records official source URLs, syllabus version, retrieval date, supplementary references, notation, and glossary.

## Rebuild

From PowerShell in this folder:

```powershell
./build.ps1 -All
./build.ps1 -Course MM5020
./scripts/check-labs.ps1
```

The already downloaded portable executables live under `.tools`. `scripts/setup-tools.ps1` downloads official, pinned Windows releases and verifies their archive SHA-256 hashes if tooling needs to be restored. Network access is needed only for that restoration, not ordinary builds. No global PATH change or standard-library installation is required. Typst uses this folder as its project root and its embedded fonts.

To compile the root study map: `./build.ps1 -StudyMap`. The map is an additional navigation PDF, separate from the five volumes per course.

## Optional Agda work

The Type Theory handbook provides four lab instructions and their mathematical connections. Use the files in its `labs/starters` directory for your attempts; intentional `?` holes are the exercises. Completed files in `labs/solutions` pass Agda 2.8.0.2 with `--safe --without-K`, with no external library imports. To check your own directory, use `./scripts/check-labs.ps1 -LabDirectory <directory>`. Keep starter and solution include directories separate because their module names match.

Tool versions and download provenance are in [TOOLCHAIN.md](TOOLCHAIN.md). The [verification report](qa/VERIFICATION.md) records the source, mathematical, build, visual, and Agda checks. This edition contains 20 course PDFs plus the study map; current page totals and hashes are recorded in the verification report. The core material uses the stated foundational assumptions; the small Agda examples do not certify all prose mathematics or the metatheory of the whole proof assistant.

## Edition 2 teaching revisions

Nineteen units now include a prerequisite bridge, additional worked examples, expanded proof steps, and a failed approach or counterexample. Category Theory adds commutative diagrams, and Type Theory adds explicit typing and motive calculations. The course sequence and all 64 lecture identities remain stable.

Plan approximately 10–13 hours for a standard unit, including six hours of core exercise attempts, and extra reading time for demanding proofs. Optional challenges and labs are additional work. The handbook displays exercise totals directly from the problem records. These estimates are provisional and await student timing data.

## Automated checks and external review

The GitHub Actions workflow runs on pull requests, pushes to main, and manual dispatch. It restores checksum-verified local tools, builds every PDF, checks source contracts and PDF contents/links/bounds, and checks the four completed Agda labs. Compiled PDFs and automated reports are retained as workflow artifacts for 14 days. Visual approval is a separate record tied to the exact inspected PDF hashes.

Install the optional validation dependencies with `python -m pip install -r qa/requirements.txt`. Run `python -m unittest discover -s qa -p "test_*.py"` and `python qa/source_audit.py`, then rebuild before running `python qa/verify_pdfs.py`. Add --render when Poppler is available, inspect the new pages, and use `python qa/delivery_audit.py` to check the completed review record.

Independent mathematical review and real student testing remain pending. The [review procedure](qa/REVIEW-PROTOCOL.md) and GitHub issue forms describe how to collect and resolve that evidence. Automated or assistant checks do not certify all mathematics or establish learning outcomes.
