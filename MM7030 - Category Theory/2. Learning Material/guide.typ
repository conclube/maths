#import "/shared/book.typ": *
= How to study category theory

Category theory rewards precise bookkeeping before cleverness. Write every arrow's source and target. Expand a universal property into three questions: what data are given, what map must exist, and why is it unique? When working with a functor, specify its action on arrows as carefully as its action on objects. These habits are more useful than memorizing diagrams without their meaning.

Use four sessions for each of the eight units: first lecture with examples; second lecture with proof reconstruction; E/C exercises; delayed retrieval and A exercises. Spend part of each session drawing a diagram from a verbal statement and translating a diagram back into equations. For advanced problems, a correct type diagram often contains most of the solution.

The E/C/A labels indicate increasingly independent reasoning within university mathematics. They are not official SU grade criteria. Attempt a problem before using Hint 1, and return to it before revealing Hint 2. In the solutions, compare your argument's structure, not just its final formula.

== Sources, prerequisites, and coverage

Baseline: #link("https://albatross.it.su.se/api/education/educationplan/pdf/MM7030/HT2020/en")[SU syllabus MM7030, Category Theory, valid from autumn 2020], retrieved 24 October 2026. Its topics are categories, functors, natural transformations, limits and colimits, representability and Yoneda, adjunctions, and algebraic examples. Units 1–3, 4–5, 6, 7, and 8 respectively develop those themes. Its learning outcomes require definitions and theorems, application and generalization, and basic proof construction; each unit sheet includes all three forms of work.

The syllabus requires knowledge equivalent to MM5020. Review homomorphisms, kernels, quotient groups, vector spaces, and ideals before beginning. SU's #link("https://www.su.se/enheter/matematiska-institutionen/utbildning/ny-student/kurslitteratur")[literature list] names Tom Leinster, _Basic Category Theory_. It is useful supplementary reading, especially for alternative examples. These lectures, exercises, and mock assessments are independently authored and do not reproduce an official course schedule.

We work with locally small categories and small indexing diagrams. An assertion about all small limits does not claim that a limit indexed by a proper class exists. In equivalence arguments, choices of representatives are allowed when needed. Category names such as sets and groups denote the usual large categories with set-sized hom collections.

= Diagnostic and bridge

Try the following six tasks before reading the answers.

+ Give a function that is injective but not surjective, and one that is surjective but not injective.
+ Prove the inverse of a bijective group homomorphism is a homomorphism.
+ Explain the universal property of a quotient group by a normal subgroup.
+ Describe all linear maps $K^2 -> V$ in terms of two vectors of $V$.
+ Prove inverse image of an intersection is the intersection of inverse images.
+ Explain why two objects being isomorphic is weaker than being equal.

*Answers.* (1) The inclusion $NN -> ZZ$ and a constant map from a two-element set to a singleton are examples. (2) For $x=f(a),y=f(b)$, $f^(-1)(x y)=a b=f^(-1)(x)f^(-1)(y)$. (3) Maps killing the normal subgroup factor uniquely through the quotient; prove the formula on cosets is representative-independent. (4) The images of the two standard basis vectors can be chosen arbitrarily, and linearity gives the unique extension. (5) Membership in either side says that the image lies in both subsets. (6) Two different singleton sets admit a unique bijection but need not be the same set.

If quotient factorization or linear extension is unfamiliar, revisit Abstract Algebra Units 3 and 7. If function direction causes errors, practice writing compositions with their types before proceeding. The set examples in Units 1 and 4 are an essential foundation, not optional motivation.

== A reusable proof worksheet

For a proposed universal construction, write: *candidate object; structural arrows; compatibility equations; arbitrary competing data; mediator formula; verification; uniqueness*. For a natural transformation, write: *component type; arbitrary test arrow; left composite; right composite; equality*. For an adjunction, write: *two hom sets; forward map; backward map; two inverse checks; naturality in each variable*. Use these as working notes, then turn them into connected prose.

= Eight unit guides

== U1 · Categories and duality
*Objectives U1.1–U1.2:* verify category axioms and inverses; use opposites and cancellation. Read Lectures 1–2 and complete the U1 sheet.

*Worked example.* In the divisibility poset of positive integers, an arrow $a -> b$ means $a|b$. Every arrow is monic and epic because parallel arrows are unique. An arrow is invertible only when $a|b$ and $b|a$, forcing $a=b$. Thus “mono plus epi implies iso” is not a purely categorical theorem.

