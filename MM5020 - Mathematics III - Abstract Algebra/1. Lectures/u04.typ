#import "/shared/book.typ": *
= Unit 4 · Actions and simple groups

== Lecture 7 · Actions, orbits, and stabilizers
#focus[Translate a symmetry problem into a group action, compute stabilizers, and prove orbit–stabilizer. Recall cosets and homomorphisms.]

*Recall and approach.* Recall a group action is a homomorphism to permutations of a specified set.


An abstract group becomes visible through what it does to a set. A group can act on several different sets, and each action reveals different information. For example, square symmetries act on vertices, edges, and diagonals; these actions have different stabilizers.

#definition[Group action][A left action of $G$ on $X$ assigns $g dot x in X$ to $g in G,x in X$, with $e dot x=x$ and $(g h) dot x=g dot(h dot x)$. The orbit is $G x=\{g dot x:g in G\}$ and the stabilizer is $G_x=\{g:g dot x=x\}$.]

For each $g$, the map $x |-> g dot x$ is a bijection with inverse the map associated with $g^(-1)$. Thus an action is equivalently a homomorphism $G -> S_X$. The stabilizer is a subgroup by the subgroup test. Being in the same orbit is an equivalence relation, so the orbits partition $X$.

#strategy[Construct a bijection from cosets to an orbit, and for fixed-point counting count the same incidence set in two orders.]

#theorem[Orbit–stabilizer][The map $G slash G_x -> G x$, $g G_x |-> g dot x$, is a bijection of sets. For finite $G$, $|G x|=|G|/|G_x|$. No normality of $G_x$ is required.]
#proof[The images of $g$ and $h$ agree exactly when $h^(-1)g dot x=x$, equivalently $h^(-1)g in G_x$, equivalently $g G_x=h G_x$. This simultaneously proves well-definedness and injectivity. Surjectivity is the definition of the orbit. Count cosets for the final statement.]

#example[The square][The dihedral group $D_8$ has eight symmetries. It acts transitively on the four vertices. The stabilizer of a vertex consists of the identity and reflection in the diagonal through that vertex, so its order is two and $4=8/2$. On the two diagonals, a diagonal stabilizer instead has order four.]

#theorem[Cayley's theorem][Every group embeds in a permutation group. A finite group of order $n$ embeds in $S_n$.]
#proof[Let $G$ act on itself by left multiplication. The associated homomorphism $lambda:G -> S_G$ is injective because $lambda(g)=id$ implies $g=lambda(g)(e)=e$.]

#theorem[Counting orbits by fixed points][For finite $G,X$, the number of orbits is $|G|^(-1) sum_(g in G)|X^g|$, where $X^g=\{x:g dot x=x\}$.]
#proof[Count pairs $(g,x)$ with $g dot x=x$. Counting by $g$ gives the numerator; counting by $x$ gives $sum_x |G_x|$. On one orbit, stabilizers have equal size because $G_(h x)=h G_x h^(-1)$, and orbit–stabilizer makes their total $|G|$. Each orbit contributes once after division.]

#example[Burnside counting on a triangle][Color the three vertices of a triangle with two colors and identify colorings under rotation. There are eight labeled colorings. The identity rotation fixes all eight, while each nonidentity rotation forces all three vertices to share a color and fixes two. The number of orbits is $(8+2+2)/3=4$. They can be represented by colorings with zero, one, two, or three vertices of the first color.]

This second description checks the count. Dividing eight by three would fail because orbit sizes are not all three: the two monochromatic colorings have larger stabilizers and singleton orbits. The fixed-point average automatically accounts for these different stabilizers.

#checkpoint("4.1", [Why is the left multiplication action faithful even when $G$ has a nontrivial center?], [Any element fixing all points fixes $e$, and $g e=g$, so that element is $e$. The center concerns conjugation, a different action.])
#takeaways[Specify the set and the action before computing an orbit or stabilizer. U4 connects these counts to internal group structure.]
#study-links("U4")

== Lecture 8 · Conjugacy, the class equation, and simplicity
#focus[Use conjugacy classes to restrict normal subgroups and prove simplicity of $A_5$. Recall permutations, normality, and orbit–stabilizer.]

