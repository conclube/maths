#import "/shared/book.typ": *
= Unit 1 · Categories and duality

== Lecture 1 · Objects, arrows, and composition
#focus[Verify category axioms and recognize algebraic examples. Recall sets, functions, groups, and homomorphisms.]

*Recall and approach.* Recall that a function includes a domain and codomain, and a monoid needs associativity and an identity but not inverses.


Many mathematical constructions are determined less by what their elements look like than by the maps they admit. A product, for example, receives pairs of maps. Category theory makes these mapping patterns explicit. The first task is not abstraction for its own sake: it is to name exactly which maps preserve the structure under discussion.

#definition[Category][A category $cal(C)$ has objects, a set $cal(C)(A,B)$ of morphisms for each pair of objects, identities $1_A in cal(C)(A,A)$, and associative composition $cal(C)(B,C) times cal(C)(A,B) -> cal(C)(A,C)$. The identity laws are $1_B f=f=f 1_A$. We write $g f$ for $g compose f$.]

We work with locally small categories, meaning each hom collection is a set. A category is small when its objects and arrows together form sets. The category of all sets is not small under the usual set-theoretic foundations. All diagrams used for limits here have a small indexing category. This distinction prevents forming an illegitimate “set of all sets.”

#example[Four families][In $"Set"$, objects are sets and arrows are functions. In $"Grp"$, they are groups and homomorphisms. A poset $P$ gives a category with one arrow $a -> b$ exactly when $a<=b$. A monoid gives a category with one object whose endomorphisms are the monoid elements and whose composition is multiplication.]

For a poset, composition is supplied by transitivity, identity by reflexivity, and associativity is automatic because there is at most one arrow of any given type. Conversely, a one-object category is a monoid because its composition and identity satisfy exactly the monoid axioms. A group is the special case in which every arrow is invertible.

#definition[Isomorphism][A morphism $f:A -> B$ is an isomorphism if some $g:B -> A$ satisfies $g f=1_A$ and $f g=1_B$.]
#strategy[Check the types first, then compare two proposed inverses using associativity.]

#theorem[Uniqueness of an inverse][An isomorphism has a unique inverse.]
#proof[If $g,h$ both invert $f$, then $g=g(f h)=(g f)h=h$. Every composition in this equation is defined because the domains and codomains match.]

#warning[Objects being isomorphic does not mean they are equal. Two different two-element sets are isomorphic in $"Set"$. Category theory often specifies an object only up to isomorphism, and a later universal property will make the relevant isomorphism unique.]
#example[An arrow can carry more information than a formula][The expression $x mapsto x^2$ can define a function $RR->RR$ or a function $RR->RR_(>=0)$. The formulas agree, but the arrows have different codomains and therefore different composability and surjectivity properties. To check a proposed category of structured objects, first specify each hom set, then verify that the proposed composite remains inside the required hom set. For groups, this closure follows from $(g f)(a b)=g(f(a)f(b))=g f(a)g f(b)$. Associativity is inherited from functions. Restricting the arrows without checking this closure can destroy the category.]

*Proof-writing habit.* Above every composite, temporarily write its source and target. The identity in $g f=1_A$ is forced by those types; it cannot be replaced by an unindexed symbol until the typing is secure.

#checkpoint("1.1", [When are two objects isomorphic in the category associated with a poset?], [Exactly when they are equal: arrows in both directions give $a<=b$ and $b<=a$, and antisymmetry gives equality.])
#takeaways[Keep a type ledger for arrows. Many apparent algebraic identities fail simply because a composite is not defined.]
#study-links("U1")

== Lecture 2 · Duality, monomorphisms, and epimorphisms
#focus[Reverse statements correctly, apply cancellation definitions, and recognize where elementwise intuitions fail.]

*Recall and approach.* Recall injective and surjective functions and the use of a singleton to select an element.


#definition[Opposite category][The opposite category $cal(C)^"op"$ has the same objects and $cal(C)^"op"(A,B)=cal(C)(B,A)$. Composition reverses the order inherited from $cal(C)$. Reversing twice returns the original category.]

A theorem proved solely from category axioms has a dual theorem obtained by reversing all arrows. Duality is not replacing every function by an inverse: most arrows have no inverse. It changes the category in which the statement is read.

#definition[Mono and epi][A morphism $m:A -> B$ is monic if $m u=m v$ implies $u=v$ for all parallel $u,v:X -> A$. A morphism $e:A -> B$ is epic if $u e=v e$ implies $u=v$ for all parallel $u,v:B -> X$.]

#strategy[To prove cancellation, start with an arbitrary pair of parallel arrows. To refute it, construct one pair that becomes equal after composition.]

#theorem[Cancellation in sets][Monomorphisms in $"Set"$ are precisely injections; epimorphisms are precisely surjections.]
#proof[An injective map cancels on the left pointwise. If $m$ is not injective, two distinct elements with the same image define different maps from a singleton which $m$ identifies, so it is not monic. A surjection cancels on the right because every target element has a preimage. If $e$ is not onto, choose a missing target element and define two maps to $\{0,1\}$ which agree everywhere except there; they agree after precomposition with $e$ but are different.]

#theorem[Split arrows][If $r s=1_A$ for $s:A -> B$ and $r:B -> A$, then $s$ is monic and $r$ is epic.]
#proof[If $s u=s v$, compose with $r$ to obtain $u=v$. If $u r=v r$, compose with $s$ to obtain $u=v$.]

#example[Mono and epi need not mean isomorphism][In the category of commutative unital rings, the inclusion $ZZ -> QQ$ is monic because it is injective. It is epic: two maps $QQ -> R$ agreeing on integers must agree on $a/b$, whose image is forced to be the image of $a$ times the inverse of the image of $b$. But the inclusion is not surjective, hence not an isomorphism.]

This example explains why the definitions use cancellation rather than the words “injective” and “surjective.” A category may have objects that are not sets equipped with structure, or its arrows may detect only some distinctions between elements.

#example[Cancellation without enough arrows to detect elements][In the poset with $0<1$, its nonidentity arrow is both mono and epi: every pair of parallel arrows already agrees. It has no inverse, since there is no arrow $1->0$. This gives a very small example where categorical cancellation says less than invertibility. By contrast, in sets, maps from a singleton detect unequal elements and maps to a two-element set detect missing elements. The surrounding category controls which tests exist.]

*Duality drill.* A left inverse proves monicity by composing on the left. Reverse every arrow to obtain: a right inverse proves epicity by composing on the right. The proof is transported, not repeated element by element. Do not dualize “injective function” into a vague opposite operation; dualize the precise cancellation equation.

#checkpoint("1.2", [Is every arrow in a poset category both monic and epic?], [Yes. There is at most one arrow between any two fixed objects, so both cancellation conditions hold automatically. Nonidentity order relations need not be isomorphisms.])
#takeaways[Translate a definition into a diagram and then dualize the diagram. Use set intuition to discover examples, not as a replacement for the categorical definition.]
#study-links("U1")
