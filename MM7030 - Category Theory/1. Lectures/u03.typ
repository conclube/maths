#import "/shared/book.typ": *
= Unit 3 · Natural transformations

== Lecture 5 · Naturality is a compatibility equation
#focus[Write and check naturality squares, distinguish arbitrary component maps from natural transformations, and recognize natural isomorphisms.]

*Recall and approach.* Recall functoriality and equality of functions established by evaluation on every input.


Two functors can translate the same category in different ways. A natural transformation compares them coherently: it must make the comparison commute with every morphism, not merely supply one map for each object.

#definition[Natural transformation][For $F,G:cal(C) -> cal(D)$, a natural transformation $eta:F => G$ assigns $eta_A:F A -> G A$ to each object, such that $G(f) eta_A=eta_B F(f)$ for every $f:A -> B$.]
#diagram-square[$F A$][$G A$][$F B$][$G B$][$eta_A$][$F f$][$G f$][$eta_B$]

The square is an efficient memory aid: follow the two routes from $F A$ to $G B$. This also detects a misplaced functor or component index before any calculation begins.

#example[Evaluation into the double dual][For a vector space $V$, define $eta_V:V -> V^(**) $ by $eta_V(v)(phi)=phi(v)$. For $f:V -> W$, the double dual sends $Phi$ to the functional $psi |-> Phi(psi f)$. Thus $f^(**)(eta_V(v))(psi)=psi(f(v))=eta_W(f(v))(psi)$. This is natural. For finite-dimensional spaces it is an isomorphism.]

The finite-dimensional assertion follows because a basis and its dual basis show injectivity and equal dimension. Naturality of the map itself requires no basis. This is why the double-dual identification is canonical while an isomorphism between $V$ and $V^*$ constructed from a chosen basis generally is not.

#strategy[Compare the two routes through the square at a general arrow; invert components only after writing that equation.]

#theorem[Pointwise criterion for natural isomorphisms][A natural transformation is invertible if and only if every component is an isomorphism.]
#proof[An inverse transformation supplies componentwise inverses. Conversely, if every $eta_A$ is invertible, rearrange $G f eta_A=eta_B F f$ to get $F f eta_A^(-1)=eta_B^(-1)G f$. This is exactly the naturality of the family of inverse components. Their compositions with $eta$ are identity transformations.]

#warning[“There exists an isomorphism for each object” does not establish naturality. One must either exhibit compatible choices or prove the given construction commutes with every arrow.]
#example[A natural inclusion of singletons into power sets][Let the power-set functor use direct image. The map $s_X:X->cal(P)(X)$ sending $x$ to $\{x\}$ is natural: direct image sends $\{x\}$ to $\{f(x)\}$, which is the same as first applying $f$ and then $s_Y$. Changing the power-set arrow assignment to inverse image reverses its variance; the same displayed square is then not even typed. Naturality is always relative to specified functors, including their actions on arrows.]

*Failure test.* A proposal to choose one distinguished element of every nonempty set naturally fails on a two-element set: its transposition would have to fix the chosen element, but fixes neither. This is a useful way to detect that objectwise choices cannot be made compatible with all symmetries.

#checkpoint("3.1", [For a fixed set $S$, is $eta_X:X -> X times S$, $x |-> (x,s_0)$ natural in $X$?], [Yes, after choosing one fixed $s_0 in S$. Both paths in the naturality square send $x$ to $(f(x),s_0)$. If $S$ is empty, such components do not exist for nonempty $X$.])
#takeaways[Naturality is an equation with content. Test it on a general arrow, not just an identity.]
#study-links("U3")

== Lecture 6 · Functor categories and composition
#focus[Compose natural transformations, build functor categories, and interpret naturality for one-object categories.]

*Recall and approach.* Recall composition of transformations and the distinction between an object-level arrow and a whole family of components.


For small $cal(C)$ and locally small $cal(D)$, functors $cal(C) -> cal(D)$ and natural transformations form a category $[cal(C),cal(D)]$. Smallness ensures the component families form sets. Identity transformations have components $1_(F A)$.

#strategy[Prove the component family is natural before using componentwise associativity. For horizontal composition, use the middle naturality square.]

#theorem[Vertical composition][If $eta:F => G$ and $theta:G => H$, then $(theta eta)_A=theta_A eta_A$ defines a natural transformation $F => H$.]
#proof[For $f:A -> B$, $H f theta_A eta_A=theta_B G f eta_A=theta_B eta_B F f$, using the two naturality equations. Associativity and identity laws hold componentwise, inherited from $cal(D)$.]

One can also compose a transformation with a functor. Given $K:cal(D) -> cal(E)$, the components $K(eta_A)$ form $K eta:K F => K G$, because $K$ preserves the naturality equation. Given $L:cal(B) -> cal(C)$, the components $eta_(L B)$ form $eta L:F L => G L$. These operations are called whiskering.

#theorem[Horizontal composition][For $eta:F => G$ with $F,G:cal(C) -> cal(D)$ and $theta:H => K$ with $H,K:cal(D) -> cal(E)$, the components $theta_(G A) H(eta_A)$ define a transformation $H F => K G$. They also equal $K(eta_A)theta_(F A)$.]
#proof[The equality of the two expressions is naturality of $theta$ applied to $eta_A$. For $f:A -> B$, use naturality of $theta$ at $G f$, functoriality of $H$, and naturality of $eta$ to obtain $K G f theta_(G A)H eta_A=theta_(G B)H eta_B H F f$. This is the required square.]

#example[Representations as functors][Regard a group $G$ as a one-object category. A functor into vector spaces selects a vector space $V$ and invertible linear maps $rho(g)$ with $rho(g h)=rho(g)rho(h)$. This is a representation. A natural transformation between two representations is a linear map $T$ satisfying $T rho(g)=sigma(g)T$ for every $g$: an intertwiner.]

This example shows that transformations need not be isomorphisms. The zero intertwiner is natural; an arbitrary linear map usually is not. Naturality encodes compatibility with an entire algebraic structure at once.

#example[Intertwiners as a system of equations][Let a generator of $C_2$ act on $K^2$ by $D=mat(1,0;0,-1)$, over a field of characteristic not two. A natural endomorphism is a matrix $T=mat(a,b;c,d)$ satisfying $T D=D T$. Comparing entries gives $b=-b$ and $c=-c$, hence $b=c=0$. Thus exactly the diagonal matrices intertwine this action. In characteristic two, $D$ becomes the identity and every matrix intertwines, showing that the coefficient-field hypothesis has content.]

Composition of two such diagonal intertwiners is again diagonal, illustrating vertical composition concretely. Whiskering by the underlying-set functor retains the same compatible functions but forgets their linear structure. It does not assert that every equivariant set function is linear.

#checkpoint("3.2", [For a group as a one-object category, what is a natural transformation between two group homomorphisms $F,G$ into a group $H$?], [An element $h in H$ with $G(g)h=h F(g)$ for every $g$. Equivalently $G(g)=h F(g)h^(-1)$.])
#takeaways[Functor categories let us treat whole diagrams as objects. Naturality supplies their morphisms, and componentwise reasoning proves their category laws.]
#study-links("U3")
