#import "/shared/book.typ": *
= Unit 8 · Preservation and applications

== Lecture 15 · Why adjoints preserve universal constructions
#focus[Prove that right adjoints preserve limits, use the dual theorem, and distinguish preservation from reflection.]

*Recall and approach.* Recall that preservation concerns an existing universal cone and reflection runs the implication in the opposite direction.


#definition[Preservation][A functor preserves a limit if applying it to a limiting cone gives a limiting cone of the image diagram. It reflects a limit if a cone whose image is limiting must already have been limiting. These are different implications.]

#theorem[Right adjoints preserve limits][If $F tack.l G$ and $D:J -> cal(D)$ has limit $L$, then the image cone with apex $G L$ is a limit of $G D$. Dually, left adjoints preserve colimits.]
#strategy[Convert a competing cone through the adjunction, use the original universal property, then transpose the unique mediator back.]
#proof[Given a cone $u_j:X -> G D j$, transpose each arrow to $overline(u)_j:F X -> D j$. Naturality of the adjunction in its second variable turns the cone equations for $u_j$ into cone equations for the transposes. Since $L$ is a limit, there is a unique $v:F X -> L$ with $p_j v=overline(u)_j$. Its transpose $w:X -> G L$ satisfies $G(p_j)w=u_j$, again by naturality. Any other such $w$ would transpose to another mediator $v$, so it is equal. This proves the image cone is limiting. Apply this argument to opposite categories for the dual statement.]

#example[Forgetting group structure][The free-group functor is left adjoint to the underlying-set functor. Therefore the underlying-set functor preserves products and equalizers. Concretely, a product group has the Cartesian product as its underlying set and an equalizer subgroup has the expected subset as its underlying set.]

It does not follow that this forgetful functor preserves coproducts. The coproduct of groups is a free product, whose underlying set contains new words. It is usually much larger than the disjoint union of the underlying sets. The direction of an adjunction predicts which universal constructions are preserved.

#theorem[Representables preserve limits][For fixed $A$, the functor $cal(C)(A,-)$ preserves every existing small limit.]
#proof[A map from $A$ to a limit is equivalent to a compatible family of maps from $A$ to the diagram objects, by the limit property. That compatible-family set is exactly the limit in sets of the hom-set diagram. The correspondence respects its projections, which is the required preservation statement.]

#example[Equalizers survive the underlying-set functor][For linear maps $f,g:V->W$, their equalizer is the kernel of $f-g$ with its inclusion. The underlying set is exactly $\{v:f(v)=g(v)\}$, the set-theoretic equalizer. A set map into this subset need not be linear, but the adjunction proof nevertheless establishes the universal property for all set cones by translating them to maps out of free vector spaces. This explains why merely testing linear competing maps would not suffice to prove preservation into sets.]

*Failure prediction.* A free vector space on a singleton is nonzero, while the terminal vector space is zero. Therefore the free functor cannot be a right adjoint as well to the same underlying-set functor merely by symmetry of notation. The direction of the hom-set bijection matters.

#checkpoint("8.1", [Does a left adjoint necessarily preserve a terminal object?], [No. The free vector-space functor sends the terminal singleton set to a one-dimensional vector space, whereas the terminal vector space is zero. Left adjoints preserve initial objects instead.])
#takeaways[Preservation theorems are practical tests. Before computing a complicated image construction, ask whether an adjunction or representability already determines it.]
#study-links("U8")

== Lecture 16 · Connecting algebra, logic, and universal maps
#focus[Use adjunctions and representability to organize examples from algebra and logic, and synthesize the course's proof methods.]

*Recall and approach.* Recall commutators, quotient factorization, Yoneda, and the unit–counit interpretation of function objects.


#example[Abelianization as a left adjoint][For a group $G$, quotient by its commutator subgroup to obtain $G^"ab"$. A homomorphism from $G$ into an abelian group kills every commutator and therefore factors uniquely through $G^"ab"$. This gives a natural bijection $"Ab"(G^"ab",A) iso "Grp"(G,I A)$, where $I$ includes abelian groups into groups. Thus abelianization is left adjoint to inclusion.]

The induced map on abelianizations is well defined because homomorphisms take commutators to commutators. Naturality of the displayed bijection is not an extra miracle: composing a factorization with maps on either side produces the unique factorization of the corresponding composite.

#strategy[Express the same mapping problem in two ways and use naturality plus uniqueness to obtain the canonical comparison.]

#theorem[Free objects transport coproducts][The free vector space on a disjoint union is canonically isomorphic to the direct sum of the free vector spaces on the parts.]
#proof[A linear map from $F(A coproduct B)$ to $V$ corresponds to a function from the disjoint union to $U V$, hence to a pair of functions from $A,B$, hence to a pair of linear maps from $F A,F B$. These correspond uniquely to a linear map from $F A oplus F B$. The resulting correspondence is natural in $V$, so covariant representability gives a compatible isomorphism. Concretely it sends each tagged basis element to the corresponding summand's basis vector.]

#definition[Cartesian closed category][A category is Cartesian closed if it has finite products and, for every $A$, the functor $- times A$ has a right adjoint. The resulting exponential $B^A$ represents maps from a product: $cal(C)(X times A,B) iso cal(C)(X,B^A)$.]

Sets form a Cartesian closed category. This supplies the categorical pattern behind function types: abstraction transposes a map, and application uses evaluation. The two inverse-transpose identities correspond to beta and eta laws. Type Theory will distinguish these semantic equalities from the precise syntactic conversion rules of a chosen calculus.

#example[A poset version of implication][In the power-set poset of a fixed set $S$, products are intersections. For subsets $A,B$, the right adjoint to $- inter A$ sends $B$ to $(S without A) union B$, because $X inter A subset.eq B$ exactly when $X subset.eq (S without A) union B$. This is implication expressed as an adjunction.]

To solve a new categorical problem, choose among four routes. For a universal property, write the mediating map and prove uniqueness. For a natural operation, test the identity through Yoneda. For a change in mapping problem, seek an adjunction. For a preservation claim, transport competing cones through a hom-set correspondence. These methods should become reusable proof habits rather than slogans.

#example[An explicit abelianization calculation][In $S_3$, every commutator has sign one, so the commutator subgroup lies in $A_3$. The commutator of $(12)$ and $(23)$ is a nontrivial three-cycle and generates $A_3$, so the commutator subgroup equals $A_3$. Thus abelianization gives $C_2$. Every homomorphism from $S_3$ to an abelian group is consequently determined by an element whose square is one: factor through $C_2$ and choose the image of its generator.]

This is simultaneously a quotient computation and an adjunction application. To check the claimed universality directly, show the map kills every commutator, then use the first isomorphism theorem's factorization argument. To prove naturality, compare the two candidate factorizations of the same composite and invoke uniqueness. Neither step requires choosing representatives of all cosets by hand.

#checkpoint("8.2", [Why is an isomorphism obtained from a universal property called canonical?], [It is uniquely determined by compatibility with the specified structural maps. The word does not mean that every arbitrary isomorphism between the underlying objects is the same.])
#takeaways[Category theory makes the dependencies among constructions explicit. Its strongest conclusions come from carefully stated universal properties and naturality equations.]
#study-links("U8")
