#import "/shared/book.typ": *
#let p = problem.with(code: "MM7030", unit: "U3")
#let items = (
 p(1,"E","U3.1 Naturality",[Write the naturality equation for $eta:F => G$ at $f:A -> B$.],[Draw a square with $F A,G A,F B,G B$.],[Both paths must run from $F A$ to $G B$.],[The equation is $G(f)eta_A=eta_B F(f)$. The left path goes first across at $A$ and then down by $G f$; the right path first uses $F f$ and then the component at $B$.],[Check the domain and codomain of each factor.]),
 p(2,"E","U3.2 Identities",[Show the identity maps $1_(F A)$ form a natural transformation $F => F$.],[Insert them into the naturality equation.],[Both sides reduce to $F f$.],[$F f 1_(F A)=F f=1_(F B)F f$ by identity laws. Thus the component family is natural.],[Use identity arrows at the correct objects.]),
 p(3,"E","U3.1 Natural projections",[Show $pi_1:X times X -> X$ is natural in the set $X$.],[The product functor sends $f$ to $f times f$.],[Evaluate both composites on $(x,y)$.],[Both $f pi_1$ and $pi_1(f times f)$ send $(x,y)$ to $f(x)$. Hence the square commutes for every function $f$, proving naturality.],[Quantify over all functions.]),
 p(4,"E","U3.2 Components",[Describe a natural transformation between two constant functors with values $A,B$ when the source is the terminal one-object category.],[There is just one component.],[The only naturality equation involves identity arrows.],[It is any arrow $A -> B$. The sole naturality equation is $1_B eta=eta 1_A$, automatically true.],[Explain why no additional compatibility condition occurs.]),
 p(5,"C","U3.1 Diagonal",[Show the diagonal $Delta_X:X -> X times X$ is natural and each component is injective.],[Evaluate on an element.],[Both square paths produce $(f(x),f(x))$.],[For any $f:X -> Y$, $(f times f)Delta_X(x)=(f(x),f(x))=Delta_Y f(x)$, proving naturality. If $Delta_X(x)=Delta_X(y)$, equality of first coordinates gives $x=y$, so each component is injective.],[Prove naturality separately from injectivity.]),
 p(6,"C","U3.2 Vertical composition",[Prove vertical composition of natural transformations is associative.],[Compute the component at an arbitrary object.],[Use associativity in the target category.],[For composable $eta,theta,kappa$, the components of $(kappa theta)eta$ and $kappa(theta eta)$ are $(kappa_A theta_A)eta_A$ and $kappa_A(theta_A eta_A)$, equal by associativity. Transformations are equal when all components agree, so composition is associative.],[Include the componentwise equality criterion.]),
 p(7,"C","U3.1 Inverse naturality",[If $eta:F => G$ is natural and each component is invertible, prove the inverse family is natural.],[Rearrange the naturality equation by composing with inverses.],[Start from $G f eta_A=eta_B F f$.],[Compose on the left with $eta_B^(-1)$ and on the right with $eta_A^(-1)$ to obtain $eta_B^(-1)G f=F f eta_A^(-1)$. This is the naturality equation for a transformation $G => F$. Componentwise inverse equations make it the inverse transformation.],[Keep the indices consistent.]),
 p(8,"C","U3.2 Group actions",[For two actions of a group $G$ on sets $X,Y$, show natural transformations of the corresponding functors are exactly equivariant functions.],[There is one component, a function $T:X -> Y$.],[Naturality at $g$ is the equivariance equation.],[Because the group category has one object, the component family is one function $T$. Naturality at each arrow $g$ says $T(g dot x)=g dot T(x)$ for every $x$. These are precisely the equations defining an equivariant function. Conversely an equivariant function satisfies every naturality square.],[State both directions.]),
 p(9,"C","U3.1 Double dual",[Verify naturality of the canonical map $V -> V^(**)$ by evaluating on a linear functional.],[Equality of functionals can be checked at an arbitrary argument.],[For $f:V -> W$ and $psi in W^*$, both values are $psi(f(v))$.],[Let $eta_V(v)(phi)=phi(v)$. Then $f^(**)(eta_V(v))(psi)=eta_V(v)(psi f)=psi(f(v))=eta_W(f(v))(psi)$. Equality for every $psi$ gives $f^(**)eta_V=eta_W f$.],[State the types of $v,psi$, and the dual maps.]),
 p(10,"A","U3.1 Natural endomorphisms of sets",[Classify all natural transformations from the identity functor on sets to itself without using Yoneda.],[Use maps from a singleton selecting elements.],[The component on a singleton is forced to be its identity.],[Let $eta$ be natural. For $x in X$, let $i_x:1 -> X$ select $x$. The only function $1 -> 1$ is the identity, so naturality gives $eta_X(x)=eta_X i_x(*)=i_x eta_1(*)=x$. Thus every component is the identity, including the unique map on the empty set. The identity family is natural, so it is the only one.],[Handle arbitrary elements via naturality, not a choice of ordering.]),
 p(11,"A","U3.2 Center of a group",[Identify the natural endomorphisms of the identity functor of a group regarded as a one-object category.],[A component is a group element.],[Naturality says it commutes with every group arrow.],[A transformation is an element $z in G$ with $g z=z g$ for every $g$. Thus its elements are exactly $Z(G)$. Vertical composition is multiplication of these components, and every component is invertible, so these transformations form the center as a group.],[Describe both the set of transformations and its composition.]),
 p(12,
  "A",
  "U3.1 Scalar natural operations (proof reconstruction)",
  [Show every natural endomorphism of the identity functor on $K$-vector spaces is multiplication by a single scalar.],
  [Evaluate the component on the one-dimensional space at one.],
  [Use the linear map $K -> V$ taking one to a chosen vector.],
  [*Finding the approach.* Use a one-dimensional test object. Every vector is the image of its distinguished element under a linear map, so naturality propagates one scalar to every space.

*Argument.* Let $c=eta_K(1)$. For $v in V$, the map $i_v:K -> V$, $a |-> a v$, is linear. Naturality gives $eta_V(v)=eta_V i_v(1)=i_v eta_K(1)=c v$. Thus all components use the same scalar. Conversely scalar multiplication commutes with every linear map, so every $c in K$ yields such a transformation.

Naturality of $i_v$ is the equation $eta_V compose i_v=i_v compose eta_K$. Evaluating at one is legitimate because both sides are functions from $K$ to $V$. The scalar $c$ is chosen once from the component at $K$, not separately for each $V$. The zero vector space causes no exception: it has only one endomorphism and scalar multiplication is that map. Conversely, for any linear $f$, $f(c v)=c f(v)$ verifies the full naturality square.

*A tempting dead end.* Checking that each component is some scalar multiple of the identity does not establish that the scalar is the same for all spaces. Naturality is the compatibility that forces uniformity.

*Hypotheses.* Components and test maps are linear, and the category contains $K$ and all maps $i_v$. Restricting the available test maps could allow more transformations.],
  [Prove the scalar is independent of both the vector and the space.],
  idea: [The component at the free one-generator object determines every other component through maps carrying its generator to an arbitrary vector.]),
 p(13,
  "A",
  "U3 Transfer: Uniform operations on subsets",
  [Let $P$ send a set to its power set and a function to direct image. Classify all natural transformations $P => P$ on the category of sets.],
  [First determine what happens to the empty subset and to the full subset of a singleton.],
  [For a nonempty set $A$, use permutations of $A$, its map to a singleton, and its inclusion in a larger set.],
  [*Finding the approach.* Naturality under permutations forces any output attached to the whole set to treat all points alike. A map to the singleton synchronizes the choice across different sets.

*Argument.* Let $eta$ be natural. The unique map from the empty set to $X$ implies $eta_X(emptyset)=emptyset$. Write $S_A=eta_A(A)$ for nonempty $A$. Every permutation of $A$ fixes its full subset, so naturality makes $S_A$ invariant under all permutations. If it contains one point, transpositions show it contains every point; otherwise it is empty. Under the map $A -> 1$, naturality says the direct image of $S_A$ equals $eta_1(1)$, so all nonempty $A$ choose the same case. For an arbitrary subset $B subset X$, inclusion $i:B -> X$ gives $eta_X(B)=i(eta_B(B))$. Therefore either every subset is sent to itself, or every subset is sent to the empty set. Both operations commute with direct images, so these two transformations are exactly the answer.

*A tempting dead end.* Testing only bijections permits choices depending on cardinality. Naturality under all functions removes those extra choices.

*Hypotheses.* The power-set functor is covariant by direct image. The proof would be a different problem for inverse image on the opposite category.],
  [Include empty subsets, nonempty sets, arbitrary inclusions, and verification of both resulting transformations.],
  optional: true,
  minutes: 60,
  idea: [Use symmetry to limit local possibilities, then noninvertible maps to force one global choice.]),
)
