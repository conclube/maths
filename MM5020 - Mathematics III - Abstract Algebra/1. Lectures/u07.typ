#import "/shared/book.typ": *
= Unit 7 · Fields as vector spaces

*Bridge into this unit.* Adjoining an element means closing under all field operations, which initially looks infinite. A polynomial relation reduces powers to finitely many possibilities; irreducibility ensures that nonzero residues also have inverses. The tower law then organizes repeated adjunctions.

== Lecture 13 · Fractions, field extensions, and degree
#focus[Construct the fraction field of a domain, use its universal property, and prove the tower law. Recall equivalence relations and vector-space bases.]

*Recall and approach.* Recall a domain has valid cancellation by nonzero factors and extension degree is vector-space dimension.


Rational numbers arise by allowing division in the integers. The same construction works in every commutative domain, with the absence of zero divisors providing exactly the cancellations required.

#definition[Fraction field][For a domain $R$, pairs $(a,b)$ with $b!=0$ represent fractions $a/b$. Declare $(a,b)~(c,d)$ if $a d=b c$. Define $a/b+c/d=(a d+b c) slash (b d)$ and $(a/b)(c/d)=a c/(b d)$. The resulting field is $"Frac"(R)$.]

Reflexivity and symmetry are immediate. For transitivity, $a d=b c$ and $c f=d e$ imply $d(a f-b e)=0$, so $a f=b e$ since $d!=0$. Similar cross multiplication verifies that the operations do not depend on representatives. The denominator product is nonzero. Additive inverses are $-a/b$, and a nonzero fraction has inverse $b/a$. The injection $R -> "Frac"(R)$ sends $a$ to $a/1$.

#strategy[Verify representative independence for fractions; prove spanning and independence separately for a product basis.]

#theorem[Universal property of fractions][If $f:R -> K$ is an injective unital homomorphism into a field, there is a unique extension $overline(f):"Frac"(R) -> K$ with $overline(f)(a/b)=f(a)/f(b)$.]
#proof[Injectivity makes each $f(b)$ nonzero. Equality $a d=b c$ gives equality of the proposed values after applying $f$, proving well-definedness. The addition and multiplication formulas prove preservation of the operations. Any extension must send $b^(-1)$ to $f(b)^(-1)$, so its values are forced.]

#definition[Extension degree][A field extension $L slash K$ means $K$ is identified with a subfield of $L$. Multiplication makes $L$ a vector space over $K$. Its dimension is the degree $[L:K]$, possibly infinite.]

#theorem[Tower law][If $K subset.eq L subset.eq M$ and both $[L:K]=r$ and $[M:L]=s$ are finite, then $[M:K]=r s$.]
#strategy[Multiply basis elements and prove both spanning and independence. Dimension counting alone is not a proof that the products form a basis.]
#proof[Let $u_1,dots,u_r$ be a $K$-basis of $L$ and $v_1,dots,v_s$ an $L$-basis of $M$. Expand an element of $M$ in the $v_j$, then expand its coefficients in the $u_i$, proving the $u_i v_j$ span. If $sum_j(sum_i a_(i j)u_i)v_j=0$ with $a_(i j) in K$, independence of the $v_j$ gives $sum_i a_(i j)u_i=0$ for each $j$. Independence of the $u_i$ forces every coefficient to vanish.]

#example[A degree-four field][$QQ(sqrt(2),sqrt(3))$ has basis $1,sqrt(2),sqrt(3),sqrt(6)$ over $QQ$. Indeed $sqrt(3)$ is not in $QQ(sqrt(2))$: squaring a proposed equality $sqrt(3)=a+b sqrt(2)$ forces $a b=0$, and either $a^2=3$ or $2b^2=3$ has no rational solution. The tower law gives degree four.]

#example[Degree as a divisibility obstruction][Suppose $L slash QQ$ has degree six and contains $QQ(sqrt(2))$. The tower law forces $[L:QQ(sqrt(2))]=3$. It cannot also contain a subfield of degree four over $QQ$, because four would then divide six. The obstruction concerns an intermediate field inside this particular $L$; it does not assert that no degree-four field exists elsewhere.]

To build a tower basis, first expand in a basis over the intermediate field, then expand those coefficients over the base. For independence, reverse that reasoning: group coefficients by the upper basis, use its independence, and then use independence in the intermediate field. This is more informative than simply multiplying two dimensions.

#checkpoint("7.1", [Can a degree-five extension contain a subfield of degree two over the base?], [No. The tower law would make two divide five.])
#takeaways[Fields carry both multiplicative structure and linear structure. Degree translates algebraic questions into finite-dimensional reasoning.]
#study-links("U7")

== Lecture 14 · Minimal polynomials and adjoining roots
#focus[Identify the minimal polynomial, construct a field containing a prescribed algebraic root, and compute in a power basis.]

*Recall and approach.* Recall a minimal polynomial depends on the chosen base field, and a vanishing polynomial may be a multiple of it.


#definition[Algebraic element][An element $alpha$ in an extension of $K$ is algebraic over $K$ if some nonzero $f in K[x]$ satisfies $f(alpha)=0$. Otherwise it is transcendental. For an algebraic element, its minimal polynomial $m_(alpha,K)$ is the monic polynomial of smallest positive degree vanishing at $alpha$.]

#strategy[Use polynomial division to identify the evaluation kernel, then use irreducibility to make the quotient a field.]

