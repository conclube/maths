#import "/shared/book.typ": *
#let p = problem.with(code: "MM5020", unit: "U6")
#let items = (
 p(1,"E","U6.1 Division",[Divide $x^3+2x+1$ by $x^2+1$ over $QQ$.],[Cancel the leading term first.],[Subtract $x(x^2+1)$.],[The quotient is $x$ and remainder $x+1$, since $x^3+2x+1=x(x^2+1)+(x+1)$ and the remainder has degree less than two.],[Give and verify the division identity and degree bound.]),
 p(2,"E","U6.1 Bézout",[Find integers $u,v$ with $30u+21v=3$.],[Run the Euclidean algorithm.],[Use $3=21-2(30-21)$.],[The identity is $3=-2 dot 30+3 dot 21$, so $u=-2,v=3$. The Euclidean divisions $30=21+9$ and $21=2 dot 9+3$ explain the back substitution.],[Provide the identity, not just the gcd.]),
 p(3,"E","U6.2 Irreducibility",[Prove $x^3-5$ is irreducible over $QQ$.],[Use a prime dividing the constant term.],[Eisenstein applies at five.],[The polynomial is primitive and its leading coefficient is not divisible by five. Every lower coefficient is divisible by five, while the constant term is not divisible by twenty-five. Eisenstein therefore proves irreducibility over $QQ$.],[Check every hypothesis, including the square condition.]),
 p(4,"E","U6.1 Roots",[Factor $x^2+1$ over $FF_5$.],[Find a square equal to negative one.],[Two squared equals four modulo five.],[The roots are two and three, so $x^2+1=(x-2)(x-3)$ over $FF_5$. Expanding gives $x^2-5x+6=x^2+1$ modulo five.],[State the coefficient field in the factorization.]),
 p(5,"C","U6.1 Modular inverses",[Find the inverse of $x+1$ in $QQ[x] slash (x^2+1)$.],[Multiply by $x-1$.],[The product is $x^2-1$, which becomes negative two.],[Modulo $x^2+1$, $(x+1)(x-1)=-2$. Therefore the inverse is $(1-x)/2$. Direct multiplication gives $(1-x^2)/2=1$ in the quotient.],[Reduce using the quotient relation and check the final product.]),
 p(6,"C","U6.2 Reduction test",[Prove $x^3+x+1$ is irreducible over $QQ$ by reducing modulo two.],[A cubic over a field is reducible exactly when it has a root.],[Evaluate at the only two elements of $FF_2$.],[The reduction has value one at both zero and one, so has no root in $FF_2$ and is irreducible there. The integer polynomial is primitive and monic, so its degree is preserved on reduction. Gauss's lemma and the reduction criterion prove irreducibility over $QQ$.],[Explain why the root test suffices for degree three and why reduction applies.]),
 p(7,"C","U6.2 Failure outside PIDs",[Show $2$ is irreducible but not prime in $ZZ[sqrt(-5)]$.],[Use the norm $N(a+b sqrt(-5))=a^2+5b^2$.],[There is no element of norm two, but $(1+sqrt(-5))(1-sqrt(-5))=6$.],[Define $N(a+b sqrt(-5))=a^2+5b^2$. Multiplying an element by its conjugate gives this norm; conjugation preserves products in this commutative ring, so the norm is multiplicative. Its value is one exactly on the units $1,-1$. If $2=u v$, multiplicativity of the norm gives $4=N(u)N(v)$. The only possible nonunit factorization would require both norms to be two, impossible from $a^2+5b^2=2$. Thus two is irreducible. It divides six, but neither $1+sqrt(-5)$ nor $1-sqrt(-5)$ is divisible by two, because their coefficients are not both even. Hence two is not prime.],[Explain why norm one means a unit and why divisibility by two forces even coefficients.]),
 p(8,"C","U6.1 Principal ideals",[Show $K[x] slash (f)$ is a field if and only if $f$ is irreducible, assuming $f$ is nonconstant.],[Use maximal ideals or Bézout.],[For irreducible $f$, every polynomial not divisible by $f$ is coprime to it.],[If $f$ is irreducible, a nonzero class $[g]$ has $gcd(f,g)=1$, so a Bézout identity gives its inverse. Conversely, if $f=a b$ with both factors of positive smaller degree, then $[a],[b]$ are nonzero classes whose product is zero, impossible in a field.],[Prove the factors give nonzero classes by their degrees.]),
 p(9,"C","U6.2 Primitive products",[Show the product of two primitive integer polynomials is primitive.],[Suppose a prime divides every coefficient of the product.],[Reduce modulo that prime and use that $FF_p[x]$ is a domain.],[For any prime $p$, primitiveness means neither factor becomes the zero polynomial modulo $p$. Their product is therefore nonzero in the domain $FF_p[x]$. Thus no prime divides every coefficient of the integer product, which is exactly primitiveness.],[The argument must apply to every prime.]),
 p(10,"A","U6.2 Shifted Eisenstein",[For prime $p$, prove $1+x+dots+x^(p-1)$ is irreducible over $QQ$.],[Substitute $x=y+1$.],[The transformed polynomial is $((y+1)^p-1)/y$.],[Substitute $x=y+1$. The polynomial becomes $((y+1)^p-1)/y$, a polynomial with coefficients $binom(p,k)$ for the powers $y^(k-1)$, $1<=k<=p$. Its leading coefficient is one, all others are divisible by $p$, and its constant term is $p$, not divisible by $p^2$. Eisenstein proves it irreducible. Substitution $x |-> y+1$ is an invertible ring change of variable, with inverse $y |-> x-1$, so it preserves reducibility and the original polynomial is irreducible.],[Justify both binomial divisibility and invariance under the change of variable.]),
 p(11,"A","U6.1 Polynomial Chinese remainder",[If $f,g in K[x]$ are coprime, prove $K[x] slash (f g) iso K[x] slash (f) times K[x] slash (g)$.],[Use simultaneous reduction and polynomial Bézout.],[Construct a preimage of $([a],[b])$ using $u f+v g=1$.],[The map $h |-> ([h]_f,[h]_g)$ is a unital homomorphism. A polynomial divisible by both coprime $f,g$ is divisible by $f g$: from $h=f k$ and $g|h$, primeness of irreducible factors of $g$ gives $g|k$, or multiply a Bézout identity by $k$. Its kernel is therefore $(f g)$. Choose $u,v$ with $u f+v g=1$. Given $a,b$, the polynomial $a v g+b u f$ has the prescribed remainders. Surjectivity and the first isomorphism theorem finish.],[Compute the kernel and explicitly verify both residues.]),
 p(12,
  "A",
  "U6.2 Nonprincipal ideals",
  [Prove $ZZ[x]$ is a UFD but not a PID.],
  [Apply Gauss's theorem, then study $(2,x)$.],
  [A generator of $(2,x)$ would divide both two and $x$.],
  [*Finding the approach.* To separate UFD from PID, use different evidence for the two properties: a factorization theorem for the first and one carefully chosen ideal for the second.

*Argument.* Since $ZZ$ is a UFD, Gauss's theorem makes $ZZ[x]$ a UFD. If $(2,x)=(d)$, then $d|2$, so $d$ is a constant integer. Also $d|x$, forcing $d=1$ or $-1$. That would make the ideal the whole ring. But evaluation at zero followed by reduction modulo two is a homomorphism killing both generators and not one, so the ideal is proper. Contradiction.

If a nonzero polynomial $d$ divides the constant $2$, degree additivity in the domain $ZZ[x]$ forces degree zero. A constant integer dividing the polynomial $x$ divides its coefficient $1$, so it is a unit. The evaluation map $f |-> f(0) mod 2$ sends every element $2a(x)+x b(x)$ to zero but sends $1$ to one; thus the ideal cannot equal the whole ring.

*A tempting dead end.* Proving that $2$ and $x$ have no common nonunit divisor does not prove that their ideal is the unit ideal. That implication holds in a Bézout domain, which is precisely more than has been established here.

*Hypotheses.* Gauss's theorem requires the coefficient ring to be a UFD. Degree additivity uses the absence of zero divisors. The ideal argument distinguishes divisibility from linear combination.],
  [Separate the UFD proof from the argument excluding a principal generator.],
  idea: [A common divisor controls a possible principal generator; a quotient map then proves that no such generator can work.]),
 p(13,
  "A",
  "U6 Transfer: Two quartics without rational roots",
  [Determine which of $x^4+1$ and $x^4+4$ are irreducible over $QQ$. Give complete factorizations into irreducibles in $ZZ[x]$ and explain why testing rational roots does not settle either question.],
  [For the first polynomial, a translation of the variable may reveal a useful coefficient pattern.],
  [For the second, add and subtract a square; for the first examine $(x+1)^4+1$.],
  [*Finding the approach.* Degree four permits a factorization into quadratics without any rational root. Look for a transformation that proves impossibility in one case and an identity that exhibits it in the other.

*Argument.* The translated first polynomial is $x^4+4x^3+6x^2+4x+2$, which is Eisenstein at two: all nonleading coefficients are divisible by two and the constant is not divisible by four. It is irreducible over $QQ$. Substitution $x |-> x+1$ is an automorphism of $QQ[x]$, with inverse $x |-> x-1$, so $x^4+1$ is irreducible too. Meanwhile $x^4+4=(x^2+2)^2-(2x)^2=(x^2-2x+2)(x^2+2x+2)$. Both quadratics have discriminant $-4$, hence no rational root and are irreducible over $QQ$. All these polynomials are primitive; Gauss's lemma transfers the assertions to $ZZ[x]$, up to units.

*A tempting dead end.* The rational-root test only excludes linear factors. It misses the displayed pair of quadratic factors of the second polynomial.

*Hypotheses.* Translation must be invertible to preserve reducibility in both directions. Gauss's lemma applies to primitive integer polynomials; the coefficient content must not be ignored.],
  [Explain the inverse translation, every Eisenstein condition, and irreducibility of both quadratic factors.],
  optional: true,
  minutes: 60,
  idea: [Change coordinates to expose a prime-divisibility obstruction, and distinguish it from a constructive factorization.]),
)
