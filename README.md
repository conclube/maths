# Four mathematics courses

Start with [the study map](STUDY-MAP.pdf) or open a course's compiled handbook. This is original, independent study material aligned with the cited Stockholm University syllabi, in English. The unit order is an instructional design, not an official lecture schedule. E/C/A are pedagogical difficulty labels, not official grading criteria.

| Course | Start here | Lecture book | Practice |
|---|---|---|---|
| MM5020 · Mathematics III – Abstract Algebra | [Handbook](MM5020%20-%20Mathematics%20III%20-%20Abstract%20Algebra/2.%20Learning%20Material/handbook.pdf) | [Lectures](MM5020%20-%20Mathematics%20III%20-%20Abstract%20Algebra/1.%20Lectures/lectures.pdf) | [Questions](MM5020%20-%20Mathematics%20III%20-%20Abstract%20Algebra/3.%20Exercises/exercises.pdf) |
| MM7030 · Category Theory | [Handbook](MM7030%20-%20Category%20Theory/2.%20Learning%20Material/handbook.pdf) | [Lectures](MM7030%20-%20Category%20Theory/1.%20Lectures/lectures.pdf) | [Questions](MM7030%20-%20Category%20Theory/3.%20Exercises/exercises.pdf) |
| MM7033 · Advanced Algebra | [Handbook](MM7033%20-%20Advanced%20Algebra/2.%20Learning%20Material/handbook.pdf) | [Lectures](MM7033%20-%20Advanced%20Algebra/1.%20Lectures/lectures.pdf) | [Questions](MM7033%20-%20Advanced%20Algebra/3.%20Exercises/exercises.pdf) |
| MM8036 · Type Theory | [Handbook](MM8036%20-%20Type%20Theory/2.%20Learning%20Material/handbook.pdf) | [Lectures](MM8036%20-%20Type%20Theory/1.%20Lectures/lectures.pdf) | [Questions](MM8036%20-%20Type%20Theory/3.%20Exercises/exercises.pdf) |

Each course contains 16 lectures in eight units, a study handbook, eight sheets of 12 exercises, and two six-problem mock assessments. Each exercise has an objective, effort estimate, two hints, a complete solution, and self-assessment criteria. Open `hints.pdf` only after an attempt and `solutions.pdf` after using the hints. All five volumes have editable Typst sources alongside them. Exercise statements, hints, and solutions are stored together in each unit's `.typ` data file; editing it updates all three practice volumes.

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

Tool versions and download provenance are in [TOOLCHAIN.md](TOOLCHAIN.md). The [verification report](qa/VERIFICATION.md) records the source, mathematical, build, visual, and Agda checks. This edition contains 20 course PDFs plus the study map, totaling 428 pages. The core material uses the stated foundational assumptions; the small Agda examples do not certify all prose mathematics or the metatheory of the whole proof assistant.
