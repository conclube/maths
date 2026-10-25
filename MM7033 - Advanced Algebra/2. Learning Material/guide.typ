#import "/shared/book.typ": *
= A route through advanced algebra

The main transition in this course is from computations in familiar fields to constructions controlled by universal properties and finiteness assumptions. Keep a list of hypotheses beside each proof: field or ring; domain or possible zero divisors; free, projective, or arbitrary module; finite or infinite generation. Most serious errors arise when one of these distinctions is silently erased.

Plan approximately 10–13 hours per unit: three–five hours for the two lectures and worked examples, six hours for all twelve core exercise attempts, and one–two hours for revision. Split this work into sessions that suit you. For the most demanding proofs, especially normalization, Yoneda, Zorn's lemma, and Hilbert's theorem, allow three additional hours of reading and reconstruction. The optional transfer challenge has a separate 60-minute attempt estimate plus about 30 minutes of review. These are initial planning estimates, not measured student completion times; record your actual time and adjust future units.

E/C/A describe difficulty within university mathematics and are not official grade criteria. E establishes precise use of definitions. C combines methods. A asks you to construct, generalize, or diagnose a claim. Use progressive hints sparingly, then compare complete arguments in the solutions volume.

== Sources and syllabus map

Baseline: #link("https://sisu.it.su.se/pdf_creator/47825/73691/en")[SU syllabus MM7033, Advanced Algebra, valid from autumn 2023], and #link("https://www.su.se/utbildning/utbildningskatalog/mm/mm7033")[the course catalogue], retrieved 24 October 2026. MM5020 is the listed algebra prerequisite.

Units 1–2 cover field extensions, minimal polynomials, splitting and finite fields, Zorn's lemma, maximal ideals, algebraic closures, and transcendence bases. Units 3–4 cover submodules, quotients, sums/products, free modules, isomorphism theorems, finite generation/presentation, and exact sequences. Units 5–6 develop tensor products and localization through universal properties. Units 7–8 cover multilinear algebra, intrinsic trace/determinant, Noetherian rings and modules, Hilbert's theorem, and selected applications in commutative algebra, representation theory, and elementary algebraic geometry.

SU's Swedish and English literature listings retrieved on this date name different advanced-algebra books: Altmann and Kleiman, _A Term of Commutative Algebra_, and Chambert-Loir, _(Mostly) Commutative Algebra_, respectively. Treat these as supplementary references and consult the course offering for its assigned edition. This original package follows the verified syllabus topics rather than assuming either book's chapter order. Sources: #link("https://www.su.se/enheter/matematiska-institutionen/utbildning/ny-student/kurslitteratur")[Swedish literature list] and #link("https://www.su.se/english/divisions/department-of-mathematics/education/new-student/course-literature")[English literature list].

= Diagnostic and prerequisite refreshers

Before beginning, solve these six tasks.

+ State and prove the first isomorphism theorem for rings.
+ Find the inverse of $x$ modulo $x^2+1$ over $QQ$.
+ Prove $x^3-2$ is irreducible over $QQ$ and find the extension degree of its real root.
+ Show the kernel of a linear map is a subspace and explain the image/kernel condition in an exact sequence.
+ State the difference between a generating set and a basis.
+ Explain why a finite-dimensional vector space cannot contain an infinite strictly increasing chain of subspaces.

*Answers and routing.* (1) Send a kernel coset to the image of its representative, prove representative independence, and verify bijectivity and operations. Review MM5020 Unit 5 if this is unclear. (2) The inverse is $-x$, since $-x^2=1$ modulo the polynomial. Review Bézout in Unit 6. (3) Eisenstein at two gives irreducibility and degree three. Review MM5020 Unit 7. (4) The kernel is closed under linear combinations; exactness at the middle means its kernel equals the preceding image. (5) A basis generates with unique finite linear expressions; a generating set can have relations. (6) Dimensions are bounded nondecreasing integers, and equality of dimensions for nested subspaces forces equality.

== Three recurring proof techniques

