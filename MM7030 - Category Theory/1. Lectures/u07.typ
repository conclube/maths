#import "/shared/book.typ": *
= Unit 7 · Adjunctions

== Lecture 13 · Natural hom-set bijections
#focus[Recognize an adjunction, compute adjunct transposes, and verify naturality in both variables.]

*Recall and approach.* Recall universal properties of free objects and the fact that a poset hom set is either empty or a singleton.


An adjunction formalizes a reversible change in the form of a problem. A map out of a free object is equivalent to an unconstrained map on generators; a map from a product is equivalent to a map into a function object. The objects on the two sides need not be isomorphic, but their mapping problems correspond naturally.

#definition[Adjunction][Functors $F:cal(C) -> cal(D)$ and $G:cal(D) -> cal(C)$ satisfy $F tack.l G$ if there are bijections $Phi_(C,D):cal(D)(F C,D) iso cal(C)(C,G D)$ natural in $C,D$. The image of a map under this bijection is its adjunct transpose.]

Naturality means two equations. For $a:C' -> C$, $Phi(h F a)=Phi(h)a$. For $b:D -> D'$, $Phi(b h)=G(b)Phi(h)$. These equations make it possible to move calculations through the bijection rather than treating each hom set independently.

#example[Free and forgetful][Let $F$ send a set to its free vector space and $U$ forget vector-space structure. Then $"Vect"_K(F X,V) iso "Set"(X,U V)$ by restriction to basis vectors and linear extension. The two naturality equations are respectively substitution of generators and composition with a linear map. Thus $F tack.l U$.]

#example[Product and exponential in sets][For fixed $A$, let $X^A$ denote functions $A -> X$. There is a bijection $"Set"(B times A,X) iso "Set"(B,X^A)$ sending $f$ to $b |-> (a |-> f(b,a))$. Its inverse evaluates: $g |-> ((b,a) |-> g(b)(a))$. Substitution verifies naturality, so $(- times A) tack.l (-)^A$.]

#strategy[Give restriction/extension or curry/evaluate maps explicitly, check both composites, then check each variable of naturality.]

#theorem[Adjoints in posets][For monotone maps $F:P -> Q$ and $G:Q -> P$, an adjunction is exactly the condition $F(p)<=q$ if and only if $p<=G(q)$.]
#proof[Each hom set in a poset is empty or a singleton. A bijection between the two hom sets exists exactly when they are simultaneously empty or simultaneously inhabited, giving the stated equivalence. Naturality is automatic because there is at most one parallel arrow.]

For a function $f:X -> Y$, direct image and inverse image give such an adjunction between power-set posets: $f[S] subset.eq T$ exactly when $S subset.eq f^(-1)[T]$. This elementary logical equivalence is the same formal pattern as free vector spaces and currying.

#example[Two adjoints around inverse image][For a function $f:X->Y$, inverse image $f^*$ on power sets also has a right adjoint: send $S subset.eq X$ to the set of $y$ whose entire fiber $f^(-1)(y)$ lies in $S$. Indeed $f^*(T) subset.eq S$ means every element over any $y in T$ lies in $S$, exactly that $T$ lies in the stated set. Empty fibers satisfy this condition automatically.]

Thus direct image is an existential operation on fibers and this right adjoint is a universal operation on fibers. Both comparisons arise from explicit inclusion equivalences. The difference at empty fibers is useful: existential image excludes a point with no witness, while the universal condition holds there vacuously.

#checkpoint("7.1", [What is the adjunct transpose of $f:B times A -> X$ evaluated at $b$?], [It is the function $a |-> f(b,a)$, an element of $X^A$.])
#takeaways[To prove an adjunction, give both directions of the hom-set correspondence, prove they are inverse, and verify naturality.]
#study-links("U7")

== Lecture 14 · Units, counits, and triangle identities
#focus[Recover the unit and counit from a hom-set adjunction and prove the converse construction.]

*Recall and approach.* Recall the two-variable naturality equations of an adjunction and how identity arrows determine unit and counit.


#definition[Unit and counit][For $F tack.l G$, set $eta_C=Phi_(C,F C)(1_(F C)):C -> G F C$ and $epsilon_D=Phi_(G D,D)^(-1)(1_(G D)):F G D -> D$.]

The unit inserts an object into the result of going across and back; the counit evaluates the result of the opposite round trip. They are transformations $eta:1_cal(C) => G F$ and $epsilon:F G => 1_cal(D)$.

#strategy[Use naturality to move a map past the unit or counit, then apply the matching triangle identity.]

#theorem[Transpose formulas and triangles][For $h:F C -> D$ and $k:C -> G D$,
$ Phi(h)=G(h)eta_C, quad Phi^(-1)(k)=epsilon_D F(k). $
Moreover $epsilon_(F C)F(eta_C)=1_(F C)$ and $G(epsilon_D)eta_(G D)=1_(G D)$.]
#proof[The first formula is naturality in $D$ applied to the identity of $F C$. The second is naturality in $C$ applied to the identity of $G D$. Applying the inverse correspondence to $eta_C$ gives the first triangle, and applying the correspondence to $epsilon_D$ gives the second. Naturality of $eta$ follows by evaluating both paths on an arrow $a:C -> C'$ and using the two naturality equations for $Phi$; the argument for $epsilon$ is dual.]

#theorem[Converse][If natural transformations $eta:1 => G F$ and $epsilon:F G => 1$ satisfy the two triangle identities, the displayed transpose formulas define an adjunction.]
#proof[Starting with $h:F C -> D$, going across and back gives $epsilon_D F G(h)F(eta_C)$. Naturality of $epsilon$ replaces its first two factors by $h epsilon_(F C)$; the first triangle then gives $h$. Starting with $k:C -> G D$, the round trip is $G(epsilon_D)G F(k)eta_C$. Naturality of $eta$ makes this $G(epsilon_D)eta_(G D)k=k$ by the second triangle. The formulas are natural by functoriality and naturality of the two transformations.]

#example[Free vector spaces again][The unit maps a set element to its basis vector. The counit sends a formal linear combination of underlying vectors to their actual sum in the vector space. The first triangle says that expanding a basis vector and then evaluating does nothing; the second says that inserting one actual vector and evaluating returns it.]

#warning[The unit and counit need not be isomorphisms. An adjunction is generally weaker than an equivalence. Their triangles express coherence, not invertibility of the round-trip functors.]
#example[Both triangles for product and exponential][Fix $A$ in sets. The unit at $X$ sends $x$ to the function $a mapsto(x,a)$ in $(X times A)^A$. The counit at $Y$ evaluates $(f,a)$ to $f(a)$. The first triangle starts with $(x,a)$, turns $x$ into that function, retains $a$, and evaluates, returning $(x,a)$. The second starts with $f:A->Y$, builds the function $a mapsto(f,a)$, and applies evaluation pointwise, returning $a mapsto f(a)$, the original set function.]

These computations explain what the abstract triangles control. They do not say the unit is onto: many functions $A->X times A$ are not of the special form $a mapsto(x,a)$. An adjunction can have coherent round trips without making every individual unit or counit invertible.

#checkpoint("7.2", [For product–exponential adjunction, what is the counit at $X$?], [The evaluation map $X^A times A -> X$, $(f,a) |-> f(a)$.])
#takeaways[The hom-set and unit–counit descriptions are interchangeable. Use whichever makes a given construction easier to verify.]
#study-links("U7")
