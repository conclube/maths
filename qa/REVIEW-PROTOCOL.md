# Independent mathematical review and learner testing

Status for Edition 2: independent mathematical review **pending**; real student testing **pending**. Assistant authoring, compilation, automated checks, and visual inspection are separate activities and must not be described as independent human review.

## Mathematical review procedure

A reviewer with expertise in the relevant subject should read the revised unit in prerequisite order, check its theorem hypotheses and proof dependencies, and solve the new optional challenge before consulting its hints. Review every expanded problem 12 and 13, including the suggested dead end and the exact claim justified by each hypothesis.

For Category Theory, check arrow directions, naturality in every required variable, existence, and uniqueness. For Type Theory, check context formation, capture avoidance, motives at general endpoints, equality strength, universe levels, and the restricted scope of normalization. For both algebra courses, check the coefficient ring, finiteness assumptions, uses of choice, representative independence, and claims about subrings versus quotients.

Record the edition or Git revision, PDF filename and SHA-256, exact location, reviewer and date, finding, proposed correction, and resolution. Use the mathematical-error issue form to report a finding. A correction is closed only after its dependent arguments, exercises, hints, and solutions have also been checked. Rebuild and visually review changed PDFs after corrections; earlier approvals do not transfer automatically.

The target expansions are Abstract Algebra U3, U4, U6-U8; Category Theory U3, U5-U7; Advanced Algebra U2, U4-U6, U8; and Type Theory U2-U6. All 32 unit sheets also contain an expanded final core solution and a new transfer challenge.

## Learner testing procedure

Recruit learners with the stated prerequisites, including first-time learners of the selected topic. Ask them to read a unit, attempt the core work, and then try its optional challenge without being told which method to use. Record reading, unaided attempt, hint use, revision, and optional lab time separately.

Collect the first point of confusion, the student's actual attempted inference, the help that resolved it, and performance on a nearby unfamiliar problem after a delay. The learner-feedback issue form captures these observations. Do not infer learning quality solely from satisfaction or a numerical score.

The current budgets are provisional: 10-13 hours for a standard unit, with additional time for demanding proofs, and 60 minutes plus approximately 30 minutes of review for the optional challenge. Recalibrate from observed times and prerequisite background rather than lowering estimates to fit a desired schedule.

## Evidence boundaries

The PDF integrity report records automated checks. The render manifest binds rendered contact sheets to PDF hashes. The visual-review record covers only pages actually inspected and must match those hashes. The delivery audit rejects stale or incomplete visual evidence.

GitHub Actions builds and checks fresh PDFs and publishes automated evidence. It neither performs nor records visual or independent mathematical approval. A successful local run is not evidence that a GitHub-hosted workflow has run. The issue forms and this procedure prepare external review; they do not claim that reviewers or students have already participated.