*Repair a proof.* If a proposed argument cancels an arrow without saying it is monic or epic, identify which cancellation property it needs. If it uses an inverse, establish the inverse first. *Recall:* in a one-object category, associativity and identity are exactly the monoid axioms.

== U2 · Functors and equivalences
*Objectives U2.1–U2.2:* define arrow assignments and verify functor laws; distinguish full, faithful, and essentially surjective. Read Lectures 3–4.

*Worked example.* The inclusion of the discrete category with objects zero and one into the ordered category $0<1$ is faithful, since each source hom set has at most one element. It is not full: the target has an arrow $0 -> 1$ that the source lacks. It is surjective on objects but not an equivalence. This separates object coverage from morphism coverage.

*Method choice.* To prove a functor full or faithful, fix two objects and inspect the induced hom-set function. To prove essential surjectivity, construct an isomorphism to an image object. *Recall:* a functor preserves isomorphisms by applying it to inverse equations; this does not automatically extend to arbitrary monos or epis.

== U3 · Natural transformations
*Objectives U3.1–U3.2:* prove naturality and identify natural isomorphisms; compose transformations and interpret functor categories. Read Lectures 5–6.

*Worked example.* Let $S$ be fixed and choose $s in S$. The maps $eta_X:X -> X times S$ given by $x |->(x,s)$ are natural: after any $f:X -> Y$, both routes send $x$ to $(f(x),s)$. Choosing a different element of $S$ gives a different natural family. Naturality means compatibility, not necessarily uniqueness.

*Repair a proof.* Verifying naturality at identities proves almost nothing: identities satisfy the square automatically for any component family. Test a general arrow. *Cumulative recall:* an action of a group is a functor from its one-object category; an equivariant map is a natural transformation.

#pagebreak()

== U4 · Universal properties
*Objectives U4.1–U4.2:* use products and terminal objects; dualize to coproducts and free objects. Read Lectures 7–8.

*Worked example.* A product of $A$ with a terminal object $1$ is isomorphic to $A$. The projection $p:A times 1 -> A$ has inverse $s=chevron.l 1_A,!chevron.r$. One composite is visibly the identity; the other has the same two projections as the identity, so product uniqueness proves it is the identity. This is a proof by structural maps, valid without elements.

*Repair a proof.* “There is an isomorphism because both are products” should state what is preserved: the isomorphism must commute with the projections. Arbitrary automorphisms of the underlying object need not do so. *Recall:* finite direct sums are both products and coproducts of vector spaces, but this fails for infinite families.

== U5 · Limits and colimits
*Objectives U5.1–U5.2:* compute cones, equalizers, and pullbacks; construct colimits through identifications. Read Lectures 9–10.

*Worked example.* For maps $f,g:A -> B$, the equalizer in sets is $E=\{a:f(a)=g(a)\}$. To prove universality, start with an arbitrary $u:X -> A$ satisfying $f u=g u$. Every $u(x)$ lies in $E$, so the same function with restricted codomain is a factor. The inclusion's injectivity proves uniqueness. Each sentence corresponds to one clause of the universal property.

*Method choice.* Limits in sets use compatible tuples. Colimits use tagged unions modulo generated equivalence relations. The word “generated” matters because listed identifications must be closed under equivalence. *Recall:* a kernel is an equalizer with a zero map in a category where zero maps exist; equalizers need not be normal subgroups in general.

== U6 · Representability and Yoneda
*Objectives U6.1–U6.2:* calculate the Yoneda bijection; recognize representations and universal elements. Read Lectures 11–12.

*Worked example.* Natural unary operations on underlying groups are exactly integer powers. The underlying-set functor is $"Grp"(ZZ,-)$. Yoneda says an endotransformation is determined by an integer $n$. At $g in G$, the selecting homomorphism $ZZ -> G$ sends $n$ to $g^n$. Thus the operation is $g |-> g^n$. It is natural as a function on underlying sets even though it need not be a group homomorphism.

*Proof recipe.* Evaluate a transformation on the identity of the representing object, then reconstruct it on a general arrow. *Variance check:* transformations between covariant representables reverse the direction between representing objects; transformations between contravariant representables preserve it. Recompute the direction from types rather than memorizing a slogan.

