#import "/shared/book.typ": *
= Unit 3 · Homomorphisms and quotients

== Lecture 5 · Kernels, images, and normality
#focus[Use a homomorphism to compare groups, identify its kernel and image, and characterize normal subgroups. Recall functions, inverse images, and cosets.]

*Recall and approach.* Recall inverse images and that normality is invariance under every conjugation.


A useful map between groups must respect their operations. Reduction modulo $n$, the determinant, and the sign of a permutation look different but all translate one group calculation into another.

#definition[Homomorphism][A map $f:G -> H$ is a homomorphism if $f(a b)=f(a)f(b)$. Its kernel is $ker f=\{g:f(g)=e_H\}$ and its image is $"im" f=\{f(g):g in G\}$. An isomorphism is a bijective homomorphism.]

First prove the automatic identities. The equation $f(e_G)=f(e_G)^2$ and cancellation give $f(e_G)=e_H$. Applying $f$ to $g g^(-1)=e_G$ gives $f(g^(-1))=f(g)^(-1)$. The inverse function of an isomorphism respects multiplication because applying $f$ verifies the required equation.

#strategy[Use the subgroup test for kernel and image, then translate equal outputs into a kernel element.]

#theorem[Kernel criterion][The kernel and image of a homomorphism are subgroups. A homomorphism is injective exactly when its kernel is trivial. Its kernel is normal: $g(ker f)g^(-1)=ker f$ for every $g in G$.]
#proof[For kernel elements $a,b$, $f(a b^(-1))=e$, so the subgroup test applies. For image elements $f(a),f(b)$ their quotient is $f(a b^(-1))$. If $f(a)=f(b)$, then $b^(-1)a in ker f$, so a trivial kernel implies $a=b$. Conversely an injective map has only $e_G$ mapping to $e_H$. Finally $f(g n g^(-1))=f(g)e_H f(g)^(-1)=e_H$. This gives one inclusion for the conjugated kernel; replacing $g$ by $g^(-1)$ gives equality.]

#definition[Normal subgroup][A subgroup $N <= G$ is normal, written $N triangleleft G$, if $g N g^(-1)=N$ for all $g$. Equivalently, left and right cosets agree: $g N=N g$.]

#example[Three recurring kernels][The kernel of reduction $ZZ -> ZZ slash n ZZ$ is $n ZZ$. The kernel of $det:"GL"_n(K) -> K^times$ is $"SL"_n(K)$. The kernel of sign is $A_n$. These examples establish normality without enumerating conjugates.]

#theorem[Index two][Every subgroup of index two is normal.]
#proof[For $g in H$, both $g H$ and $H g$ equal $H$. For $g notin H$, both are the complement of $H$: the two left cosets partition $G$, as do the two right cosets. Thus $g H=H g$ for all $g$.]

#warning[Being a subgroup is not enough to be a kernel. In $S_3$, $\{e,(12)\}$ is not normal since $(13)(12)(13)^(-1)=(23)$.]
#example[The same image with different kernels][Consider $f:ZZ->ZZ/6ZZ$ given by $f(n)=[2n]$. Its image is $\{[0],[2],[4]\}$ and its kernel is $3ZZ$. It is not surjective onto its stated codomain, but it is surjective onto its image. The quotient predicted by the first isomorphism theorem will therefore have three elements, not six.]

For a candidate homomorphism, test the identity and products before calculating a kernel. A subset defined as the inverse image of identity has the useful kernel properties only after multiplication preservation is established. A map with arbitrary formula does not acquire normality just because its zero set was named “kernel.”

#checkpoint("3.1", [Why can a nontrivial homomorphism $C_p -> H$, for prime $p$, not identify distinct elements?], [Its kernel is a subgroup of $C_p$, hence either trivial or the whole group. The latter would make the homomorphism trivial.])
#takeaways[The kernel measures loss of information; normality is exactly the closure property needed to turn that loss into a quotient.]
#study-links("U3")