*Generators and relations:* give generator images, check that every stated relation maps to zero, and prove the induced map is inverse to another map or has the desired universal property. *Localization:* replace an equality of fractions by the existence of a denominator-set element killing the cross-difference. *Finiteness:* identify the finite list that controls a larger object—coefficients of one algebraic equation, generators of an ideal, or coefficients of a bounded-degree polynomial.

For Zorn arguments, do not skip chain properness. For tensor maps, do not define a formula only on pure symbols without checking bilinearity. For exactness, prove both inclusions of image and kernel; the composite being zero proves only one.

= Unit study guides

#block(breakable: false)[
== U1 · Field constructions

#import "../3. Exercises/u01.typ" as practice-u1
#workload(practice-u1.items)

*Objectives U1.1–U1.2:* control minimal polynomials, embeddings, and splitting fields; use Frobenius and finite-field subfields. Read Lectures 1–2 and the U1 sheet.

*Worked example.* In $FF_(2^6)$, the unique subfields of sizes four and eight intersect in $FF_2$. Their intersection degree divides both two and three, hence is one. They generate the whole field: the degree of the generated subfield is a divisor of six divisible by both two and three, hence six. This uses both directions of the subfield theorem.

*Recall:* a root of the minimal polynomial determines an embedding of a simple algebraic extension. The image may be smaller than a separately named target field. *Repair:* splitting-field degree is not always the degree of the original polynomial; adjoining additional roots can enlarge the field.
]

#block(breakable: false)[
== U2 · Existence theorems

#import "../3. Exercises/u02.typ" as practice-u2
#workload(practice-u2.items)

*Extension checkpoint.* Why must a chain union be checked for properness separately from closure?

*Checkpoint answer.* Closure proves it is an ideal; properness excludes the whole ring. If one were in the union, it would already be in one member, contradicting that member's properness.


*Expanded learning route.* Write a two-column checklist for each Zorn argument: closure of a chain union and preservation of the restriction. Use the finite-relation argument for independent sets. Explain why a transcendence basis leaves an algebraic extension rather than necessarily generating the whole field.

*Objectives U2.1–U2.2:* apply Zorn correctly; construct algebraic closures and transcendence bases. Read Lectures 3–4.

*Worked example.* To extend an algebraically independent set $S$ in $L slash K$ to a transcendence basis, order independent supersets of $S$. A chain union is independent because each polynomial relation uses finitely many elements, all lying in one chain member. Maximality forces algebraicity over the generated rational-function field, exactly as in the empty-start proof. The construction retains the originally prescribed set.

*Repair:* a maximal independent set is not the same as a maximal proper subfield. State the poset rather than relying on the word “maximal.” *Recall:* the algebraic-closure construction repeats root adjunction because new coefficients create new equations.
]

#block(breakable: false)[
== U3 · Modules

#import "../3. Exercises/u03.typ" as practice-u3
#workload(practice-u3.items)

*Objectives U3.1–U3.2:* use scalar actions, annihilators, and cyclic modules; compute quotient isomorphisms and simple modules. Read Lectures 5–6.

*Worked example.* The module $M=ZZ slash 18ZZ$ has element $[6]$ with annihilator $3ZZ$, because $18|6r$ exactly when $3|r$. Thus the submodule it generates is $ZZ slash 3ZZ$. The annihilator of the whole module is instead $18ZZ$. Keeping element and module annihilators distinct prevents a common confusion.

*Method choice:* to identify a cyclic module, map $R$ onto it using a generator and compute the kernel. For a quotient comparison, begin with a natural map and use an isomorphism theorem. *Recall:* a $K[x]$-module is a vector space with a chosen linear operator.
]

#block(breakable: false)[
== U4 · Exactness and projectivity

#import "../3. Exercises/u04.typ" as practice-u4
#workload(practice-u4.items)

*Extension checkpoint.* Why can arbitrary lifts violate module structure?

*Checkpoint answer.* A generator may satisfy a relation that its chosen preimage does not. A section of Z→Z/2 would require an odd integer killed by two, which cannot exist.


*Expanded learning route.* Compute both inverse maps in the integer-coordinate splitting. For a nonsplitting example, identify the relation a chosen lift would violate. In the optional challenge verify a lift by repairing it with an idempotent, then distinguish projective from free.

