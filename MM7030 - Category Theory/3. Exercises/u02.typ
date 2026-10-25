#import "/shared/book.typ": *
#let p = problem.with(code: "MM7030", unit: "U2")
#let items = (
 p(1,"E","U2.1 Functor laws",[Show a monotone map between posets gives a functor between their categories.],[The object map is the given function.],[Monotonicity supplies the required arrow images.],[If $a<=b$, monotonicity gives $F(a)<=F(b)$, so the unique arrow maps to the unique arrow. Identities and composites are preserved because the relevant hom sets contain at most one arrow.],[Explain why monotonicity is exactly the condition needed.]),
 p(2,"E","U2.1 Forgetful functors",[Define the forgetful functor from vector spaces over $K$ to sets on objects and arrows.],[Retain the underlying data.],[Linear maps are functions.],[It sends a vector space to its underlying set and a linear map to its underlying function. Identity linear maps are identity functions and linear-map composition is function composition, proving the functor laws.],[Describe both assignments.]),
 p(3,"E","U2.1 Hom functors",[For $f:X -> Y$, write the map $cal(C)(A,f)$.],[Postcompose an arrow from $A$.],[Its input is $h:A -> X$.],[It is the function $cal(C)(A,X) -> cal(C)(A,Y)$, $h |-> f h$. The types ensure the composite exists.],[Give domain, codomain, and formula.]),
 p(4,"E","U2.2 Faithfulness",[Explain why the forgetful functor from groups to sets is faithful.],[Compare two homomorphisms with the same underlying function.],[Morphisms are actual functions with a property.],[If two group homomorphisms have equal underlying functions, they take the same value at every group element and are the same homomorphism. Thus each induced hom-set map is injective.],[Use the hom-set definition of faithful.]),
 p(5,"C","U2.1 Contravariance",[Verify inverse image of subsets is a contravariant functor on sets.],[Test identity and a composite.],[An element belongs to an inverse image exactly when its image belongs to the target subset.],[For $f:X -> Y,g:Y -> Z$ and $S subset.eq Z$, $x in (g f)^(-1)S$ exactly when $g(f(x)) in S$, equivalently $x in f^(-1)(g^(-1)S)$. Thus composition reverses. Identity inverse image is the identity on the power set.],[State the reversed direction of the arrow map.]),
 p(6,"C","U2.2 Fullness",[Show the forgetful functor from groups to sets is not full.],[Find a function which does not preserve the identity.],[Use a constant nonidentity value in a nontrivial group.],[The constant function $C_2 -> C_2$ with value its nonidentity element is a set function but cannot be a group homomorphism, since homomorphisms send identity to identity. Therefore the hom-set map is not surjective.],[Use a map between underlying sets of actual objects in the source category.]),
 p(7,"C","U2.2 Reflection of isomorphisms",[Prove a full and faithful functor reflects isomorphisms.],[Lift the inverse of $F f$ using fullness.],[Use faithfulness on the two inverse equations.],[If $F f$ has inverse $u$, fullness gives $g$ with $F g=u$. Then $F(g f)=F g F f=1=F(1)$ and similarly $F(f g)=F(1)$. Faithfulness gives $g f=1$ and $f g=1$, so $f$ is an isomorphism.],[Specify which property supplies the inverse candidate and which verifies its equations.]),
 p(8,"C","U2.1 One-object functors",[Show functors between one-object categories of monoids are precisely monoid homomorphisms.],[Only the arrow assignment is variable.],[Identity and composition become unit and multiplication.],[The unique object must map to the unique object. The arrow map is a function between monoids. The two functor laws require it to preserve the unit and multiplication, exactly the monoid-homomorphism axioms. Conversely those axioms define a functor.],[State both directions of the identification.]),
 p(9,"C","U2.2 Matrix category",[Show the category of matrices over $K$, with objects nonnegative integers, is equivalent to finite-dimensional vector spaces.],[Map $n$ to $K^n$.],[Every linear map between coordinate spaces has a unique matrix.],[The matrix-to-linear-map functor preserves multiplication and identities. The uniqueness and existence of coordinate matrices make it full and faithful. Every finite-dimensional vector space has a finite basis and is isomorphic to some $K^n$, giving essential surjectivity. The equivalence criterion applies.],[Include dimension zero and distinguish essential from literal surjectivity.]),
 p(10,"A","U2.2 Faithful reflection",[Prove a faithful functor reflects monomorphisms and epimorphisms, without assuming fullness.],[Apply the functor to the relevant equality.],[Cancel in the target, then use faithfulness.],[If $F f$ is monic and $f u=f v$, then $F f F u=F f F v$, so $F u=F v$ and faithfulness gives $u=v$. Thus $f$ is monic. Dually, if $F f$ is epic and $u f=v f$, cancel $F f$ on the right and use faithfulness to conclude $u=v$.],[Do not confuse reflection with preservation; fullness is unnecessary here.]),
 p(11,"A","U2.2 Equivalence of posets",[Show equivalent poset categories are isomorphic as posets.],[Natural isomorphisms between objects in a poset are equalities.],[A quasi-inverse is actually inverse on objects.],[If $F,G$ witness an equivalence, the component isomorphisms $G F(p) iso p$ and $F G(q) iso q$ force literal equality by antisymmetry. Thus the monotone maps are inverse bijections. Each direction is monotone, so they are an order isomorphism.],[Use antisymmetry; the statement need not hold for preorders.]),
 p(12,
  "A",
  "U2.2 Failure of preservation",
  [Construct a faithful functor which sends a monomorphism and epimorphism to a function which is neither. Use the two-object poset $0<1$ as source, and explain why this does not contradict #link(label("MM7030-U2.10"))[U2.10].],
  [Every arrow in a poset category is monic and epic.],
  [Send the sole nonidentity arrow to a constant map between two-element sets.],
  [*Finding the approach.* Faithfulness only compares arrows already present in each source hom set. A thin source makes that requirement easy to satisfy even when its target has many more test arrows.

*Argument.* Map both objects to the set $\{a,b\}$, identities to identities, and $0->1$ to the constant function with value $a$. These assignments form a functor because every nontrivial composition involves an identity. It is faithful: each source hom set is empty or a singleton, so its map into the corresponding function set is injective. The nonidentity source arrow is both monic and epic, but its image is neither injective nor surjective, hence neither monic nor epic in sets. Faithfulness reflects cancellation properties from the target; it does not preserve them from the source.

To see failure of monicity in sets, choose the two distinct functions from a singleton selecting $a$ and $b$; composing either with the constant map gives the same function. To see failure of epicity, choose two functions from the two-point codomain to itself that agree at $a$ but differ at $b$. Their composites with the constant map agree. These witnesses are absent from the relevant source hom sets, so faithfulness cannot rule them out.

*A tempting dead end.* A faithful functor need not be full, injective on objects, or preserve every categorical property. The direction of a reflection argument cannot be reversed.

*Hypotheses.* The source is a poset viewed as a category, so every parallel pair there is equal. Cancellation in the target must be tested against all target arrows, not only image arrows.],
  [Verify functoriality and faithfulness, and distinguish preservation from reflection.],
  idea: [Identify the missing target test arrows to understand exactly why reflection does not imply preservation.]),
 p(13,
  "A",
  "U2 Transfer: Discarding redundant points",
  [Let objects be pairs $(X,e)$ with $X$ a finite set and $e:X -> X$ satisfying $e^2=e$. An arrow $f:(X,e) -> (Y,d)$ satisfies $f e=f=d f$, and the identity of $(X,e)$ is $e$. Verify this is a category. Show that sending $(X,e)$ to its image $e(X)$ and arrows to restrictions gives an equivalence with finite sets.],
  [Each point of the image of an idempotent is fixed by that idempotent.],
  [Extend a function $h:e(X) -> d(Y)$ to $X$ by $x |-> h(e(x))$.],
  [*Finding the approach.* The unusual identity tells us that points outside the image carry no independent information. Restriction should remove exactly that redundancy, and the displayed extension tests whether any information is lost.

*Argument.* Compositions satisfy the same equations: if $f e=f=d f$ and $g d=g=c g$, then $(g f)e=g f$ and $c(g f)=g f$. Composition is associative as composition of functions, and $e,d$ act as the required identities on $f$. Every $f$ maps into $d(Y)$ and is determined by its restriction to $e(X)$ because $f(x)=f(e(x))$. Conversely any function $h:e(X) -> d(Y)$ extends to $f(x)=h(e(x))$; idempotence gives both arrow equations. Restriction is therefore a bijection on each hom set, hence full and faithful. Every finite set $Z$ is the image of $(Z,id_Z)$, so the functor is essentially surjective and an equivalence. The inclusion and retraction between $(X,e)$ and $(e(X),id)$ have composites $e$ and the identity, exactly the identities in this category.

*A tempting dead end.* The identity on the underlying set $X$ is generally not an arrow of this category. Using it in place of $e$ breaks the verification.

*Hypotheses.* Idempotence is essential both for the category's identities and for the extension formula. Finiteness keeps the target within the chosen category but is not used in the hom-set bijection.],
  [Verify the category first, then prove fullness, faithfulness, and essential surjectivity explicitly.],
  optional: true,
  minutes: 60,
  idea: [Restriction and extension are inverse descriptions of arrows, while every target object already occurs as an image.]),
)
