#import "/shared/book.typ": *
= Unit 4 · Universal properties

== Lecture 7 · Terminal objects and products
#focus[State a universal property with existence and uniqueness, prove uniqueness up to unique compatible isomorphism, and compute products in different categories.]

*Recall and approach.* Recall pairing of functions, coordinate projections, and greatest lower bounds in an ordered set.


#definition[Terminal and initial][An object $T$ is terminal if every object $X$ has exactly one arrow $X -> T$. An object $I$ is initial if every $X$ has exactly one arrow $I -> X$. A zero object is both.]

A singleton is terminal in sets, while the empty set is initial. The trivial group is both initial and terminal in groups. The integers are initial among commutative unital rings; the zero ring is terminal under our convention allowing it.

#strategy[Build comparison maps in both directions and use uniqueness of mediators to identify their composites with identities.]

#theorem[Uniqueness of terminal objects][Any two terminal objects have a unique isomorphism between them.]
#proof[There are unique arrows $u:T -> T'$ and $v:T' -> T$. The composite $v u$ and identity are both arrows $T -> T$, so uniqueness forces equality. Similarly $u v=1_(T')$. The arrow $u$ was already unique.]

#definition[Product][A product of $A,B$ is an object $P$ with projections $p:P -> A$, $q:P -> B$ such that for every $f:X -> A,g:X -> B$ there is a unique $chevron.l f,g chevron.r:X -> P$ with $p chevron.l f,g chevron.r=f$ and $q chevron.l f,g chevron.r=g$.]

In sets the product is pairs with coordinate projections. In groups it is the Cartesian product with coordinatewise operation; the same pairing map is a homomorphism because its coordinates are. In a poset, a product is a greatest lower bound: the projections say it is below both objects, while the universal arrow says every other lower bound is below it.

#theorem[Products are unique with their projections][Any two products of $A,B$ admit a unique isomorphism preserving both projections.]
#proof[Each product's universal property gives an arrow to the other preserving the projections. Each composite preserves the original projections, as does the identity. Uniqueness in the universal property forces both composites to be identities.]

#example[Why the projections matter][A two-element set has several bijections to itself, so an abstract statement “products are uniquely isomorphic” is incomplete. The uniqueness refers to the isomorphism that commutes with the specified projection maps. Universal objects come with structure.]

#example[Deriving an equation without elements][Let $p,q$ be product projections and let $f:X->A$, $g:X->B$, $h:Y->X$. Then $chevron.l f,g chevron.r h=chevron.l f h,g h chevron.r$. To prove it, postcompose each side with $p$ and obtain $f h$; postcompose with $q$ and obtain $g h$. Product uniqueness gives equality. This proof works in every category with the product, even where the objects have no underlying elements.]

The same method proves $chevron.l p,q chevron.r=1$ on a product. These two equations are the practical calculation rules of the universal property. When a diagram chase stalls, ask whether the desired arrows land in a product and can therefore be tested through its projections.

#checkpoint("4.1", [What is the product of twelve and eighteen in the poset of positive integers ordered by divisibility?], [It is their greatest common divisor, six: arrows mean divisibility, and the universal property is precisely the gcd property.])
#takeaways[A universal property is an interface: specify the structural arrows, the competing data, and the unique mediating arrow.]
#study-links("U4")

== Lecture 8 · Coproducts and free constructions
#focus[Dualize products, compute coproducts without confusing them with products, and use free objects through their extension property.]

*Recall and approach.* Recall finite linear combinations and the difference between a tagged union and an overlapping ordinary union.


#definition[Coproduct][A coproduct $A coproduct B$ has injections $i:A -> A coproduct B$, $j:B -> A coproduct B$. For every $f:A -> X,g:B -> X$ there is a unique $[f,g]:A coproduct B -> X$ with $[f,g]i=f$ and $[f,g]j=g$.]

In sets, use a tagged disjoint union: even when $A$ and $B$ overlap, the tags keep their copies distinct. In vector spaces, a finite direct sum is both product and coproduct. In groups, the direct product is generally not a coproduct, because images from its two factors commute, whereas arbitrary homomorphisms from the factors into a target need not have commuting images.

#example[Free vector spaces][For a set $S$, let $K^(S)$ consist of finitely supported coefficient functions $S -> K$. The basis insertion sends $s$ to $[s]$. Every function $u:S -> U(V)$ extends uniquely to a linear map $overline(u):K^(S) -> V$, by $sum_s a_s[s] |-> sum_s a_s u(s)$. Finiteness of support makes the sum meaningful.]

#strategy[Restrict a proposed map to generators, then prove that extending those values recovers it uniquely.]

#theorem[Free construction determines maps][The displayed extension establishes a bijection between linear maps $K^(S) -> V$ and set maps $S -> U(V)$. This bijection is natural in both variables.]
#proof[Restriction to basis elements and linear extension are inverse operations: a linear map is determined by its basis values, and extending then restricting returns the original function. If $a:S' -> S$, replacing each basis element by its image commutes with extension. If $b:V -> W$ is linear, applying $b$ to a finite linear combination commutes with the sum. These are the two naturality equations.]

This is the first example of an adjunction. Notice that the defining universal property names the input set and the basis insertion; merely saying that a vector space has a basis of a given size does not specify the extension map.

#theorem[Uniqueness of a free object][Two free vector spaces on the same set, with their specified basis insertions, are uniquely isomorphic compatibly with those insertions.]
#proof[Extend each insertion into the other free object. Their composites agree with the respective identity on all generators, so uniqueness of extension makes the composites identities.]

#example[Free groups and why new words appear][A free group on a set $S$ has an insertion $S->U(F S)$ such that every function $S->U(G)$ extends uniquely to a homomorphism $F S->G$. One construction uses words in letters $s,s^(-1)$, modulo insertion and deletion of adjacent inverse pairs. Concatenation is associative before quotienting and respects this equivalence, the empty word is an identity, and reversing a word and inverting its letters supplies an inverse. Evaluating a word in $G$ respects the cancellations, giving the unique extension. This is the free-group property used later.]

For two free generators, a map is determined by two arbitrary target elements, even when they do not commute. Their product and longer alternating words must therefore be represented in the free group. A direct product would force commuting images and cannot implement that mapping problem. This compares two universal properties through the maps they permit.

#checkpoint("4.2", [Why does the direct sum of infinitely many vector spaces require finite support?], [A map out of it is assembled by summing the images of the finitely many nonzero coordinates. Arbitrary infinite sums have no meaning in an algebraic vector space without additional structure.])
#takeaways[Universal properties organize existence and uniqueness of maps. Concrete constructions verify that such objects actually exist in the category at hand.]
#study-links("U4")
