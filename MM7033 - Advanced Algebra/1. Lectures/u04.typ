#import "/shared/book.typ": *
= Unit 4 · Free modules and exact sequences

*Bridge into this unit.* Over a general ring, a surjective map need not admit a linear choice of preimages. Exactness identifies what is lost by a map; splitting asks whether that loss can be separated as a direct summand. Projectivity is the condition that makes certain lift choices possible.

== Lecture 7 · Direct sums, products, and presentations
#focus[Distinguish sums from products, use free-module universal properties, and interpret finite presentations.]

*Recall and approach.* Recall finite-support tuples are the algebraic direct sum, while products allow arbitrary support.


#definition[Sum and product][The product $product_i M_i$ consists of all coordinate tuples. The direct sum $bigoplus_i M_i$ consists of tuples with finite support. Both have coordinatewise operations; they coincide for finite families.]

The product is characterized by maps into its factors: a family $X -> M_i$ uniquely assembles into $X -> product_i M_i$. The direct sum is characterized by maps out of its summands: maps $M_i -> X$ assemble by a finite sum into $bigoplus_i M_i -> X$. Finite support is essential because arbitrary infinite algebraic sums are not defined.

#definition[Free module and presentation][A free module on a set $S$ is $R^(S)$, the finite-support functions $S -> R$, with standard basis $e_s$. A presentation of $M$ is an exact sequence $R^(T) -> R^(S) -> M -> 0$. The elements of $S$ name generators; images of the basis elements indexed by $T$ name relations.]

#strategy[Build a free cover from chosen generators and then cover its kernel to record relations.]

#theorem[Every module has a presentation][Every $R$-module is a quotient of a free module and admits a presentation.]
#proof[Take the free module on the underlying set of $M$ and send the basis vector $[m]$ to $m$. This is surjective. Apply the same construction to its kernel and compose that free-module map with the kernel inclusion. The image of the first map is exactly the kernel of the second, which is exactness.]

A module is finitely generated when the generator set can be finite. It is finitely presented when both generator and relation sets can be finite. Over a Noetherian ring these coincide for finitely generated modules, as Unit 8 will show; over an arbitrary ring they need not coincide.

#example[A finite presentation][$ZZ slash 6 ZZ$ has presentation $ZZ arrow.r^(times 6) ZZ -> ZZ slash 6 ZZ -> 0$. The single relation is $6e=0$. Over $R=K[x]$, the module $R slash (x^2)$ has basis $1,x$ as a $K$-vector space, and multiplication by $x$ is nilpotent of order two.]

#theorem[Finite free rank is well defined][If $R$ is a nonzero commutative ring and $R^m iso R^n$ for finite $m,n$, then $m=n$.]
#proof[Choose a maximal ideal $frak(m)$. The isomorphism induces an isomorphism of quotients by $frak(m)$ times each module, giving $(R slash frak(m))^m iso (R slash frak(m))^n$. Vector-space dimension over the residue field forces equality.]

#example[Reading a presentation without guessing a basis][A module with generators $u,v$ and relations $u-2v=0$, $6v=0$ is isomorphic to $ZZ slash 6ZZ$: send $v$ to one modulo six and $u$ to two. These values respect both relations. The reverse map sends one to $v$ and is well defined because $6v=0$. The composites fix the generators, hence every element.]

Eliminating a generator from a relation suggests the answer, but the two maps prove no additional relation has been introduced or lost. This distinction matters when several relations interact and an informal simplification may accidentally discard information.

#checkpoint("4.1", [What fails if the ring in the rank theorem is the zero ring?], [Every finite free module is the zero module, so different ranks cannot be distinguished.])
#takeaways[Generators and relations describe a module without asserting it has a basis. This language will make tensor computations systematic.]
#study-links("U4")

== Lecture 8 · Exactness and splitting
#focus[Read exact sequences, prove the splitting lemma, and identify the lifting property of free and projective modules.]

*Recall and approach.* Recall exactness identifies an image with a kernel; it does not by itself supply a complementary summand.


#definition[Exact sequence][A sequence $A arrow.r^i B arrow.r^p C$ is exact at $B$ if $"im" i=ker p$. A short exact sequence is $0 -> A arrow.r^i B arrow.r^p C -> 0$, so $i$ is injective, $p$ is surjective, and their image/kernel coincide.]

#strategy[Use a section to decompose each middle element, and use projective lifting to construct such sections.]