== Lecture 6 · Quotients and isomorphism theorems
#focus[Construct quotient groups, prove representative independence, and apply the first, second, and third isomorphism theorems.]

*Recall and approach.* Recall normality permits multiplication of cosets and that a kernel detects equality of outputs.


#definition[Quotient group][For $N triangleleft G$, the set $G slash N$ becomes a group under $(a N)(b N)=a b N$. Its identity is $N$ and $(a N)^(-1)=a^(-1)N$.]

The key issue is well-definedness. Replacing $a,b$ by $a n,b m$ gives $a n b m=a b(b^(-1)n b)m$, which belongs to $a b N$ because normality puts $b^(-1)n b$ in $N$. Associativity descends from $G$. The projection $pi(g)=g N$ is a surjective homomorphism with kernel $N$.

#theorem[First isomorphism theorem][For a homomorphism $f:G -> H$, the map $overline(f):G slash ker f -> "im" f$, $g ker f |-> f(g)$, is an isomorphism.]
#strategy[Do not just count elements. Establish well-definedness, preservation of multiplication, surjectivity, and injectivity separately.]
#proof[Equality of cosets means $b^(-1)a in ker f$, hence $f(a)=f(b)$, so the map is well defined. It preserves multiplication since $f$ does. Every element of the image has the form $f(g)$, giving surjectivity. If $overline(f)(g ker f)=e$, then $g in ker f$, so the quotient kernel is trivial and the map is injective.]

#diagram-square[$G$][$"im" f$][$G slash ker f$][$"im" f$][$f$][$pi$][$id$][$overline(f)$]

#theorem[Second and third isomorphism theorems][If $H<=G$ and $N triangleleft G$, then $H N$ is a subgroup and $H slash (H inter N) iso (H N) slash N$. If $N triangleleft G$, $M triangleleft G$, and $N subset.eq M$, then $(G slash N) slash (M slash N) iso G slash M$. Here $iso$ denotes a group isomorphism.]
#proof[Normality allows factors from $N$ to move past factors from $H$, proving closure and inverse closure of $H N$. Restrict $G -> G slash N$ to $H$: its kernel is $H inter N$ and image is $H N slash N$, so the first theorem applies. For the third theorem use $g N |-> g M$. It is well defined because $N subset.eq M$, surjective, and its kernel is $M slash N$. Apply the first theorem again.]

#example[Collapsing in stages][Reduction $ZZ slash 12 ZZ -> ZZ slash 4 ZZ$ has kernel $\{[0],[4],[8]\}$. Thus quotienting $ZZ slash 12 ZZ$ by that subgroup gives $ZZ slash 4 ZZ$. The kernel has three elements and the quotient has four, which agrees with Lagrange.]

The correspondence theorem follows from inverse image under $pi$: subgroups of $G slash N$ correspond to subgroups of $G$ containing $N$, by $K |-> pi^(-1)(K)$ and $H |-> H slash N$. These operations are inverse because $pi$ is surjective and $H$ contains the kernel. Normal subgroups correspond to normal subgroups, as conjugation commutes with projection.

#example[Designing a quotient map from the desired answer][To identify $(ZZ/20ZZ)/chevron.l [5] chevron.r$, start with reduction $ZZ/20ZZ->ZZ/5ZZ$. It is well defined because five divides twenty. Its kernel is $\{[0],[5],[10],[15]\}$, exactly the named subgroup, so the quotient is $ZZ/5ZZ$. The order check is $20/4=5$.]

More generally, to show a function on cosets is well defined, suppose two representatives differ by a member of the relevant kernel and show the proposed outputs agree. A formula and a cardinality match alone cannot replace that test. This procedure will be reused for rings, vector spaces, and modules.

#checkpoint("3.2", [Why does $g N |-> g M$ require $N subset.eq M$?], [Every $n in N$ represents the identity coset in $G slash N$ and must map to $M$; this forces $n in M$.])
#takeaways[Most quotient isomorphisms come from a natural map followed by a kernel calculation. State that map before guessing the answer.]
#study-links("U3")
