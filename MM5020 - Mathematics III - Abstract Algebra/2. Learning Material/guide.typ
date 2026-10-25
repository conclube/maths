#import "/shared/book.typ": *
= Start here

This course studies what survives when familiar calculations are replaced by axioms. Its central working habit is to translate between a concrete example and a structural statement. A quotient should come with a map; a theorem should come with hypotheses; a proof should explain why the construction is well defined.

Plan approximately 10–13 hours per unit: three–five hours for the two lectures and worked examples, six hours for all twelve core exercise attempts, and one–two hours for revision. Split this work into sessions that suit you. For the most demanding proofs, especially normalization, Yoneda, Zorn's lemma, and Hilbert's theorem, allow three additional hours of reading and reconstruction. The optional transfer challenge has a separate 60-minute attempt estimate plus about 30 minutes of review. These are initial planning estimates, not measured student completion times; record your actual time and adjust future units.

Use three passes through a difficult proof. First identify the claim and why it is plausible. Second mark the role of every hypothesis. Third close the text and reconstruct the argument. When stuck, write the missing intermediate claim rather than rereading the entire proof. In the exercise bank, Hint 1 suggests a route; Hint 2 supplies the decisive move. Stop reading hints as soon as you can continue.

The difficulty labels describe reasoning demand. E requires correct university-level definitions and short proofs. C combines familiar methods. A asks for synthesis, generalization, or a new construction within the course. They do not predict an official examination grade.

== Sources and alignment

Course identity and scope: #link("https://www.su.se/utbildning/utbildningskatalog/mm/mm5020")[Stockholm University course catalogue, MM5020]. Syllabus baseline: #link("https://albatross.it.su.se/api/education/educationplan/pdf/MM5020/HT2015/en")[Mathematics III – Abstract Algebra, valid from autumn 2015]. Retrieved 24 October 2026. The published prerequisites include undergraduate linear algebra and algebra/combinatorics. This package supplies targeted refreshers rather than replacing those courses.

The university's #link("https://www.su.se/enheter/matematiska-institutionen/utbildning/ny-student/kurslitteratur")[literature list] names Dummit and Foote, _Abstract Algebra_, as course literature. It is a supplementary reference for definitions and broader examples here; these notes and problems are original. Lecture numbering, study routes, and mock assessments are independently designed.

The syllabus asks students to define algebraic concepts, prove basic results, and solve mathematical and applied problems. Units 1–4 cover groups, cosets, permutations, homomorphisms, normality, quotients, and simple groups. Units 5–6 cover matrix rings, quaternions, ideals, polynomial rings, Euclidean domains, PIDs, and unique factorization. Units 7–8 cover fraction fields, finite-dimensional vector spaces, algebraic extensions, and finite fields. The evaluation-code application in Unit 8 connects these strands.

= Diagnostic and prerequisite bridge

Attempt these without the lecture book. A complete argument matters more than speed.

+ State the negation of “for every $x$, there exists $y$ with $P(x,y)$.”
+ Prove that an injective function between finite sets of equal size is surjective.
+ Compute $gcd(84,30)$ and express it as a linear combination.
+ Prove that congruence modulo $n$ is an equivalence relation.
+ Explain why the vectors $(1,0)$ and $(1,1)$ form a basis of $QQ^2$.
+ Find the determinant and inverse of $mat(1,2;0,1)$.
+ Prove $sqrt(2)$ is irrational.
+ State the difference between proving an implication and proving its converse.

== Diagnostic solutions and routing