#pagebreak()

== U7 · Adjunctions
*Objectives U7.1–U7.2:* construct natural hom-set bijections; recover unit, counit, and triangle identities. Read Lectures 13–14.

*Worked example.* Inclusion $i:ZZ -> RR$ has floor as a right adjoint and ceiling as a left adjoint. Indeed $i(n)<=x$ iff $n<=floor(x)$, while $ceil(x)<=n$ iff $x<=i(n)$. Writing these inequalities prevents reversing the adjunctions. The unit for $i tack.l floor$ is equality $n=floor(i(n))$; the counit is $i(floor(x))<=x$.

*Proof recipe.* For a map out of a free object, restriction and extension are the two halves of the bijection. For products and exponentials, use currying and evaluation. *Recall:* an adjunction need not be an equivalence; the unit and counit can fail to be isomorphisms.

== U8 · Preservation and applications
*Objectives U8.1–U8.2:* transport limits through right adjoints and colimits through left adjoints; connect abelianization and function objects to universal properties. Read Lectures 15–16.

*Worked example.* The forgetful functor from vector spaces to sets preserves the terminal object: the zero vector space has a singleton underlying set. The free-vector-space functor preserves the initial object: the free space on the empty set is zero. The free space on a singleton is one-dimensional, showing it does not preserve terminal objects. These checks agree exactly with the direction of the adjunction.

*Cumulative task.* Derive the canonical isomorphism $F(A coproduct B) iso F(A) oplus F(B)$ twice: once by explicit basis maps and once by a chain of natural hom-set bijections. The first proves the construction concretely; the second shows why it is forced.

= Checkpoints and assessment

*1.1:* isomorphism in a poset means equality. *1.2:* every poset arrow is mono and epi. *2.1:* dual maps reverse direction, $W^* -> V^*$. *2.2:* essential surjectivity allows isomorphic replacements. *3.1:* a fixed chosen $s_0$ gives a natural insertion; an empty $S$ prevents it. *3.2:* a component $h$ conjugates the two group homomorphisms. *4.1:* the product is gcd, six. *4.2:* finite support ensures the defining sum is meaningful.

*5.1:* a poset has no distinct parallel arrows. *5.2:* the vector-space coequalizer is the quotient by the image of the difference. *6.1:* the identity transformation corresponds to $1_A$. *6.2:* the image of one determines a map from $ZZ$. *7.1:* curry to $a |-> f(b,a)$. *7.2:* the counit is evaluation. *8.1:* a left adjoint need not preserve terminal objects. *8.2:* compatibility with the specified structural arrows makes an isomorphism canonical.

For each mock problem, use four practice points: one for correctly typed setup and hypotheses, two for the central construction or argument, and one for uniqueness, naturality, or the conclusion where required. These are self-assessment points, with no official grade thresholds. After each mock, select one missed proof and rewrite it without element notation where possible.

You are ready for categorical models in Type Theory when you can prove a product property, compute a hom-set adjunction, and explain how its unit and counit recover evaluation and abstraction.

= Notation and Swedish–English glossary
#table(columns: (auto,1fr,1fr), inset: 5pt,
  [English / notation], [Swedish], [Working meaning],
  [category], [kategori], [Objects, arrows, identities, composition],
  [morphism], [morfism], [A typed arrow],
  [opposite category], [motsatt kategori], [All arrows reversed],
  [functor], [funktor], [Preserves identities and composition],
  [natural transformation], [naturlig transformation], [Components commuting with every arrow],
  [full / faithful], [full / trogen], [Surjective / injective on each hom set],
  [equivalence], [ekvivalens], [Quasi-inverse functors up to natural isomorphism],
  [initial / terminal], [initial / terminal], [Unique outgoing / incoming maps],
  [product / coproduct], [produkt / koprodukt], [Universal pairing / copairing],
  [equalizer / coequalizer], [utjämnare / koutjämnare], [Universal equality / identification],
  [limit / colimit], [gräns / kogräns], [Universal cone / cocone],
  [representable functor], [representerbar funktor], [Naturally a hom functor],
  [adjunction], [adjunktion], [Natural hom-set bijection],
  [unit / counit], [enhet / koenhet], [Canonical round-trip transformations],
)

Terminology varies between Swedish texts, especially for limits and equalizers; retain the English term beside the translation when searching for references.