#theorem[Splitting lemma][For a short exact sequence, the following are equivalent: $p$ has a linear section $s:C -> B$; $i$ has a linear retraction $r:B -> A$; and $B$ is isomorphic to $A oplus C$ compatibly with the given maps.]
#proof[Given a section, every $b$ decomposes uniquely as $i(a)+s(p(b))$: the difference $b-s(p(b))$ lies in $ker p="im"i$, and injectivity determines $a$. The map $(a,c)|->i(a)+s(c)$ is therefore an isomorphism, giving a retraction by taking the first coordinate. Conversely, given a retraction $r$, the restriction of $p$ to $ker r$ is bijective onto $C$. It is injective because an element in both $ker r$ and $ker p$ is $i(a)$ with $a=r i(a)=0$. It is onto because replacing a lift $b$ of $c$ by $b-i(r(b))$ puts it in $ker r$. Its inverse followed by inclusion is a section. The direct-sum form visibly gives both maps.]

#definition[Projective module][A module $P$ is projective if for every surjection $q:M -> N$ and map $f:P -> N$, there is a lift $h:P -> M$ with $q h=f$.]

#theorem[Free and projective modules][Free modules are projective. A module is projective exactly when it is a direct summand of a free module.]
#proof[For a free module, choose a preimage under $q$ for the image of each basis vector and extend linearly. A direct summand inherits this lifting property by extending a map through the projection from the free module, lifting, and restricting to the summand. Conversely, a free module surjects onto any $P$. If $P$ is projective, lift its identity to obtain a section of that surjection. The splitting lemma realizes $P$ as a direct summand.]

#example[A nonsplit sequence][$0 -> ZZ arrow.r^(times 2) ZZ -> ZZ slash 2ZZ -> 0$ is exact but does not split. A section would send $[1]$ to an integer annihilated by two, necessarily zero, which cannot map back to $[1]$.]
#example[Finite projective means a summand of finite free][If a projective module $P$ is generated by $p_1,dots,p_n$, the corresponding map $R^n->P$ is onto. Projectivity lifts $1_P$ to a section $P->R^n$, and the splitting lemma makes $P$ a direct summand of this finite free module. This justifies the finite dual-basis construction used for trace later.]

For $R=K times K$, the module $R(1,0)$ is such a summand, complementary to $R(0,1)$. It is projective but not free: the nonzero scalar $(0,1)$ annihilates every element, whereas no nonzero free module is annihilated by a nonzero scalar. Thus a splitting is weaker than a basis.

#checkpoint("4.2", [Why does every short exact sequence ending in a free module split?], [Lift the identity of the free quotient across the surjection to obtain a section.])

#pagebreak()
=== A slower route through the central ideas

#example[A short exact sequence that cannot split][
The sequence $0 -> ZZ -> ZZ -> ZZ slash 2ZZ ->0$, with first map multiplication by two and second map reduction modulo two, is exact. If a section existed, the class of one would map to an integer n with residue one. Linearity would give $2n=0$ because twice that class is zero. In the torsion-free group $ZZ$, this forces n=0, contradicting its residue. Surjectivity alone therefore does not allow a linear lift of the residue-class generator.
]
*Expanded proof: a section gives a direct sum.* In $0 -> A ->^i B ->^p C ->0$, suppose $s:C -> B$ has $p s=id$. For $b in B$, the difference $b-s(p(b))$ lies in $ker(p)=im(i)$. Since i is injective there is a unique a with $i(a)=b-s(p(b))$. Thus $b=i(a)+s(c)$ with $c=p(b)$. If this sum is zero, applying p gives c=0 and then injectivity gives a=0. These existence and uniqueness statements prove the map $A oplus C -> B$ is a bijective module map; its inverse is linear because the decomposition of a sum is the sum of the unique decompositions.

#example[A splitting with concrete integer coordinates][
Let $p:ZZ^2 -> ZZ$ be $p(a,b)=a+b$. A section is $s(c)=(c,0)$. The kernel consists of $(-b,b)$, so every $(a,b)$ decomposes as $(-b,b)+(a+b,0)$. The corresponding coordinates are b in the kernel copy of $ZZ$ and a+b in the quotient copy. Checking the two composites gives $(b,c) |-> (c-b,b)$ and $(a,b) |-> (b,a+b)$, inverse integer-linear maps.
]
*Why free modules lift.* Given an onto map $q:B -> C$ and a map from a free module with basis $(e_i)$ to C, choose a preimage $b_i$ of each image of $e_i$. Every vector has a unique finite basis expansion, so extending $e_i |-> b_i$ linearly is well defined and is a lift. A direct summand of a free module inherits this property by extending its map to the free module using the projection, lifting there, and restricting back. This proves projectivity without asserting that the summand has a basis.

*A failed shortcut.* Arbitrary set-theoretic choices of lifts need not respect relations. The failed section of $ZZ slash 2ZZ$ demonstrates the relation that such a choice would have to preserve.

#takeaways[Exactness records what is lost and retained. Splitting is the stronger assertion that the two pieces can be independently recovered inside the middle module.]
#study-links("U4")