+ The negation is “there exists $x$ such that for every $y$, $P(x,y)$ is false.” Quantifiers reverse and the predicate is negated.
+ Injectivity makes the image have the same number of elements as the domain. This equals the target size, so no target element can be missing. Review this argument before finite-domain and Frobenius proofs.
+ $84=2 dot 30+24$, $30=24+6$, hence $6=30-(84-2dot 30)=3dot 30-84$. This is the model for polynomial Bézout calculations.
+ Reflexivity uses $n|0$; symmetry uses negation of a multiple; transitivity uses addition of two multiples. This is the foundation for all quotient constructions.
+ The equation $a(1,0)+b(1,1)=(u,v)$ has the unique solution $b=v,a=u-v$, proving spanning and independence.
+ The determinant is one and inverse is $mat(1,-2;0,1)$. Verify both products are the identity.
+ If $sqrt(2)=a/b$ in lowest terms, $a^2=2b^2$ makes $a$ even; substituting $a=2c$ makes $b$ even too, contradicting lowest terms.
+ “$P$ implies $Q$” starts with $P$; the converse starts with $Q$. Lagrange supplies a divisibility condition, not the converse existence of a subgroup.

If items 1, 4, or 8 are difficult, first practice unpacking definitions and proving both directions of an equivalence. If 3 or 7 is difficult, review divisibility, primes, and integer division. If 5 or 6 is difficult, review bases, linear maps, and determinants before Units 5 and 7.

== Five proof patterns

*Subgroup or ideal:* establish nonemptiness, closure under the appropriate differences, and any additional absorption. *Quotient:* define a formula on representatives, prove independence of representatives, then verify the required operation. *Isomorphism:* exhibit a map and prove its properties, often by kernel and image. *Existence by minimality:* choose the least positive exponent or least Euclidean size and use division to contradict a nonzero remainder. *Counting:* specify the partition or bijection before equating cardinalities.

= Unit study guides

#block(breakable: false)[
== U1 · Groups and cyclic structure

#import "../3. Exercises/u01.typ" as practice-u1
#workload(practice-u1.items)

*Objectives U1.1–U1.2:* use group axioms and cancellation; identify subgroups, generators, and orders. Read Lectures 1–2, then U1.01–U1.12.

*Worked example.* In $ZZ slash 20 ZZ$, solve $3x=5$. Since $3 dot 7=1$ modulo twenty, multiply by seven to obtain $x=35=15$. Substitution gives $3dot 15=45=5$. This is a group endomorphism with a unique solution because multiplication by three is invertible.

*Decision guide.* For a subgroup of a general group, use $a b^(-1)$. For a subgroup of a cyclic group, use exponent arithmetic. For an order, find the least exponent giving the identity, not merely some exponent.

*Retrieval and repair.* Prove uniqueness of inverses without looking. Then explain why the nonzero integers fail to form a multiplicative group. Answer: inverses need not remain integers. A correct argument separates identity, closure, and inverses rather than saying vaguely that the set is “not closed.”
]

#block(breakable: false)[
== U2 · Cosets and permutations

#import "../3. Exercises/u02.typ" as practice-u2
#workload(practice-u2.items)

*Objectives U2.1–U2.2:* reason with coset partitions and Lagrange; compute and classify permutation cycles. Read Lectures 3–4, then the U2 sheet.

*Worked example.* In $S_3$, let $H=\{e,(12)\}$. The left coset $(13)H$ is $\{(13),(123)\}$, while $H(13)=\{(13),(132)\}$. These differ, but both have two elements because left and right multiplication are bijections. This explains why coset counting works before normality.

*Decision guide.* Equality of cosets becomes a membership statement such as $b^(-1)a in H$. Order of a permutation becomes an lcm. Parity becomes a product of signs. Do not mix these calculations.

*Cumulative recall.* Why is every group of order seven cyclic? A nonidentity generated subgroup has order greater than one and dividing seven. Why does the same argument fail at order eight? Proper nontrivial divisors are now available.
]

#block(breakable: false)[
== U3 · Homomorphisms and quotients

#import "../3. Exercises/u03.typ" as practice-u3
#workload(practice-u3.items)

*Extension checkpoint.* Which step makes quotient multiplication independent of representatives?

*Checkpoint answer.* Normality puts the conjugate of a subgroup element back in the subgroup. Closure then shows the replacement product differs by a subgroup element on the right.


*Expanded learning route.* Work the two representative-change calculations before reading the isomorphism theorem again. Explain separately why the induced map is well defined, injective, and onto its image. The new optional challenge combines quotient arithmetic with a cyclic-kernel argument.

