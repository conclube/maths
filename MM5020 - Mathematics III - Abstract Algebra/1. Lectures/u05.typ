#import "/shared/book.typ": *
= Unit 5 · Rings and their quotients

== Lecture 9 · Rings, units, matrices, and quaternions
#focus[Distinguish additive and multiplicative structure, recognize zero divisors, and compare fields with division rings. Recall matrices and complex arithmetic.]

*Recall and approach.* Recall zero divisors obstruct cancellation and a division ring need not commute.


A ring supports addition and multiplication linked by distributivity. Addition must be an abelian group; multiplication need only be associative. Throughout these notes rings have an identity $1$, ring homomorphisms preserve it, and the zero ring is allowed unless explicitly excluded. A field and an integral domain always have $1!=0$.

#definition[Ring vocabulary][A *unit* is an element with a two-sided multiplicative inverse. A nonzero element $a$ is a zero divisor if $a b=0$ or $b a=0$ for some nonzero $b$. An *integral domain* is a commutative nonzero ring without zero divisors. A *field* is a commutative nonzero ring in which every nonzero element is a unit; a *division ring* drops commutativity.]

The units $R^times$ form a group: products of units are units with reversed inverse order. By contrast the nonzero elements need not be closed under multiplication. In $ZZ slash 6 ZZ$, $[2][3]=[0]$.

#strategy[Use injective multiplication in a finite domain; for quaternions, multiply by a conjugate and exploit a positive central norm.]

#theorem[Finite domains are fields][Every finite integral domain is a field.]
#proof[For nonzero $a$, multiplication $x |-> a x$ is injective: $a x=a y$ implies $a(x-y)=0$, hence $x=y$. An injective self-map of a finite set is surjective, so some $b$ satisfies $a b=1$. Commutativity gives $b a=1$.]

#example[Matrix rings][$M_n(K)$ is a ring under matrix operations. For $n>=2$ it is noncommutative and has zero divisors. For instance $E_(11) E_(22)=0$ although neither factor is zero. Its units are precisely the invertible matrices. The scalar matrices form a commutative subring, but nonzero scalar matrices are only some of the units.]

#definition[Quaternions][The real quaternion algebra $bb(H)$ has basis $1,i,j,k$, with $i^2=j^2=k^2=-1$, $i j=k$, $j k=i$, $k i=j$, and reversed products negative. For $q=a+b i+c j+d k$, define $overline(q)=a-b i-c j-d k$.]

Associativity can be justified rather than assumed from a multiplication table: write $q=z+w j$ with $z,w in CC$ and represent it by the complex matrix $mat(z,w; -overline(w),overline(z))$. Direct multiplication shows these matrices are closed and reproduce the displayed relations, and the representation is injective. Associativity then follows from matrix multiplication.

#theorem[Quaternion inverses][Every nonzero quaternion has inverse $overline(q) slash (a^2+b^2+c^2+d^2)$. Thus $bb(H)$ is a division ring but not a field.]
#proof[Expanding with the multiplication rules gives $q overline(q)=overline(q)q=a^2+b^2+c^2+d^2$. The denominator is a positive real number for nonzero $q$, hence central and invertible. Noncommutativity follows from $i j=k$ but $j i=-k$.]

#example[Cancellation can fail even for a nonzero scalar][In $ZZ slash 12ZZ$, the equation $[4]x=[4]$ has four solutions: $[1],[4],[7],[10]$. Indeed it says $12$ divides $4(x-1)$, or equivalently three divides $x-1$. Cancelling $[4]$ would incorrectly leave a unique solution. By contrast, multiplication by a unit is a bijection in any ring.]

In matrix rings, invertibility is a statement about a whole linear transformation, not about its individual entries. A matrix may have several nonzero entries and still be singular. The quaternion inverse formula succeeds because its norm is a positive real scalar, which is invertible and commutes with every quaternion.

#checkpoint("5.1", [Why does the finite-domain proof fail for $ZZ$?], [Multiplication by two is injective on $ZZ$ but not surjective. Finiteness is the step that would turn injectivity into surjectivity.])
#takeaways[Keep the hypotheses “commutative,” “finite,” and “nonzero” visible. Each has a specific job in the statements above.]
#study-links("U5")