*Objectives U4.1–U4.2:* distinguish sums, products, and presentations; construct splittings and use the projective lifting property. Read Lectures 7–8.

*Worked example.* The sequence $0 -> 2ZZ -> ZZ -> ZZ slash 2ZZ ->0$ is exact. It is not a direct-sum decomposition: any map from the quotient back to $ZZ$ must send its order-two generator to a torsion element, but $ZZ$ has no nonzero torsion. Exactness alone does not supply a section.

*Repair:* “choose preimages and extend linearly” is justified for a free source with a specified basis. For a module with relations, arbitrary choices may violate the relations. *Recall:* projective means every such lifting problem has a solution, not necessarily a unique one.
]

#block(breakable: false)[
== U5 · Tensor products

#import "../3. Exercises/u05.typ" as practice-u5
#workload(practice-u5.items)

*Extension checkpoint.* Why does the cyclic tensor example need a reverse map?

*Checkpoint answer.* A generator-and-relation argument gives a quotient and hence an upper bound. The balanced map to Z/2 shows the candidate generator survives and certifies the exact tensor.


*Expanded learning route.* Check representative independence and balancing separately for the quotient isomorphism. In the cyclic example build the reverse map to certify nonvanishing. Use a presentation, rather than guessed bases, for the new coefficient-change challenge.

*Objectives U5.1–U5.2:* linearize bilinear maps; compute with quotient presentations and right exactness. Read Lectures 9–10.

*Worked example.* Over $ZZ$, $ZZ slash 10ZZ otimes ZZ slash 6ZZ$ is $ZZ slash 2ZZ$. One route is to quotient $ZZ slash 6ZZ$ by its multiples of ten. Since ten acts as four modulo six, its image is $\{0,2,4\}$, leaving a two-element quotient. The general gcd formula expresses the same calculation using ideals.

*Repair:* replacing a tensor by a pair gives the wrong algebra. For instance $ZZ slash 2ZZ otimes ZZ slash 3ZZ=0$ even though the Cartesian product has six elements. *Recall:* the image of $A otimes N$ in $B otimes N$ need not be an embedded copy when $A -> B$ is injective.
]

#block(breakable: false)[
== U6 · Localization

#import "../3. Exercises/u06.typ" as practice-u6
#workload(practice-u6.items)

*Extension checkpoint.* What replaces cancelling a denominator when checking exactness?

*Checkpoint answer.* A zero fraction supplies an element of the multiplicative set annihilating the numerator. Move that witness through the module map and use original exactness.


*Expanded learning route.* Give an explicit witness for each fraction equality. In the exactness proof mark the point where a witness is moved inside g and where original exactness supplies a numerator lift. Compare the two localizations of the square-zero module before attempting the two-view challenge.

*Objectives U6.1–U6.2:* use fraction equality and universal properties; preserve exactness and identify the tensor description. Read Lectures 11–12.

*Worked example.* Localizing $ZZ slash 12ZZ$ by powers of three leaves $ZZ slash 4ZZ$: the factor three becomes invertible, so the relation $12=0$ becomes $4=0$. By contrast localizing by powers of six gives the zero ring, because a power of six is already zero modulo twelve. The denominator set itself can force total collapse.

*Method choice:* for a localized element to vanish, find one allowed scalar killing its numerator. For a finitely generated module to vanish, combine finitely many such scalars into one. *Recall:* detecting that a module is zero at all maximal ideals does not require finite generation; the proof works one element at a time.
]

#block(breakable: false)[
== U7 · Multilinear invariants

#import "../3. Exercises/u07.typ" as practice-u7
#workload(practice-u7.items)

*Objectives U7.1–U7.2:* use exterior powers and alternating maps; define intrinsic determinant and trace on finite projectives. Read Lectures 13–14.

*Worked example.* If $T(v)=phi(v)u$, then its trace is $phi(u)$. In a dual basis $(m_i,psi_i)$, expand the trace to $sum_i phi(m_i)psi_i(u)$, and recognize the result of applying $phi$ to $u=sum_i psi_i(u)m_i$. This works even when the module has no ordinary global basis.