*Objectives U3.1–U3.2:* compute kernels and establish normality; construct and identify quotient groups. Read Lectures 5–6.

*Worked example.* The map $f:ZZ slash 18 ZZ -> ZZ slash 6 ZZ$ given by reduction is well defined because a difference divisible by eighteen is divisible by six. It is onto. Its kernel is $\{[0],[6],[12]\}$. Thus the quotient by this three-element subgroup is the six-element cyclic group. Each line has a separate role: well-definedness, image, kernel, conclusion.

*Proof repair.* “There are six cosets, so the quotient is $S_3$” is invalid: cardinality alone does not identify a group. The quotient here is cyclic because it is the image of a cyclic group, whereas $S_3$ is nonabelian.

*Retrieval.* Explain why every normal subgroup is a kernel. Answer: it is the kernel of the canonical quotient projection. Reconstruct the multiplication well-definedness argument before attempting U3.10.
]

#block(breakable: false)[
== U4 · Actions and simple groups

#import "../3. Exercises/u04.typ" as practice-u4
#workload(practice-u4.items)

*Extension checkpoint.* Why are cycle-type counts not yet the conjugacy-class sizes in A5?

*Checkpoint answer.* The centralizer must be computed in A5. The five-cycles split into two classes of twelve, so a normal-subgroup count must use both classes separately.


*Expanded learning route.* Reconstruct the orbit map as a well-defined bijection before using its numerical consequence. Make a table of cycle type, centralizer order, and class size for A5. Check the same method on S3 to see which conclusions are necessary conditions only.

*Objectives U4.1–U4.2:* use orbit–stabilizer and fixed-point counts; use conjugacy classes and simplicity. Read Lectures 7–8.

*Worked example.* $S_4$ acts transitively on the six unordered pairs of four letters. The stabilizer of $\{1,2\}$ can independently swap its two elements and the two elements of its complement, giving four permutations. Hence the orbit has $24/4=6$ points. Ordered pairs would give a different action and stabilizer.

*Decision guide.* Use ordinary stabilizers for an external action; use centralizers for conjugation. A normal subgroup must contain the whole conjugacy class of each of its elements. To prove simplicity by class sizes, also enforce divisibility of subgroup order.

*Retrieval.* What distinguishes a faithful action from a transitive action? Faithfulness concerns the kernel; transitivity concerns the number of orbits. Neither implies the other in general. The trivial action on a singleton is transitive and not faithful for a nontrivial group.
]

#block(breakable: false)[
== U5 · Rings and ideals

#import "../3. Exercises/u05.typ" as practice-u5
#workload(practice-u5.items)

*Objectives U5.1–U5.2:* distinguish units, domains, and division rings; construct ideals and quotient rings. Read Lectures 9–10.

*Worked example.* In $QQ[x]$, the ideal $(x^2-1)$ is not prime because $(x-1)(x+1)$ belongs to it while neither factor does. In the quotient, the corresponding two nonzero classes multiply to zero. These are the same obstruction expressed in the ring and in its quotient.

*Decision guide.* A unit is about multiplication inside the ring. An ideal is about addition plus multiplication by arbitrary ring elements. A subring need not be an ideal: $ZZ$ is a subring of $QQ$, but multiplying one by $1/2$ leaves it.

*Retrieval.* Why is every maximal ideal prime in a commutative ring? Its quotient is a field and hence a domain. Name the hypothesis “commutative” rather than silently extending this criterion to arbitrary one-sided ideals.
]

#block(breakable: false)[
== U6 · Factorization

#import "../3. Exercises/u06.typ" as practice-u6
#workload(practice-u6.items)

*Extension checkpoint.* Why does a common divisor not settle whether an ideal is the whole ring?

*Checkpoint answer.* Divisibility and linear combination are different. In a PID principality and Bézout connect them; the ideal (2,x) in the UFD Z[x] shows the distinction.


*Expanded learning route.* Compute the Euclidean remainders and recover the Bézout identity without looking. Then identify the exact use of principality in the prime-irreducible proof. Use the optional pair of quartics to distinguish a root test from an irreducibility proof.