#theorem[The minimal-polynomial theorem][The evaluation kernel $\{f:f(alpha)=0\}$ is generated by $m=m_(alpha,K)$. The polynomial $m$ is irreducible, and $K[alpha]=K(alpha) iso K[x] slash (m)$. If $deg m=d$, then $1,alpha,dots,alpha^(d-1)$ is a basis and $[K(alpha):K]=d$.]
#proof[Divide any vanishing $f$ by $m$; the remainder also vanishes and has smaller degree, so minimality forces it to be zero. If $m=g h$ with both factors of positive smaller degree, then $g(alpha)h(alpha)=0$ in a field, forcing one factor to vanish, a contradiction. In the PID $K[x]$, an irreducible generates a maximal ideal: a larger principal ideal would correspond to a proper factor. Thus the quotient is a field. The ring isomorphism theorem identifies it with $K[alpha]$, which therefore already equals the smallest field $K(alpha)$. Division gives spanning by the stated powers, and minimality proves their independence.]

#example[Arithmetic in a cubic extension][Let $alpha^3=2$ over $QQ$. Eisenstein proves $x^3-2$ irreducible, giving basis $1,alpha,alpha^2$. Multiplication is polynomial multiplication followed by reduction $alpha^3=2$. Since $(alpha-1)(alpha^2+alpha+1)=alpha^3-1=1$, the inverse of $alpha-1$ is $alpha^2+alpha+1$.]

#theorem[Adjoining a root and splitting a polynomial][Every nonconstant polynomial over a field has a root in some extension and splits into linear factors in a finite extension.]
#proof[Choose an irreducible factor $p$ and form the field $K[x] slash (p)$. The residue class of $x$ is a root. Over that field, factor off the corresponding linear factor and repeat on the remaining polynomial. Each adjoining step has finite degree, and finitely many steps suffice. The tower law gives a finite final extension.]

If $L slash K$ is finite, every element of $L$ is algebraic: $1,alpha,dots,alpha^n$ are dependent when $n=[L:K]$. Conversely an extension generated by finitely many algebraic elements is finite, by repeated use of the minimal-polynomial theorem and the tower law. Finitely generated is essential: an algebraic extension need not be finite.

#warning[A polynomial that vanishes at $alpha$ need not be its minimal polynomial. Establish monicity and irreducibility, or prove the degree is minimal.]
#example[Computing an inverse by reducing a product][In $QQ[alpha]$ with $alpha^2=2$, multiplication gives $(3+alpha)(3-alpha)=7$, hence $(3+alpha)^(-1)=(3-alpha)/7$. This also follows from a Bézout identity between $x^2-2$ and $x+3$. In higher degree, Euclid replaces the convenient conjugate trick.]

To prove a proposed power basis is a basis, division gives spanning by powers below the minimal degree. Any linear dependence of those powers would give a smaller-degree vanishing polynomial, contradicting minimality. Both parts depend on identifying the minimal polynomial, not just finding some relation that happens to vanish.

#checkpoint("7.2", [Find the minimal polynomial of $sqrt(2)$ over $QQ$ and over $QQ(sqrt(2))$.], [Over $QQ$ it is $x^2-2$. Over $QQ(sqrt(2))$ it is $x-sqrt(2)$. The base field is part of the data.])

#pagebreak()
=== A slower route through the central ideas

#example[Arithmetic in a quadratic field][
Represent $QQ(sqrt(2))$ by residues modulo $x^2-2$. Every element has the form $a+b sqrt(2)$. Multiplication reduces the square to two. To invert $1+sqrt(2)$, multiply by $sqrt(2)-1$; the product is one. More generally, the inverse of nonzero $a+b sqrt(2)$ is $(a-b sqrt(2)) slash (a^2-2b^2)$. The denominator cannot vanish for rational $a,b$ unless both vanish, since $sqrt(2)$ is irrational.
]
*Expanded proof: why the quotient is a field.* If $m$ is irreducible in $K[x]$, every nonzero residue has a representative $g$ with degree less than $deg(m)$. Such a $g$ is coprime to $m$. Euclidean back-substitution supplies $u g+v m=1$, so the residue of $u$ is the inverse of the residue of $g$. This explains why reducing powers alone is insufficient: a reducible modulus still gives a finite-dimensional algebra but may introduce zero divisors.

*Expanded proof: tower bases.* If $(b_i)$ is a basis of $L$ over $K$ and $(c_j)$ a basis of $M$ over $L$, expand an element of $M$ first in the $c_j$, then expand its coefficients in the $b_i$. This proves the products $b_i c_j$ span. For independence, group a relation $sum_(i,j) a_(i j)b_i c_j=0$ by $j$. Independence of the $c_j$ over $L$ forces each coefficient $sum_i a_(i j)b_i$ to vanish; independence of the $b_i$ then kills every $a_(i j)$.

#example[Why two square roots give four basis terms][
The field $QQ(sqrt(2),sqrt(3))$ is spanned by $1,sqrt(2),sqrt(3),sqrt(6)$. To certify that this is a basis, show $sqrt(3)$ is not in $QQ(sqrt(2))$. If $sqrt(3)=a+b sqrt(2)$, comparison after squaring gives $a b=0$. The remaining cases require a rational square equal to three or to $3/2$, both impossible by prime factorization. Thus each tower step has degree two, and the tower-basis argument proves independence of the four terms.
]
*A failed shortcut.* Writing four spanning expressions gives an upper bound of four, not equality. A relation among them could reduce the degree. Nonmembership in the intermediate field is the missing lower-bound argument.

#takeaways[Quotient rings turn formal roots into actual field elements. The minimal polynomial controls both relations and dimension.]
#study-links("U7")