*Repair:* in characteristic two, skew symmetry alone does not imply alternation. The defining relation is repeated-input vanishing. *Recall:* for a finite locally free module of constant rank, the determinant is intrinsically an endomorphism of the top exterior line; a basis gives its scalar description.
]

#block(breakable: false)[
== U8 · Noetherian control and applications

#import "../3. Exercises/u08.typ" as practice-u8
#workload(practice-u8.items)

*Extension checkpoint.* Which earlier theorem justifies the bounded-degree generators in Hilbert's proof?

*Checkpoint answer.* The exact-sequence criterion gives Noetherianity of finite free modules. Their submodules, including the low-degree part of the ideal, are then finitely generated.


*Expanded learning route.* Reconstruct the exact-sequence lemma before using bounded-degree submodules. Work the ideal (2,x) example to locate the missing base case in a leading-coefficient-only argument. Treat problem 12 as proof reconstruction and problem 13 as transfer to a subring.

*Objectives U8.1–U8.2:* transfer Noetherianity and prove Hilbert's theorem; combine quotient, localization, and specialization methods. Read Lectures 15–16.

*Worked example.* A presentation $R arrow.r^(times x) R -> M ->0$ over $R=K[x]$ gives $M=R slash (x)$. At the maximal ideal $(x)$, tensoring with the residue field turns the matrix entry $x$ into zero, so the specialized cokernel is $K$. At $(x-1)$, that entry becomes one, so the specialized cokernel is zero. The same presentation has different fibers.

*Repair:* a Noetherian ring need not be a domain, a PID, or a field. The condition controls ideals' finite generation. *Recall:* Hilbert's proof needs both leading-coefficient generators and a finitely generated bounded-degree remainder module.
]

= Checkpoint answers and assessment

*1.1:* a field-map kernel is a proper ideal and hence zero. *1.2:* subfield sizes are two, four, eight, sixty-four. *2.1:* containing one detects an improper ideal. *2.2:* new coefficients require additional root adjunctions. *3.1:* the annihilator is $12ZZ$. *3.2:* the submodule generated by three is proper and nonzero. *4.1:* all free modules over the zero ring vanish. *4.2:* lift the identity of the free quotient.

*5.1:* scalar movement is bilinearity. *5.2:* $QQ slash n QQ=0$. *6.1:* nonprimality allows a product of two excluded elements to enter the ideal. *6.2:* multiply the finitely many generator annihilators. *7.1:* expand the alternating expression on a sum, without dividing by two. *7.2:* use cyclic trace and multiplicative determinant. *8.1:* the chain generated by successively more variables does not stabilize. *8.2:* cokernels survive specialization, but injectivity may fail.

For each mock problem, award up to four practice points: one for a correct setup with explicit hypotheses, two for the main argument, and one for complete well-definedness, uniqueness, or the final conclusion. There are no official grade thresholds attached to this rubric. Classify errors by missing hypotheses, incorrect universal-property use, failure of exactness, or computation; then redo one related unit problem.

= Notation and glossary
#table(columns:(auto,1fr,1fr),inset:5pt,
 [English / notation],[Swedish],[Meaning],
 [splitting field],[splittringskropp],[Field generated by all roots],
 [algebraic closure],[algebraisk tillslutning],[Algebraic and algebraically closed extension],
 [transcendence basis],[transcendensbas],[Independent set over which the extension is algebraic],
 [module / submodule],[modul / delmodul],[Linear structure over a ring],
 [annihilator],[annihilator],[Scalars killing an element or module],
 [direct sum / product],[direkt summa / produkt],[Finite-support / arbitrary tuples],
 [presentation],[presentation],[Generators with generating relations],
 [exact sequence],[exakt följd],[Image equals the next kernel],
 [projective / flat],[projektiv / flat],[Lifting property / tensor preserves injections],
 [tensor product],[tensorprodukt],[Universal recipient of bilinear maps],
 [localization],[lokalisering],[Inverting selected scalars],
 [exterior power],[yttre potens],[Universal alternating construction],
 [trace / determinant],[spår / determinant],[Intrinsic endomorphism invariants],
 [Noetherian],[noethersk],[Ascending chains stabilize],
 [Hilbert basis theorem],[Hilberts bassats],[Polynomial rings preserve Noetherianity],
)
