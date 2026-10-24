#import "/shared/book.typ": *
= Unit 2 · Functors and equivalences

== Lecture 3 · Functors as structure-preserving translations
#focus[Define functors on both objects and arrows, verify their laws, and distinguish covariant from contravariant constructions.]

*Recall and approach.* Recall that precomposition changes the source of a map and postcomposition changes its target.


#definition[Functor][A functor $F:cal(C) -> cal(D)$ assigns an object $F A$ to each $A$ and an arrow $F f:F A -> F B$ to each $f:A -> B$, preserving identities and composition: $F(1_A)=1_(F A)$ and $F(g f)=F(g)F(f)$. A contravariant functor on $cal(C)$ is a covariant functor from $cal(C)^"op"$.]

The forgetful functor $U:"Grp" -> "Set"$ keeps the underlying set and function. The free vector-space functor sends a set $X$ to finite formal linear combinations of its elements; a function $f:X -> Y$ sends each basis vector $[x]$ to $[f(x)]$ and extends linearly. Preservation of composition follows by checking on basis vectors, which determine a linear map uniquely.

#example[Power sets in two directions][Direct image gives a covariant functor $cal(P):"Set" -> "Set"$, since $g[f[S]]=(g f)[S]$. Inverse image gives a contravariant functor, since $(g f)^(-1)[T]=f^(-1)[g^(-1)[T]]$. The same object assignment supports two different arrow assignments.]

#strategy[Apply the functor to the inverse equations. For examples, check identities and composites on generators or individual elements.]

#theorem[Functors preserve isomorphisms][If $f$ has inverse $g$, then $F f$ has inverse $F g$.]
#proof[The functor laws give $F g F f=F(g f)=F(1_A)=1_(F A)$ and likewise in the other order.]

For a fixed object $A$, the covariant hom functor $cal(C)(A,-)$ sends $X$ to its maps from $A$ and sends $f:X -> Y$ to postcomposition $h |-> f h$. The contravariant hom functor $cal(C)(-,A)$ sends $f:X -> Y$ to precomposition $k |-> k f$. Associativity proves the functor laws. These constructions will become the main objects of the Yoneda lemma.

#warning[A functor need not preserve monomorphisms, epimorphisms, or limits merely because it preserves composition. Those claims require additional hypotheses. Preservation of isomorphisms is special because an inverse is expressed entirely by composition and identity equations.]
#example[Checking a dual map with a type ledger][Given $f:V->W$, a functional $phi:W->K$ can be precomposed to give $phi f:V->K$. Thus $f^*:W^*->V^*$. For $g:W->X$ and $psi:X->K$, $(g f)^*(psi)=psi g f=f^*(g^*(psi))$, so $(g f)^*=f^*g^*$. The reversed order is forced by the domains, not an arbitrary convention. The identity calculation is $phi 1_V=phi$.]

*Counterexample to a careless recipe.* Sending every set to itself and every map to an identity cannot define an endofunctor on sets: a map between two different objects would need an arrow between those two images, whereas an identity has only one object as both source and target. Arrow typing precedes the functor laws.

#checkpoint("2.1", [What direction does the dual-vector-space construction send a linear map $f:V -> W$?], [It sends it to $f^*:W^* -> V^*$ by $phi |-> phi f$, so it is contravariant.])
#takeaways[An object recipe alone is not a functor. Define the action on arrows, check types, then verify the two laws.]
#study-links("U2")

== Lecture 4 · Fullness, faithfulness, and equivalence
#focus[Distinguish an equivalence from equality of categories and prove the standard equivalence criterion.]

*Recall and approach.* Recall bijections on hom sets and the distinction between an object being equal and being isomorphic to another.


#definition[Full, faithful, essentially surjective][A functor is faithful if each map $cal(C)(A,B) -> cal(D)(F A,F B)$ is injective, full if each is surjective, and essentially surjective if every object of $cal(D)$ is isomorphic to some $F A$.]

The forgetful functor from groups to sets is faithful: a group homomorphism is determined by its underlying function. It is not full, because arbitrary functions need not preserve multiplication. A full subcategory retains all arrows between its chosen objects; a subcategory need not be full.

#definition[Equivalence][An equivalence consists of functors $F:cal(C) -> cal(D)$ and $G:cal(D) -> cal(C)$ with natural isomorphisms $G F iso 1_cal(C)$ and $F G iso 1_cal(D)$. Naturality, developed next, means these isomorphisms respect every arrow.]

#strategy[Choose representatives and comparison isomorphisms, lift arrows by fullness, and prove equations by faithfulness.]

#theorem[Equivalence criterion][A functor is an equivalence if and only if it is full, faithful, and essentially surjective, with a choice of representatives when required.]
#proof[Suppose $F$ has these three properties. For each $D$, choose $G D$ and an isomorphism $epsilon_D:F G D -> D$. Fullness and faithfulness define a unique $G f$ by $F(G f)=epsilon_E^(-1) f epsilon_D$ for $f:D -> E$. This formula and faithfulness prove the functor laws. The chosen $epsilon$ is natural by construction. For $C$, fullness gives a unique $eta_C:C -> G F C$ whose image is $epsilon_(F C)^(-1)$. Full faithfulness reflects inverses, so $eta_C$ is an isomorphism; the same formula proves its naturality. Conversely, a quasi-inverse and natural isomorphisms give inverse correspondences on hom sets by conjugating with their components, so $F$ is full and faithful. The isomorphism $F G D iso D$ gives essential surjectivity.]

#example[A skeleton of finite-dimensional vector spaces][The category of finite-dimensional $K$-vector spaces is equivalent to the category with objects nonnegative integers and arrows $n -> m$ the $m$-by-$n$ matrices. Send $n$ to $K^n$ and a matrix to its linear map. This functor is full and faithful; every finite-dimensional space has a basis and is isomorphic to some $K^n$. No basis is selected canonically for every space.]

#example[Why choosing bases is enough but not canonical][To give a quasi-inverse to the coordinate-space inclusion, select a basis for each finite-dimensional vector space. A linear map is then sent to its matrix in the selected source and target bases. The formula for composition is matrix multiplication, and a change of selected bases conjugates the coordinate description by comparison isomorphisms. This does not make all vector spaces literally equal to coordinate spaces; it makes their categories equivalent.]

*The converse criterion in detail.* If $G F$ and $F G$ are naturally isomorphic to identities, then both $F$ and $G$ are faithful by applying the other functor and conjugating with those isomorphisms. Given $h:F A->F B$, choose $eta:1=>G F$ and put $k=eta_B^(-1)G(h)eta_A$. Naturality of $eta$ gives $G F(k)=G(h)$; faithfulness of $G$ yields $F(k)=h$. Thus $F$ is full as well.

#checkpoint("2.2", [Why is essential surjectivity weaker than surjectivity on objects?], [It asks only for an isomorphic object in the image. A vector space need not literally equal $K^n$ to be represented up to isomorphism.])
#takeaways[Equivalence preserves the mathematics visible through arrows while allowing multiple isomorphic presentations of the same structure.]
#study-links("U2")
