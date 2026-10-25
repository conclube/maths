# Delivery verification — Edition 2

Completed 25 October 2026. This report describes the final local outputs and their recorded checks. Independent mathematical review and real student testing remain **pending**.

## Deliverables

| Course | Lectures | Handbook pages | Questions pages | Hints pages | Solutions pages | Total pages |
|---|---:|---:|---:|---:|---:|---:|
| MM5020 | 16 / 31 pages | 10 | 28 | 28 | 28 | 125 |
| MM7030 | 16 / 30 pages | 11 | 28 | 28 | 28 | 125 |
| MM7033 | 16 / 31 pages | 10 | 28 | 28 | 28 | 125 |
| MM8036 | 16 / 31 pages | 15 | 28 | 28 | 29 | 131 |

The 20 course PDFs contain 506 pages; the 5-page study map brings the delivery to 21 PDFs and **511 pages**. These totals were derived from the final rendered outputs after visual inspection. Editable Typst sources accompany every volume.

All 64 lectures and 432 original problem identifiers remain. Each course contains 116 problems: 96 core exercises, 12 mock-assessment problems, and eight optional transfer challenges. Across the series there are 384 core exercises, 48 mock problems, and 32 challenges: **464 problems, 928 hints, 464 solutions, and 464 assessment-criteria entries**. Each unit retains four E, five C, and three A core problems, followed by its optional A-level problem .13. Each mock retains two problems at each level.

## Teaching and mathematical review

Nineteen targeted units received prerequisite bridges, at least two worked examples, annotated proofs, and failed approaches or counterexamples. Category Theory includes diagrams for the expanded constructions; Type Theory includes explicit context, substitution, typing, and identity-motive calculations. Handbook guidance and checkpoint answers were reconciled with the lectures.

The 64 unit problems .12 and .13 have separately authored decisive ideas and expanded solutions covering how to find the approach, the complete argument, a plausible dead end, and the hypotheses. The renderer no longer copies Hint 2 into an idea section. Proof-reconstruction tasks are identified as such. Optional challenge questions do not name the intended method.

Assistant review checked the revised mathematics for hypotheses, prerequisite dependencies, transfer demands, and completeness. Particular checks included quotient well-definedness, finite-field characteristic, naturality and universal-property directions, proper-ideal chain bounds, projective lifting, tensor and localization relations, and the bounded-degree remainder in Hilbert's basis theorem. Type Theory retains its stated intensional assumptions and restricts its normalization proof to the arrow-only simply typed core. No dependent normalization, equality reflection, K, UIP, or function-extensionality principle is inferred without its required justification.

Six finite computational checks independently tested selected new examples (square-coloring orbits, a cyclic kernel, idempotents, two trace-fiber calculations, and degree-six finite-field elements). Their results are in mathematical-checks.json and corresponding regression tests. These checks do not formally verify the general prose proofs.

## Workload and assessment

Recorded estimates give 360 minutes of core exercise attempts per unit. Guidance adds three–five hours for reading and worked examples and one–two hours for revision, with extra reading time for demanding units. Each optional challenge records a 60-minute attempt and budgets approximately 30 additional minutes for review. Optional labs are separate.

Mock estimates are 15 minutes per E problem, 30 per C, and 40 per A: 170 minutes of attempts plus ten minutes of review within the 180-minute allowance. Workload displays sum the recorded problem estimates. All estimates remain provisional pending learner timing data.

## Automated checks

- Project-local, checksum-verified Typst 0.15.1 compiled all 21 PDFs successfully using embedded fonts and no remote Typst packages.
- All ten regression tests passed. They cover multiline problem parsing, source contracts and teaching routes, finite mathematical examples, and rejection of stale or incomplete visual evidence.
- source_audit.py validated 464 complete, unique problem records, all original identifiers, 32 optional challenges, 64 independent idea fields, per-course totals, difficulty distributions, and exercise/mock timing.
- verify_pdfs.py checked every PDF for missing problem content, both hints, solutions and criteria, authored idea counts, empty pages, replacement glyphs, placeholders, local links, bookmark and internal-link destinations, and text outside the defined page bounds. It checked 1704 bookmarks and 465 link annotations. No overflow was reported.
- delivery_audit.py passed for 21 PDFs, 511 pages, 132 reviewed contact sheets, and 464 problems. It also checked lecture headings, objectives and checkpoints, local README/PDF links, and exact agreement between current PDF, integrity, render, and review hashes.
- All four completed Agda modules passed Agda 2.8.0.2 with --safe --without-K --no-libraries. The completed modules have no exercise holes or proof-bypassing postulates; starter holes remain intentional. The result certifies only the encoded lab statements under those rules.

The Windows GitHub Actions workflow is configured for pull requests, pushes to main, and manual dispatch. It restores the pinned tools, builds, runs source and PDF checks, checks all completed labs, and uploads PDFs and automated reports. Its corresponding steps passed locally; **a GitHub-hosted workflow run has not been performed**. CI does not create visual approval.

## Visual inspection and evidence identity

All 511 final pages were rendered with Poppler at 100 dpi and inspected in 132 contact sheets. An additional 87 full-page inspections covered long proofs, diagrams, typing derivations, question/hint examples, and solutions continuing across page breaks. Each explicitly inspected full page is listed in visual-review.json.

Solutions now flow in breakable blocks, with exercise headings attached to their questions. Question volumes retain writing space. No visible clipping, overlapping text, missing glyphs, broken diagrams, or detached exercise headings remained in the reviewed outputs. The 68 automated sparse-page flags were individually reviewed: they are intentional optional-question/hint space, unit-ending continuation pages, or the final Type Theory solution continuation.

pdf-integrity.json stores automated evidence; render-manifest.json binds contact sheets to PDF hashes; visual-review.json records the actual inspection separately. deliverables.json records final PDF and extracted-text hashes, page counts, and local link targets. All final PDF hashes match their reviewed render manifests directly; render-identity.json is empty because no rebuilt-but-unreviewed binary remains. Raster previews are ignored by Git.

## Remaining human review and repeating the checks

Independent mathematical review and student testing are pending. REVIEW-PROTOCOL.md specifies the human review and learner-testing procedures; GitHub issue forms collect exact locations, attempted reasoning, confusing steps, and actual time spent. No external outreach was performed. Licensing remains deferred.

From the project root, run ./build.ps1 -All, the unittest suite, python qa/source_audit.py, python qa/verify_pdfs.py, and ./scripts/check-labs.ps1. Validation dependencies are pinned in qa/requirements.txt; tool provenance is in TOOLCHAIN.md. Add --render to the PDF check when Poppler is available, inspect changed pages, and record only the exact files actually reviewed before running python qa/delivery_audit.py. Automated success cannot replace visual inspection, mathematical review, or learner testing.