*Objectives U6.1–U6.2:* use division and Bézout; prove and apply irreducibility and unique-factorization results. Read Lectures 11–12.

*Worked example.* Over $FF_2$, $x^2+x+1$ has no root because its values at zero and one are one. It is therefore irreducible. Over $FF_3$, it equals $(x-1)^2$, since $-2=1$. Irreducibility is a property relative to the coefficient field.

*Method selection.* Degree two or three: test roots. Primitive integer polynomial: try reduction modulo a prime, Eisenstein, or a shift followed by Eisenstein. Quotient inverse: use Euclidean division and Bézout. A degree-four polynomial with no roots still needs another argument.

*Retrieval.* Explain every implication in Euclidean ⇒ PID ⇒ UFD. For each step identify the new tool: minimal Euclidean size, then Bézout plus the ascending chain condition. U6.12 shows why UFD does not imply PID.
]

#block(breakable: false)[
== U7 · Field extensions

#import "../3. Exercises/u07.typ" as practice-u7
#workload(practice-u7.items)

*Extension checkpoint.* Why are four spanning terms not proof of degree four?

*Checkpoint answer.* Spanning gives an upper bound. Independence, here obtained by excluding one radical from the first quadratic field and applying the tower law, supplies the matching lower bound.


*Expanded learning route.* Perform an inverse calculation in a quotient before using minimal polynomials abstractly. Reconstruct both spanning and independence in the tower-basis proof. Then revisit problem 12 and its separate certification of the minimal polynomial's degree.

*Objectives U7.1–U7.2:* use fraction fields and degrees; compute minimal polynomials and arithmetic in algebraic extensions. Read Lectures 13–14.

*Worked example.* If $alpha^2=2$ and $beta=3+alpha$, then $alpha=beta-3$ shows $QQ(alpha)=QQ(beta)$. The polynomial $(x-3)^2-2=x^2-6x+7$ vanishes at $beta$. Since the generated field has degree two, this monic quadratic is minimal. This method combines a generator change with a degree argument.

*Decision guide.* To find a minimal polynomial, first find a relation, then prove minimality. To find a degree in a tower, establish each relative degree; a polynomial that annihilates an element gives only an upper bound until irreducibility is known.

*Retrieval.* Why does “algebraic” not automatically mean “finite extension”? Each element may require a finite extension, but infinitely many generators can produce an extension of unbounded finite subdegrees. Advanced Algebra returns to this distinction.
]

#block(breakable: false)[
== U8 · Finite fields

#import "../3. Exercises/u08.typ" as practice-u8
#workload(practice-u8.items)

*Extension checkpoint.* Where does the finite-field existence proof establish the exact size?

*Checkpoint answer.* Splitting provides all roots of X^q-X, and its derivative minus one makes them distinct. Closure proves they form a field, and the polynomial degree then gives exactly q elements.


*Expanded learning route.* Build the four-element field explicitly and compute Frobenius on all its elements. In the existence proof distinguish closure, splitting, and absence of repeated roots. For the optional challenge use a root bound to handle characteristic two as well as odd characteristic.

*Objectives U8.1–U8.2:* construct and distinguish finite fields; use multiplicative cyclicity, Frobenius, and interpolation. Read Lectures 15–16.

*Worked example.* In $FF_3[alpha]$ with $alpha^2=-1=2$, $(1+alpha)^2=1+2alpha+2=2alpha$. Squaring again gives $(1+alpha)^4=(2alpha)^2=4dot 2=2$, and the eighth power is one. Its order is eight because its fourth power is not one and every proper divisor of eight divides four. It therefore generates the nonzero elements of this nine-element field.

*Decision guide.* Cardinality uses dimension over the prime field. Multiplicative order uses the group of nonzero elements. Polynomial equality is stronger than equality as functions on a finite field. The example $x^q-x$ separates these notions.

