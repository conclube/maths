#import "/shared/book.typ": *
= Unit 6 · Representability and Yoneda

*Bridge into this unit.* Naturality looks like infinitely many commuting squares. Yoneda shows that, for a representable source, one square involving each arrow out of a fixed object determines all values from the identity arrow. Learn the reconstruction before treating the lemma as a counting device.

== Lecture 11 · The Yoneda correspondence
#focus[State and prove the covariant Yoneda lemma, calculate its two inverse maps, and interpret naturality as the reason one element determines a transformation.]

*Recall and approach.* Recall hom functors and the naturality square for a map whose source is the representing object.


Let $cal(C)$ be locally small and let $F:cal(C) -> "Set"$. For fixed $A$, a transformation from $cal(C)(A,-)$ to $F$ appears to contain one function for every object. Yoneda says this whole family is determined by one element of $F A$.

#theorem[Covariant Yoneda lemma][There is a bijection $"Nat"(cal(C)(A,-),F) iso F A$ sending $eta$ to $eta_A(1_A)$. Its inverse sends $x in F A$ to the transformation $eta^x_B(f)=F(f)(x)$.]
#strategy[Use the identity arrow as the universal test case. Naturality at an arbitrary $f:A -> B$ then forces every other value.]
#proof[For $g:B -> C$, $F(g)eta^x_B(f)=F(g)F(f)(x)=F(g f)(x)=eta^x_C(g f)$, so the proposed family is natural. Evaluating it at $1_A$ returns $F(1_A)(x)=x$. Conversely, naturality of any $eta$ at $f:A -> B$ gives $F(f)eta_A(1_A)=eta_B(f 1_A)=eta_B(f)$. Thus rebuilding from $eta_A(1_A)$ returns the entire original transformation. The two operations are inverse.]

The bijection is natural in $F$: composing $eta$ with $theta:F => G$ sends its distinguished element to $theta_A(eta_A(1_A))$. It is also natural in $A$ with the appropriate variance: a map $a:A -> A'$ induces precomposition $cal(C)(A',-) -> cal(C)(A,-)$, and the corresponding element changes by $F(a)$.

#example[Natural operations on pairs][In sets, $"Set"(\{0,1\},X)$ identifies with $X times X$. Natural transformations from this functor to the identity functor correspond to elements of $\{0,1\}$. There are exactly two: the two coordinate projections. A rule that “chooses the larger coordinate” is not natural for arbitrary set maps and is not even defined on unstructured sets.]

#warning[The identity used in Yoneda is the identity of the representing object, not an identity element of $F A$. The functor's values are sets and need not have algebraic operations.]
#example[Classifying a natural binary operation with a larger target][Consider a natural family $X times X->cal(P)(X)$, where the power-set functor uses direct image. Since the pair functor is represented by the two-element set $2$, Yoneda identifies these transformations with the four subsets of $2$. They give the operations $(x,y)mapsto emptyset$, $\{x\}$, $\{y\}$, and $\{x,y\}$. Reconstruction sends a selected subset of the index set along the function $2->X$ naming the input pair.]

This classification includes repeated inputs: if $x=y$, the image of the two-element subset is a singleton, exactly as direct image requires. Naturality determines behavior under identifications as well as under bijections. Testing only permutations would miss that constraint.

#checkpoint("6.1", [What element corresponds to the identity transformation of $cal(C)(A,-)$?], [The arrow $1_A in cal(C)(A,A)$.])
#takeaways[To classify natural transformations out of a representable functor, evaluate at the identity and then reconstruct by functoriality.]
#study-links("U6")

== Lecture 12 · Representing objects and universal elements
#focus[Use Yoneda to prove uniqueness of representations, distinguish covariant and contravariant versions, and recognize universal constructions as representability.]

*Recall and approach.* Recall the covariant lemma and that replacing a category by its opposite reverses the relevant hom arguments.


#definition[Representable functor][A covariant functor $F:cal(C) -> "Set"$ is representable if it is naturally isomorphic to $cal(C)(A,-)$ for some $A$. The corresponding element $u in F A$ is universal: for every $x in F X$, there is exactly one $f:A -> X$ with $F(f)(u)=x$.]

The equivalence of the two descriptions follows directly from the inverse map in Yoneda: the component at $X$ sends $f$ to $F(f)(u)$ and is bijective precisely under the stated existence-and-uniqueness condition.

For the presheaf-category statement below, take $cal(C)$ small (or work in a larger universe). The preceding Yoneda correspondence itself only needs locally small hom sets.

#strategy[Translate the natural transformations to representing arrows with Yoneda, then use faithfulness on the inverse equations.]

