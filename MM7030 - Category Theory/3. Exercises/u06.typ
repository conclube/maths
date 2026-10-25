#import "/shared/book.typ": *
#let p = problem.with(code: "MM7030", unit: "U6")
#let items = (
 p(1,"E","U6.1 Yoneda evaluation",[For $eta:cal(C)(A,-) => F$, which element determines $eta$ under Yoneda?],[Evaluate at the representing object.],[Use its identity arrow.],[It is $eta_A(1_A) in F A$. Naturality reconstructs each value by $eta_B(f)=F(f)(eta_A(1_A))$.],[Include the reconstruction formula.]),
 p(2,"E","U6.2 Representing the identity",[Show the identity functor on sets is covariantly represented by a singleton.],[A function from a singleton selects an element.],[Evaluate at its unique point.],[The bijection $"Set"(1,X) -> X$ sends $f$ to $f(*)$. Its inverse sends $x$ to the selecting function. Postcomposing with a function $X -> Y$ corresponds to applying it to the selected element, so the bijection is natural.],[Verify naturality, not only cardinality.]),
 p(3,"E","U6.1 Reconstructing a transformation",[Let $x in F A$. Define the corresponding transformation from $cal(C)(A,-)$ to $F$.],[Apply $F$ to a map from $A$.],[The component at $B$ sends $f$ to $F(f)(x)$.],[Define $eta_B(f)=F(f)(x)$. For $g:B -> C$, $F(g)eta_B(f)=F(g f)(x)=eta_C(g f)$, so the family is natural.],[Give its formula and naturality check.]),
 p(4,"E","U6.2 Universal elements",[For the underlying-set functor on groups represented by $ZZ$, identify a universal element.],[A map from $ZZ$ is determined by one generator.],[Choose the integer one.],[The universal element is $1 in ZZ$. Every $g in G$ is the image of one under the unique homomorphism $n |-> g^n$. This is exactly the universal-element property.],[State the unique homomorphism explicitly.]),
 p(5,"C","U6.1 Natural binary operations",[Classify natural transformations $X times X -> X$ in sets.],[Represent pairs by maps from a two-element set.],[Yoneda gives one transformation for each element of that set.],[The functor $X times X$ is naturally $"Set"(2,X)$. Yoneda identifies its transformations to the identity with the two elements of $2$. Reconstruction evaluates a map $2 -> X$ at the selected element, giving exactly the two projections.],[Explain the representable identification and reconstructed operations.]),
 p(6,"C","U6.2 Contravariant representables",[Given $f:A -> B$, write the natural transformation $cal(C)(-,A) => cal(C)(-,B)$ and prove naturality.],[Postcompose by $f$.],[Precomposition with a test arrow commutes by associativity.],[At $X$, send $u:X -> A$ to $f u:X -> B$. For $k:Y -> X$, $(f u)k=f(u k)$, so the square with the contravariant hom-functor maps commutes.],[Keep the test-arrow direction explicit.]),
 p(7,"C","U6.2 Universal element category",[Show a universal element of a covariant functor is an initial object in its category of elements.],[Unpack arrows in the category of elements.],[Such an arrow is exactly a map satisfying $F(f)(u)=x$.],[From $(A,u)$ to $(X,x)$, the category of elements permits precisely arrows $f:A -> X$ with $F(f)(u)=x$. Universality gives exactly one such arrow for every target object, which is the definition of initiality. The same unpacking proves the converse.],[State both directions.]),
 p(8,"C","U6.1 Empty representing set",[Classify natural transformations from the constant singleton functor on sets to the identity functor.],[The constant singleton functor is represented by the empty set.],[Yoneda asks for an element of the empty set.],[Since $"Set"(emptyset,X)$ is always a singleton, Yoneda identifies the transformations with elements of $emptyset$, so there are none. Directly, the component at the empty set would have to be a function $1 -> emptyset$, which does not exist.],[Give either full argument and recognize the empty-set obstruction.]),
 p(9,"C","U6.2 Uniqueness",[Prove that naturally isomorphic contravariant representables have isomorphic representing objects.],[Use fullness of the Yoneda embedding on the isomorphism and its inverse.],[Faithfulness translates their composite identities back to arrows.],[If $h_A iso h_B$, the natural isomorphism and its inverse correspond to arrows $f:A -> B,g:B -> A$. Their composites correspond to identity transformations. Faithfulness of the embedding gives $g f=1_A$ and $f g=1_B$, so $A iso B$.],[Explain why the arrows are inverse, not merely that both exist.]),
 p(10,"A","U6.1 Natural power operations on groups",[Classify all natural transformations from the underlying-set functor on groups to itself.],[It is represented by $ZZ$.],[An integer $n$ produces the operation $g |-> g^n$.],[Yoneda identifies these transformations with the underlying set of $ZZ$, so each corresponds to one integer $n$. For $g in G$, use the homomorphism $f_g:ZZ -> G$ sending one to $g$. Reconstruction gives $eta_G(g)=f_g(n)=g^n$. Every such power operation is natural because homomorphisms preserve integer powers. The component functions need not themselves be homomorphisms.],[State the last distinction; the target category of the functor is sets.]),
 p(11,"A","U6.2 Nonrepresentability",[Show the constant empty-set functor from sets to sets is not covariantly representable.],[Evaluate a supposed representation at its representing object.],[Every object has an identity arrow.],[If it were represented by $A$, then $"Set"(A,A)$ would be in bijection with the empty set. But it contains $1_A$, even when $A$ is empty. This contradiction proves nonrepresentability.],[Use the identity argument for every possible representing set.]),
 p(12,
  "A",
  "U6.2 Natural n-ary operations",
  [For finite sets $m,n$, classify natural transformations $X^n -> X^m$ on sets, including the empty cases.],
  [Use the covariant representables $"Set"(n,-)$ and $"Set"(m,-)$.],
  [Yoneda identifies transformations with functions $m -> n$.],
  [*Finding the approach.* Tuples are functions out of an indexing set. This turns a claim about operations on every set into a claim about one finite test set.

*Argument.* Yoneda gives $"Nat"("Set"(n,-),"Set"(m,-)) iso "Set"(m,n)$. A function $s:m -> n$ sends an $n$-tuple $x$ to the $m$-tuple $j |-> x(s(j))$, so all operations select and repeat coordinates. If $m$ is empty there is one transformation; if $n$ is empty and $m$ is nonempty there are none. If both are empty there is one.

Evaluate a proposed transformation at the identity tuple $id_n:n -> n$. Its value is a function $s:m -> n$. For any tuple $x:n -> X$, naturality with respect to $x$ forces the transformed tuple to be $x compose s$. Conversely this formula commutes with every map $X -> Y$, proving existence. When $n$ is empty and $m$ is nonempty, evaluating at $X=emptyset$ would require a function from a singleton to the empty set, so no transformation can exist.

*A tempting dead end.* Allowing an arbitrary constant coordinate would require choosing an element of every set naturally, including the empty set. The formula must select an existing input coordinate instead.

*Hypotheses.* The operations are natural with respect to every function of sets. Restricting the category or excluding the empty set changes which arguments are available.],
  [Explain the reversed direction and all empty-set cases.],
  idea: [Evaluate at the generic tuple to recover the entire operation, including all empty-index boundary cases.]),
 p(13,
  "A",
  "U6 Transfer: Families of subsets from pairs",
  [For a function $f:X -> Y$, define $P(f)(S)=f[S]$ and $P(P(f))(cal(A))=\{f[S]:S in cal(A)\}$. Classify all families $theta_X:X times X -> P(P(X))$ satisfying $P(P(f))(theta_X(x,y))=theta_Y(f(x),f(y))$ for every $f$. How many such families are there?],
  [Study the ordered pair of distinct elements in a two-element set. Keep a family of subsets distinct from a single subset.],
  [The value at the generic pair is any collection of subsets of that two-element set. Transport the whole collection by direct image.],
  [*Finding the approach.* Each pair is the image of one generic pair, but the output now has two levels of set structure. Naturality transports a collection of subsets, including its possible empty member.

*Argument.* Put $D=\{0,1\}$ and $cal(A)=theta_D(0,1) subset.eq P(D)$. For each $x,y in X$, let $u:D -> X$ send zero to $x$ and one to $y$. Naturality forces $theta_X(x,y)=\{u[S]:S in cal(A)\}$. Conversely, for any fixed collection $cal(A)$ this formula is natural: applying $f$ to each subset gives precisely the subsets $(f compose u)[S]$, which is the formula for the pair $(f(x),f(y))$. Distinct collections give distinct values at $(0,1)$ in D. There are four subsets of D and thus $2^4=16$ collections. For example, the empty collection gives $emptyset$, the collection containing only the empty subset gives $\{emptyset\}$, and $\{\{0\},\{1\}\}$ gives $\{\{x\},\{y\}\}$. When $x=y$, that last output has one member, as direct image requires. The component at the empty set has empty domain and is unique.

*A tempting dead end.* Counting only the four subsets of D ignores the extra power set. Treating $emptyset$ and $\{emptyset\}$ as the same value also loses a distinct natural family. Defining a separate rule for equal inputs generally fails under functions identifying two points.

*Hypotheses.* Both power-set operations use direct image, and naturality ranges over every function, including identifications. The inputs are ordered, so the two singleton-subset collections remain distinguishable.],
  [Prove determination and naturality, obtain all sixteen collections, and distinguish empty and repeated-input cases.],
  optional: true,
  minutes: 60,
  idea: [Transport a collection attached to a generic pair through two successive direct-image operations; the extra set layer changes the classification.]),
)