*Cumulative task.* Reconstruct the path from the ideal $(x^2+1)$ in $FF_3[x]$ to a field, then a vector-space basis, then the cyclic multiplicative group. This uses Units 5, 6, 7, and 8 together.
]

= Checkpoint answers and oral practice

Lecture checkpoints are collected here so they can be attempted before reading solutions.

*1.1:* $a b=e$ gives $b=a^(-1)$. *1.2:* subgroups of $ZZ$ are $d ZZ$, using the least positive element. *2.1:* six does not divide thirty-five. *2.2:* a four-cycle has order four and sign negative. *3.1:* a nontrivial map from $C_p$ has trivial kernel. *3.2:* elements of $N$ must map to the identity coset modulo $M$. *4.1:* in left multiplication, fixing $e$ forces the element to be $e$. *4.2:* the class equation makes the center nontrivial.

*5.1:* injectivity does not imply surjectivity on an infinite set. *5.2:* $(0)$ is prime but not maximal in $ZZ$. *6.1:* any proposed generator of $(2,x)$ would be a unit, although the ideal is proper. *6.2:* Gauss plus degree preservation makes any factorization survive reduction. *7.1:* two cannot divide five in the tower law. *7.2:* the base-field-dependent polynomials are $x^2-2$ and $x-sqrt(2)$. *8.1:* the residue ring modulo four has a nonzero zero divisor. *8.2:* at most three zeros, hence at least four differing coordinates out of seven.

Practice explaining these eight topics aloud in five minutes each. A satisfactory explanation gives a precise statement, one example, and the core proof step.

+ Why the subgroup test works: show identity, inverses, then products.
+ Why cosets partition a group: one intersection forces equality.
+ Why quotient multiplication needs normality: move a subgroup element past a representative using conjugation.
+ Why orbit–stabilizer is a bijection: equality of orbit points is exactly equality of stabilizer cosets.
+ Why maximal ideals give fields: $M+(a)=R$ supplies an inverse modulo $M$.
+ Why a PID has unique factorization: Bézout gives prime irreducibles; ascending ideals give existence.
+ Why minimal-polynomial degree equals extension degree: remainders span and minimality gives independence.
+ Why finite-field orders are prime powers: identify the prime field and choose a vector-space basis.

= Reference and self-assessment

== Notation and terminology
#table(columns: (auto,1fr,1fr), inset: 5pt,
  [Notation / English], [Swedish], [Meaning],
  [$H<=G$ / subgroup], [delgrupp], [A group under the restricted operation],
  [$g H$ / coset], [sidoklass], [A translate of a subgroup],
  [$N triangleleft G$ / normal subgroup], [normal delgrupp], [Invariant under conjugation],
  [kernel], [kärna], [Elements mapped to the identity or zero],
  [quotient group / quotient ring], [kvotgrupp / kvotring], [Operations on equivalence classes],
  [ideal], [ideal], [Additive subgroup absorbing ring multiplication],
  [field / division ring], [kropp / skevkropp], [Nonzero elements have inverses; field is commutative],
  [integral domain], [integritetsområde], [Commutative nonzero ring without zero divisors],
  [irreducible / prime], [irreducibel / prim], [Factorization condition / divisibility condition],
  [principal ideal domain], [principalidealring], [Domain in which every ideal is principal],
  [field extension], [kroppsutvidgning], [An inclusion of fields],
  [minimal polynomial], [minimalpolynom], [Monic generator of an evaluation kernel],
  [finite field], [ändlig kropp], [A field with finitely many elements],
)

== Assess a proof, not just an answer

For each mock problem, award yourself up to four practice points: one for a valid setup and named hypotheses, two for the central argument, and one for a complete conclusion with no hidden well-definedness gap. This rubric is a study aid and has no official SU grade thresholds. Record each error as a missing definition, an invalid inference, a calculation mistake, or an omitted hypothesis; then redo a related unit problem without notes.

Before continuing to Category Theory or Advanced Algebra, you should be able to construct a quotient from a map, prove the first isomorphism theorem, use polynomial Bézout, and compute an elementary field extension. Revisit U3, U6, and U7 if those tasks still require hints.
