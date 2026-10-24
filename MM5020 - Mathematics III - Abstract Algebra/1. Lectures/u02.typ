#import "/shared/book.typ": *
= Unit 2 · Cosets and permutations

== Lecture 3 · Cosets and Lagrange's theorem
#focus[Construct cosets, distinguish left from right cosets, and use divisibility of orders correctly. Recall equivalence relations and partitions.]

*Recall and approach.* Recall an equivalence relation partitions a set and a bijection preserves cardinality.


For integers, congruence modulo $n$ groups numbers into translates of $n ZZ$. Cosets extend this construction to arbitrary groups. They are sets of elements, not automatically elements of another group.

#definition[Left coset and index][For $H <= G$, the left coset of $H$ represented by $g$ is $g H=\{g h:h in H\}$. The index $[G:H]$ is the number of distinct left cosets.]

#strategy[Prove coset equality by a membership criterion, then count a disjoint partition.]

#theorem[Coset partition][Two left cosets are equal or disjoint. Moreover $a H=b H$ if and only if $b^(-1)a in H$, and each coset has the same cardinality as $H$.]
#proof[If $a h=b k$, then $b^(-1)a=k h^(-1) in H$. Conversely if $a=b u$ with $u in H$, then $a H=b u H=b H$, because $u H=H$. Every $g$ belongs to $g H$, so the cosets cover $G$, and the preceding argument proves disjointness. Left multiplication $h |-> g h$ is a bijection $H -> g H$, with inverse $x |-> g^(-1)x$.]

#theorem[Lagrange][If $G$ is finite and $H <= G$, then $|G|=[G:H]|H|$. In particular the order of an element divides $|G|$.]
#proof[Count the elements in the disjoint coset partition. Apply the result to $chevron.l a chevron.r$, which has $"ord"(a)$ elements.]

Consequently $a^(|G|)=e$ for finite $G$. A group of prime order $p$ is cyclic: any $a!=e$ has order dividing $p$ and greater than one, hence order $p$. These are consequences of a theorem, not extra assumptions about the operation.

#example[A nonnormal subgroup already has cosets][In $S_3$, let $H=\{e,(12)\}$. There are three left cosets, each containing two permutations. The left coset $(13)H$ need not equal the right coset $H(13)$. Lagrange's theorem uses neither commutativity nor normality.]

The converse to Lagrange is false in general: a divisor of a group order need not occur as a subgroup order. We will give a concrete example using $A_4$ after discussing normality. When using Lagrange, record the direction: an existing subgroup imposes divisibility; divisibility alone does not construct a subgroup.

#warning[The statement $a^(|G|)=e$ does not mean that $a$ has order $|G|$. In $C_2 times C_2$, all elements satisfy $a^4=e$, although no element has order four.]
#example[Left and right cosets visibly differ][In $S_3$ with $H=\{e,(12)\}$, compute $(13)H=\{(13),(123)\}$ using right-to-left composition. On the other side, $H(13)=\{(13),(132)\}$. Both sets contain two elements and both contain $(13)$, but they are not equal. This does not violate the left-coset partition theorem, which compares two left cosets of the same subgroup, not a left coset with a right coset.]

When solving an order problem, write “divides” before choosing among possible values. The theorem restricts candidates; a construction or another theorem must establish that a candidate actually occurs.

#checkpoint("2.1", [Can a group of order $35$ have an element of order $6$?], [No: the order of an element must divide the group order, and $6$ does not divide $35$.])
#takeaways[Cosets are a counting tool before they become an algebraic construction. U2.01–U2.06 practice translating between membership, equality, and counting.]
#study-links("U2")

== Lecture 4 · Permutations, cycle structure, and parity
#focus[Compute compositions, determine orders from disjoint cycles, and prove that parity is well defined. Prerequisites: bijections and determinants.]

*Recall and approach.* Recall composition order and that swapping two columns changes a determinant sign.


Permutations are a concrete laboratory for noncommutative algebra. We compose right to left: in $sigma tau$, apply $tau$ first. A cycle $(a_1 a_2 dots a_r)$ sends each listed element to the next and the last to the first, fixing all others.

#strategy[Follow each orbit to obtain disjoint cycles, then use an invariant determinant to prove parity is independent of factorization.]

#theorem[Disjoint-cycle decomposition][Every permutation of a finite set is a product of disjoint cycles, unique up to reordering cycles and rotating each cycle's notation. Its order is the least common multiple of the cycle lengths.]
#proof[Start at an element and repeatedly apply the permutation. Finiteness forces a repetition; injectivity ensures the first repeated element is the starting element. This gives one cycle. Repeat on the remaining elements. The resulting orbits are disjoint and determined by the permutation, proving uniqueness in the stated sense. A power fixes every element exactly when its exponent is divisible by every cycle length, proving the order formula.]

Every cycle is a product of transpositions:
$ (a_1 a_2 dots a_r)=(a_1 a_r)(a_1 a_(r-1)) dots (a_1 a_2). $
The order of these transpositions can be checked by following $a_1$, an intermediate $a_i$, and $a_r$ separately.

#definition[Sign and alternating group][Let $P_sigma$ be the matrix with $P_sigma e_i=e_(sigma(i))$. Define $"sgn"(sigma)=det(P_sigma)$. The alternating group is $A_n=\{sigma in S_n:"sgn"(sigma)=1\}$.]

#theorem[Parity][The sign map is a homomorphism $S_n -> \{1,-1\}$. Every transposition has sign $-1$, so any two transposition expressions for the same permutation have the same parity. For $n>=2$, $|A_n|=n!/2$.]
#proof[Matrix multiplication gives $P_(sigma tau)=P_sigma P_tau$, and determinants multiply. A transposition interchanges two basis columns, so its determinant is $-1$. An expression with $r$ transpositions therefore has sign $(-1)^r$, independent of the expression because the determinant is fixed. Multiplication by a fixed transposition bijects even and odd permutations. There are $n!$ permutations in total.]

#example[Two independent computations][The permutation $(1 4 2)(3 5)$ has order $"lcm"(3,2)=6$ and sign $(-1)^2(-1)=-1$. Order and sign answer different questions; an odd permutation can have an order much larger than two.]

#warning[Disjoint cycles commute. Arbitrary cycles do not. A factorization into transpositions is highly nonunique even though its parity is fixed.]
#example[Two descriptions of the same permutation][For $sigma=(1234)(13)$, tracking one gives $1->4->1$, while tracking two gives $2->3->2$. Thus $sigma=(14)(23)$, with order two and positive sign. Independently its sign is the product of the negative signs of the four-cycle and transposition, again positive. These two calculations check different aspects of the answer.]

An efficient checking procedure is to list the image of each letter once, close its cycle, and remove those letters from consideration. Never infer the order of a product by multiplying the orders of non-disjoint factors; here orders four and two produced order two, not eight.

#checkpoint("2.2", [What are the sign and order of a four-cycle?], [Its sign is $(-1)^3=-1$ and its order is four.])
#takeaways[Cycle decomposition supports both computation and proof. The determinant supplies a conceptual reason that parity does not depend on a chosen factorization.]
#study-links("U2")
