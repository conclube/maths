#import "/shared/book.typ": *
#show: book.with(code: "STUDY MAP", title: "Four connected mathematics courses", subtitle: "Routes, prerequisites, and coverage")
= Choose a route

Start with MM5020 Abstract Algebra if quotients, polynomial factorization, and field extensions are unfamiliar. Its proof techniques support both MM7030 Category Theory and MM7033 Advanced Algebra. Those two can then be studied in either order or together: tensor products and localization give concrete universal properties, while category theory explains the shared patterns.

Type Theory has its own logic bridge and introduces its required categorical machinery internally. Category Theory is a useful optional companion, especially its units on products, representability, and exponentials. It is not necessary to finish the other three courses before beginning the lambda-calculus material.

#align(center)[
  #grid(columns: (1fr, 1fr), gutter: 12pt,
    block(inset: 10pt, stroke: 0.7pt + teal)[*MM5020*\ Groups, rings, fields\ Foundation for the two routes below],
    block(inset: 10pt, stroke: 0.7pt + teal)[*Logic bridge → MM8036*\ Syntax, computation, dependent evidence],
    block(inset: 10pt, stroke: 0.7pt + teal)[*MM7030*\ Universal properties and functorial structure],
    block(inset: 10pt, stroke: 0.7pt + teal)[*MM7033*\ Modules, tensor products, localization])
]

All courses assume university proof writing, linear algebra, and discrete mathematics. The handbook diagnostics direct focused review rather than repeating an entire prerequisite course. Treat eight units as eight learning milestones, not necessarily eight calendar weeks. Use the handbook budgets: approximately 10–13 hours per unit, with extra reading time for the proof-intensive units. Six hours cover the twelve core exercise attempts alone; reading, revision, optional challenges, and Agda labs are additional activities. A nominal 7.5-credit course involves more work than reading its lecture pages once.

== The study cycle

+ Begin with the diagnostic and repair only the gaps it reveals.
+ Read the first lecture, then reconstruct a central proof with the book closed.
+ Read the second lecture, work its applications, and check the short checkpoints against the handbook answers.
+ Attempt the four E exercises, then the five C exercises, recording the first step where you become stuck.
+ Consult Hint 1, retry, then use Hint 2 if needed. Write a fresh complete solution before comparing with the solutions book.
+ Attempt the three core A problems and explain one solution aloud. Return after a delay for cumulative retrieval. Then try optional problem 13 to test transfer to a new setting; allow about an hour plus review.
+ Use the two mock assessments to diagnose connections across units. Their rubrics are for practice and do not reproduce official grading thresholds.

= Coverage and connections

#table(columns: (0.65fr, 2.4fr, 1.9fr), inset: 7pt, stroke: 0.4pt,
  [Course], [Substantive teaching and practice], [Learning-outcome evidence],
  [MM5020], [U1–4: groups, cyclic groups, cosets, permutations, quotients, actions, simple groups. U5–6: rings, matrix rings, quaternions, ideals, Euclidean/PID/UFD structure, polynomials. U7–8: fractions, vector spaces, extensions, finite fields and applications.], [Definitions and computations in E; theorem selection and proofs in C; structural synthesis in A. Oral prompts ask students to explain quotient construction, hypotheses, and applications.],
  [MM7030], [U1–3: categories, duality, algebraic examples, functors, equivalence, natural transformations. U4–5: universal properties, limits and colimits. U6: representability and Yoneda. U7–8: adjunctions, units/counits, preservation and applications.], [Construct examples and diagrams, verify naturality, prove universal properties, and connect abstract statements to groups, sets, and vector spaces.],
  [MM7033], [U1–2: fields, Zorn, closures, transcendence. U3–4: modules, finiteness, exact sequences. U5–6: tensors and localization. U7–8: multilinear algebra, exterior powers, trace/determinant, Noetherianity and Hilbert's theorem.], [Control hypotheses; derive and apply constructions; prove structural results; solve applications in elementary commutative algebra, geometry, and representations.],
  [MM8036], [U1–2: binding, substitution, reduction, confluence. U3–4: simple types, normalization, constructive logic. U5–6: Pi, Sigma, induction, identity, universes. U7–8: meaning explanations, explicit substitutions, categorical models and Agda.], [Construct formal derivations; explain metatheorems and their scope; translate proofs to programs; distinguish syntax, computation, and semantics.])

The mapping is a topic and skill alignment to the cited syllabi, not a quotation of SU assessment criteria. Each U-number maps to two lectures, a handbook guide, and 12 corresponding exercises. The two mocks revisit multiple units. Exact official URLs, syllabus versions, and retrieval dates appear in each course handbook.

#pagebreak()
== Four recurring ideas

*Quotients:* Abstract Algebra makes equivalence classes into algebraic objects. Advanced Algebra extends this to modules and tensor relations. Category Theory characterizes such constructions through maps. Type Theory uses alpha classes and conversion while carefully distinguishing different notions of equality.

*Universal properties:* a free group, tensor product, product object, and dependent context extension all specify an object by the maps it admits. Learn to prove existence and uniqueness separately, then use uniqueness to compare constructions.

*Hypotheses:* normality is needed for quotient groups; commutativity controls many tensor constructions; naturality makes a family into a transformation; freshness and dependency conditions make substitution valid. Copy the hypotheses before starting a proof.

*Evidence and explanation:* an example illustrates a definition, a counterexample refutes an overstatement, a proof establishes the stated quantified claim, and a checked program validates an encoded statement under specified rules. Good mathematical communication identifies which kind of evidence is being offered.

== Where to start reading

#link("MM5020%20-%20Mathematics%20III%20-%20Abstract%20Algebra/2.%20Learning%20Material/handbook.pdf")[MM5020 study handbook]\
#link("MM7030%20-%20Category%20Theory/2.%20Learning%20Material/handbook.pdf")[MM7030 study handbook]\
#link("MM7033%20-%20Advanced%20Algebra/2.%20Learning%20Material/handbook.pdf")[MM7033 study handbook]\
#link("MM8036%20-%20Type%20Theory/2.%20Learning%20Material/handbook.pdf")[MM8036 study handbook]

Keep the supplied folder structure for these relative links. If a PDF viewer blocks local links, open the named course folder manually. The editable sources sit beside the PDFs; the root build script regenerates them using the shared design.