== Lecture 10 · Ideals and quotient rings
#focus[Construct ideals and ring quotients, prove the ring isomorphism theorem, and recognize prime and maximal ideals.]

*Recall and approach.* Recall ideals absorb multiplication by arbitrary ring elements, not only by their own members.


An additive subgroup alone need not permit multiplication of residue classes. The extra requirement is absorption of multiplication from the ambient ring.

#definition[Ideal][A two-sided ideal $I$ of $R$ is an additive subgroup such that $r a,a r in I$ for $r in R,a in I$. In a commutative ring, the principal ideal $(a)$ consists of all $r a$.]

For $a'=a+i,b'=b+j$, the difference $a'b'-a b=a j+i b+i j$ lies in $I$. Therefore multiplication of additive cosets is well defined, and $R slash I$ is a ring with $(a+I)(b+I)=a b+I$. Its identity is $1+I$. The projection is a unital ring homomorphism with kernel $I$.

#strategy[Translate quotient properties into ideal conditions and use a map whose kernel expresses the intended relation.]

#theorem[First ring isomorphism theorem][For a unital ring homomorphism $f:R -> S$, the kernel is a two-sided ideal and $R slash ker f iso "im" f$ through $r+ker f |-> f(r)$.]
#proof[The additive-group kernel is a subgroup. If $f(a)=0$, then $f(r a)=f(r)f(a)=0$ and similarly $f(a r)=0$. The group isomorphism theorem supplies an additive isomorphism; the formula additionally preserves multiplication and identity.]

#definition[Prime and maximal ideals][In a commutative ring, a proper ideal $P$ is prime if $a b in P$ implies $a in P$ or $b in P$. A proper ideal $M$ is maximal if the only ideals containing it are $M$ and $R$.]

#theorem[Quotient criteria][For a commutative ring, $P$ is prime exactly when $R slash P$ is a domain; $M$ is maximal exactly when $R slash M$ is a field. In particular maximal ideals are prime.]
#proof[The prime criterion is the translation of $[a][b]=[0]$ into $a b in P$, with properness ensuring a nonzero quotient. If $M$ is maximal and $a notin M$, then $M+(a)=R$, so $1=m+r a$ and $[r][a]=[1]$. Conversely if the quotient is a field and $J$ properly contains $M$, choose $a in J$ outside $M$. An inverse to $[a]$ gives $1-r a in M subset.eq J$, so $1 in J$ and $J=R$.]

#example[Evaluation as a quotient][Evaluation $K[x] -> K$, $f |-> f(c)$, is surjective. Division by $x-c$ shows its kernel is $(x-c)$, so $K[x] slash (x-c) iso K$. Consequently $(x-c)$ is maximal. The quotient isomorphism gives more information than merely saying that $c$ is a root.]

#warning[For noncommutative rings, left ideals and two-sided ideals differ. Quotient *rings* here require two-sided ideals. The ring $M_2(K)$ has zero divisors even though its only two-sided ideals are zero and itself.]
#example[Two similar quotients with different behavior][The quotient $RR[x] slash (x^2+1)$ is a field, while $RR[x] slash (x^2-1)$ is not: the nonzero classes of $x-1$ and $x+1$ multiply to zero. They are nonzero because neither degree-one polynomial is a multiple of the degree-two modulus. Thus the second ideal is not prime.]

The failure is visible before computing every class. Factoring the modulus produces candidate zero divisors; irreducibility suggests a field, a claim justified over a field coefficient ring in the next unit. This is an example of reading the same relation both as an equation on a root and as an ideal controlling a quotient.

#checkpoint("5.2", [Is $(0)$ maximal in $ZZ$? Is it prime?], [It is prime because $ZZ$ is a domain. It is not maximal because $ZZ$ is not a field, or because $(0)$ is properly contained in $(2)$.])
#takeaways[To understand a quotient, first find a useful homomorphism. To understand an ideal, inspect the corresponding quotient.]
#study-links("U5")