#theorem[Yoneda embedding][For $h_A=cal(C)(-,A)$, arrows $A -> B$ correspond bijectively to natural transformations $h_A => h_B$, by postcomposition. Thus $A |-> h_A$ defines a full and faithful functor into the presheaf category $[cal(C)^"op","Set"]$.]
#proof[Apply the contravariant version of Yoneda, obtained from the covariant lemma in $cal(C)^"op"$: a transformation is determined by its value at $1_A$, an element of $cal(C)(A,B)$. Reconstruction sends $u:X -> A$ to the composite $f u$. Identity and composition of transformations correspond to those of arrows.]

#theorem[Uniqueness of representing objects][If $h_A$ and $h_B$ are naturally isomorphic, then $A$ and $B$ are isomorphic. The analogous result holds for covariant representables.]
#proof[Fullness supplies arrows corresponding to the natural isomorphism and its inverse. Faithfulness turns the two identity equations for their composites into the corresponding identity equations for the arrows. In the covariant case the arrow directions reverse, with the same conclusion.]

#example[Products as representability][For fixed $A,B$, the functor $X |-> cal(C)(X,A) times cal(C)(X,B)$ is contravariant. A product $P$ represents it through the natural bijection $cal(C)(X,P) iso cal(C)(X,A) times cal(C)(X,B)$. The universal pair of projections is the image of $1_P$.]

For a covariant $F$, its category of elements has objects $(A,x)$ with $x in F A$ and arrows $(A,x) -> (B,y)$ given by $f:A -> B$ satisfying $F(f)(x)=y$. A universal element is exactly an initial object of this category. This reformulates representability as a familiar universal-property question.

#example[A universal element carries structural maps][For the contravariant functor $X mapsto cal(C)(X,A) times cal(C)(X,B)$, an element at $P$ is a pair of arrows $p:P->A,q:P->B$. Its universal property says every pair from $X$ is uniquely obtained by precomposing these two arrows with $u:X->P$. This is exactly the product property, including the projections. The representing object alone is insufficient data; the universal element supplies its interface.]

For a covariant representable $cal(C)(A,-)$, a transformation to $cal(C)(B,-)$ is determined by an element of $cal(C)(B,A)$, hence by an arrow $B->A$. For contravariant representables the corresponding arrow goes $A->B$. Writing this one identity-component calculation prevents a common variance error.

#checkpoint("6.2", [Why is the underlying-set functor from groups to sets represented covariantly by $ZZ$?], [A homomorphism $ZZ -> G$ is uniquely determined by the image of one, and every element of $G$ can be that image. This bijection is natural in $G$.])

#pagebreak()
=== A slower route through the central ideas

*Expanded proof: reconstructing a transformation.* Fix $F:cal(C) -> "Set"$ and $A$. Given $x in F(A)$, put $eta^x_B(f)=F(f)(x)$. For $g:B -> C$, functoriality gives
$ F(g)(eta^x_B(f))=F(g)(F(f)(x))=F(g compose f)(x)=eta^x_C(g compose f). $
Thus the definition is natural. Evaluation at the identity recovers $x$ because $F(1_A)=id$. In the other direction, the naturality square of any $eta$ at $f:A -> B$, evaluated at $1_A$, gives
$ F(f)(eta_A(1_A))=eta_B(f compose 1_A)=eta_B(f). $
This is the exact line explaining why no other values can be chosen independently. Both inverse identities have now been proved.

#diagram-square([$cal(C)(A,A)$], [$F(A)$], [$cal(C)(A,B)$], [$F(B)$], [$eta_A$], [$cal(C)(A,f)$], [$F(f)$], [$eta_B$])

#example[The generic ordered pair][
The functor $X |-> X times X$ is represented by the two-element set $D=\{0,1\}$: a function $D -> X$ is exactly its pair of values. To classify natural functions $X times X -> X$, use the preceding reconstruction with $F=id$. The generic pair $(0,1)$ must be sent to either zero or one. Naturality then forces the first projection or the second projection on every set. There is no natural average on arbitrary sets because no such extra choice exists at the representing object.
]
#example[A group element as a map out of the integers][
For the forgetful functor $U:"Grp" -> "Set"$, a group homomorphism $ZZ -> G$ is uniquely determined by the image of one, with $n |-> g^n$. Hence $U$ is represented by $ZZ$. A natural endomorphism of $U$ is determined by an integer $k$, and on each group its formula is $g |-> g^k$. These are functions, not necessarily group homomorphisms. For example squaring is natural with respect to group homomorphisms but is not itself a homomorphism on every nonabelian group.
]
*A failed shortcut.* Confusing the components' category with the input category changes the problem. The group example has components in sets, so naturality does not assert $(g h)^k=g^k h^k$. Always type the component before imposing algebraic conditions on it.

#takeaways[Representability turns an element-valued question into a mapping question. Yoneda explains why the resulting representing object is determined up to compatible isomorphism.]
#study-links("U6")
