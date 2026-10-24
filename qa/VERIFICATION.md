# Delivery verification

Completed 24 October 2026. This records the checks performed on the delivered edition, not a claim of external peer review.

## Deliverables

| Course | Lectures | Handbook pages | Questions pages | Hints pages | Solutions pages | Total pages |
|---|---:|---:|---:|---:|---:|---:|
| MM5020 | 16 / 26 pages | 9 | 20 | 20 | 30 | 105 |
| MM7030 | 16 / 26 pages | 9 | 20 | 20 | 30 | 105 |
| MM7033 | 16 / 26 pages | 8 | 20 | 20 | 30 | 104 |
| MM8036 | 16 / 26 pages | 13 | 20 | 20 | 30 | 109 |

The 20 course PDFs contain 423 pages. The five-page root study map brings the delivery to 21 PDFs and 428 pages. Editable Typst sources accompany every volume. The four requested course directories and their three numbered subdirectories are present.

Each course has eight unit files containing two lectures each, eight 12-problem sheets, and two six-problem mock assessments. Across the four courses this gives 64 lectures, 384 core exercises, 48 mock problems, 864 progressive hints, and 432 complete solution entries. Every core sheet has exactly four E, five C, and three A problems. Every mock has two at each level. The labels are pedagogical difficulty levels, not official SU grading thresholds.

## Curriculum and mathematical review

Official syllabus baselines are MM5020 HT2015, MM7030 HT2020, MM7033 HT2023, and MM8036 HT2013. Course handbooks record official URLs, versions, the 24 October 2026 retrieval date, and distinguish supplementary references. The root study map maps topics and skills to units; each unit is paired with teaching, a study guide, and practice.

A separate assistant review checked theorem hypotheses, proof dependencies, examples, counterexamples, and all exercise solutions. Repairs made during this pass included the faithful-functor counterexample, finite-field and splitting-field hypotheses, proper-ideal chain conditions, the scope of the normalization proof, identity-type motives, and the distinction between semantic equality and syntactic derivability. The final Type Theory presentation states its intensional conventions and the restricted scope of its metatheorems. The prose mathematics has been reviewed but has not been formally verified or independently reviewed by a human mathematician.

Pedagogical review checked the order of introduced concepts, E/C/A progression, two-stage hints, decisive solution ideas, and argument-assessment criteria. Handbooks supply diagnostic answers and lecture checkpoint answers. Abstract Algebra and Type Theory include oral explanation practice. Type Theory includes a dedicated logic bridge and four optional lab instructions.

## Build and structural checks

- Project-local official Typst 0.15.1 successfully compiled all 20 course PDFs and the study map. The build uses the workspace as its root, embedded fonts, and no remote Typst packages.
- `source_audit.py` found 432 unique, complete problem records with the required per-sheet distributions. Questions, hints, and solutions are rendered from the same records.
- `verify_pdfs.py` checked all 21 PDFs for empty pages, replacement glyphs, placeholder markers, bookmarks, links, problem identifiers, hint counts, solution counts, and text extending beyond the defined page bounds. There are no recorded overflow or sparse-page flags.
- `delivery_audit.py` verified 64 lecture headings, objective blocks, and checkpoints; five PDFs per course; all relative PDF and README links; and complete visual-review coverage.
- `deliverables.json` records current PDF SHA-256 hashes, extracted-text hashes, page counts, local link targets, and the basis of the corresponding review. Some unchanged volumes were rebuilt during final shared-style work. `render-identity.json` confirms that all 135 pages of those eight rebuilt PDFs are pixel-identical to the pages already inspected; original integrity hashes are retained rather than overwritten.

## Visual review

Every page was rendered with Poppler at 100 dpi and inspected in 114 four-page contact sheets. Representative long proofs, commutative diagrams, typing derivations, exercise pages, and solution pages also received full-page inspection during design validation. Final refinements keep each exercise and its associated hints or solution together, balance space for working, and prevent isolated section headings. The Type Theory handbook's changed contents and oral-practice pages were inspected again after the last pagination adjustment.

No visible clipping, overlapping text, broken diagrams, missing glyphs, or detached exercise headings were found in the final reviewed pages. `visual-review.json` lists all reviewed contact sheets; `render-manifest.json` connects them to the PDFs. Raster previews are in `qa/rendered` and are ignored by Git.

## Optional Agda labs

All four completed lab modules passed project-local Agda 2.8.0.2 using `--safe --without-K --no-libraries`. They cover proofs as programs, induction, dependent vectors, and identity/transport. Completed files contain no unresolved holes or postulates used to bypass proofs. The starter modules intentionally contain exercise holes. The checker validates the encoded lab statements under its rules; this is separate from the review of the lecture proofs and does not certify the metatheory of Agda.

Use `./scripts/check-labs.ps1` to repeat the completed-lab check. Tool versions, official download URLs, and archive hashes are in `TOOLCHAIN.md`. The PDFs need no software installation to read.

## Repeating the checks

From the project root, use `./build.ps1 -All` or `./build.ps1 -Course MM5020`. The study map alone builds with `./build.ps1 -StudyMap`. `python qa/source_audit.py` repeats the exercise inventory check. PDF validation scripts need Python with pypdf, pdfplumber, and Pillow, plus Poppler for rendering; these are validation dependencies only. If content changes, rerun `python qa/verify_pdfs.py --render` and visually review the new pages before replacing the recorded review. A prior visual-review record must not be treated as approval of newly edited content.