*Recall and approach.* Recall a conjugation orbit has stabilizer the centralizer, and a normal subgroup contains whole conjugacy classes.


#definition[Center and centralizer][The center is $Z(G)=\{z:z g=g z " for every " g\}$. The centralizer of $x$ is $C_G(x)=\{g:g x=x g\}$. In the conjugation action $g dot x=g x g^(-1)$, the stabilizer is $C_G(x)$.]

#strategy[Partition into conjugacy classes, then combine their allowed unions with subgroup divisibility.]

#theorem[Class equation][For finite $G$, $|G|=|Z(G)|+sum_i [G:C_G(x_i)]$, where one $x_i$ is chosen from each noncentral conjugacy class. If $|G|=p^n$ with $n>=1$ and $p$ prime, then $Z(G)$ is nontrivial.]
#proof[Partition $G$ into conjugacy classes. A class has one element precisely when that element is central. Every other class in a group of prime-power order has size a positive power of $p$ greater than one, by orbit–stabilizer and Lagrange. Reducing the class equation modulo $p$ shows $p$ divides $|Z(G)|$. Since the identity is central, the center has at least $p$ elements.]

#definition[Simple group][A nontrivial group is simple if its only normal subgroups are $\{e\}$ and the whole group. A finite abelian simple group is cyclic of prime order: any nonidentity element generates a normal subgroup, and a composite-order cyclic group has a proper nontrivial subgroup.]

#theorem[A nonabelian simple group][$A_5$ is simple.]
#strategy[Normal subgroups are unions of conjugacy classes containing the identity. Combine class sizes with Lagrange's theorem.]
#proof[The even permutations on five letters have types: identity, three-cycle, product of two disjoint transpositions, or five-cycle. There are respectively $1,20,15,24$. For a three-cycle, a commuting permutation preserves its three-point support and its two-point complement; the centralizer in $S_5$ has order $3 dot 2$, but its swap on the complement is odd, so the centralizer in $A_5$ has order three. Thus its $A_5$ class has size $60/3=20$. A double transposition fixes a unique point. Its centralizer on the other four points has order eight (choose the image of one point in four ways and then choose whether to interchange its two pairs); exactly half are even, since it contains an odd transposition commuting with the element. Its class therefore has size fifteen. A five-cycle has centralizer its five powers: a commuting permutation is determined by the image of one point. These powers are even, so each $A_5$ class has size twelve; the twenty-four five-cycles form two classes. A normal subgroup thus has order one plus a subset sum of $20,15,12,12$. The resulting orders are $1,13,16,21,25,28,33,36,40,45,48,60$. Only $1$ and $60$ divide $60$. Lagrange finishes the proof.]

This proof explains why a list of possible orders is insufficient: the conjugacy constraint eliminates the otherwise plausible divisors. It also shows that nonabelian simple groups exist without classifying all finite groups.

#warning[The assertion “a group has no proper subgroups” is stronger than simplicity and false for $A_5$. Simplicity excludes proper nontrivial *normal* subgroups.]
#example[Why a center constrains the whole group][If $G/Z(G)$ is generated by $g Z(G)$, every element can be written $g^r z$ with $z$ central. Two such elements commute: $(g^r z)(g^s w)=g^(r+s)z w=g^(s+r)w z$. Hence $G$ is abelian. Applied to a group of order $p^2$, a center of size $p$ would make the quotient cyclic and force the center to be all of $G$, a contradiction.]

This combines a counting argument with a structural lemma. Counting alone permits center sizes $p$ and $p^2$; understanding a cyclic quotient eliminates the first. In the simplicity proof, the analogous extra information is that normal subgroups are unions of entire classes.

#checkpoint("4.2", [Can a group of order $p^2$ have trivial center?], [No, by the class equation. In fact it is abelian: if its center had order $p$, the quotient by the center would be cyclic, which forces the original group to be abelian, a contradiction.])
#takeaways[Actions turn structure into arithmetic. Normality adds a union-of-classes constraint which counting alone cannot see.]
#study-links("U4")
