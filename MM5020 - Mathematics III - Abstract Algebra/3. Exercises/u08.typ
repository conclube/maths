#import "/shared/book.typ": *
#let p = problem.with(code: "MM5020", unit: "U8")
#let items = (
 p(1,"E","U8.1 Field orders",[Which of the orders $8,9,10,16,18,25$ can occur for a finite field?],[Finite-field orders are prime powers.],[Apply the existence theorem as well as the necessary condition.],[The possible orders are $8=2^3$, $9=3^2$, $16=2^4$, and $25=5^2$. Fields of each exist. Ten and eighteen involve distinct primes and are not prime powers, so neither occurs.],[State both necessity and existence.]),
 p(2,"E","U8.1 Arithmetic in four elements",[In $FF_4=FF_2[alpha]$ with $alpha^2+alpha+1=0$, compute $alpha(alpha+1)$ and the inverse of $alpha+1$.],[Use $alpha^2=alpha+1$.],[Addition has characteristic two.],[$alpha(alpha+1)=alpha^2+alpha=(alpha+1)+alpha=1$. Thus the inverse of $alpha+1$ is $alpha$.],[Use characteristic two correctly.]),
 p(3,"E","U8.2 Generators",[Find the order of two in $FF_7^times$.],[Compute successive powers.],[The third power is one.],[The powers are $2,4,1$, so the order is three. Two is therefore not a generator of the six-element multiplicative group.],[Check that no earlier positive power is one.]),
 p(4,"E","U8.1 Characteristic and dimension",[What are the characteristic and dimension over the prime field of a field of order eighty-one?],[Write the order as a prime power.],[Eighty-one equals three to the fourth power.],[The characteristic is three and the dimension over $FF_3$ is four, because a $d$-dimensional vector space over $FF_3$ has $3^d$ elements.],[Distinguish characteristic from total cardinality.]),
 p(5,"C","U8.2 Frobenius",[Prove the map $a |-> a^p$ is an automorphism of a finite field of characteristic $p$.],[Check addition, multiplication, and injectivity.],[Use the binomial theorem and the fact a field has no nonzero nilpotents.],[In characteristic $p$, binomial coefficients make $(a+b)^p=a^p+b^p$; multiplication and one are also preserved. If $a^p=b^p$, then $(a-b)^p=0$, so $a=b$. The field is finite, so injectivity implies surjectivity. Thus the map is an automorphism.],[State where finiteness is used; Frobenius need not be surjective in an infinite field.]),
 p(6,"C","U8.2 Interpolation",[Find the degree-less-than-three polynomial over $FF_5$ with $f(0)=1$, $f(1)=0$, $f(2)=2$.],[Write $f=a x^2+b x+c$.],[The first value gives $c=1$; solve the remaining two equations modulo five.],[Write $f(x)=a x^2+b x+1$ using the value at zero. The other two conditions give $a+b=4$ and $4a+2b=1$ modulo five. Subtract twice the first equation to get $2a=3$, hence $a=4$ and $b=0$. Thus $f(x)=4x^2+1$. Substitution checks all three values; uniqueness follows from the root bound.],[Use modular inverses and explain uniqueness.]),
 p(7,"C","U8.1 Polynomial roots",[Show every element of $FF_q$ is a root of $x^q-x$, and this polynomial has no repeated root.],[Apply Lagrange to the nonzero elements.],[Its formal derivative is negative one.],[Zero is a root. Every nonzero $a$ belongs to a group of order $q-1$, so $a^(q-1)=1$ and $a^q=a$. Since $q$ is zero in the field, the derivative is $q x^(q-1)-1=-1$, which shares no root with the polynomial, so no root repeats.],[Handle zero separately and use characteristic correctly in the derivative.]),
 p(8,"C","U8.2 Evaluation codes",[Evaluate all degree-less-than-two polynomials at the five elements of $FF_5$. How many codewords result, and what is their minimum distance?],[There are two free field coefficients.],[A nonzero difference is a nonzero polynomial of degree at most one.],[There are $5^2=25$ polynomials, and evaluation is injective because a nonzero degree-at-most-one polynomial cannot vanish at five points. Two distinct codewords differ in at least four coordinates. This bound is attained by the polynomials zero and $x$, whose evaluations agree only at zero. Thus the minimum distance is four.],[Show the bound is attained, not only that it is a lower bound.]),
 p(9,"C","U8.2 Primitive elements",[Find all generators of $FF_7^times$, given that three is one generator.],[In a cyclic group of order six, generator powers have exponents coprime to six.],[Use exponents one and five.],[The generators are $3^1=3$ and $3^5=5$ modulo seven. The order formula shows no other powers generate because their exponents share a nontrivial gcd with six.],[Explain exhaustiveness using the cyclic-group order formula.]),
 p(10,"A","U8.1 Subfields",[Show a field of sixteen elements has a unique subfield of four elements.],[Use the roots of $x^4-x$ inside the larger field.],[Its nonzero roots satisfy $x^3=1$ in a cyclic group of order fifteen.],[The cyclic multiplicative group of order fifteen has exactly three solutions to $x^3=1$: for a generator $g$, the exponents satisfy $15|3k$, giving $k=0,5,10$. Including zero gives four roots of $x^4-x$. The fourth-power Frobenius identity shows these roots are closed under addition and multiplication, and nonzero inverses also remain roots, so they form a subfield. Any four-element subfield consists entirely of such roots and hence equals this one.],[Prove existence by closure and uniqueness by the root characterization.]),
 p(11,"A","U8.2 Polynomial functions",[Prove every function $FF_q -> FF_q$ is represented by a unique polynomial of degree less than $q$. Is the representing polynomial unique without the degree bound?],[Interpolate at every element of the field.],[The polynomial $x^q-x$ represents the zero function.],[Interpolation gives a polynomial of degree less than $q$ with any prescribed function values, and the root bound gives uniqueness in that degree range. Without the bound, adding any multiple of $x^q-x$ changes the formal polynomial without changing any value on the field. Thus uniqueness fails among all polynomials.],[Distinguish formal polynomials from the functions they induce.]),
 p(12,
  "A",
  "U8.1 Irreducible quadratics",
  [Count the monic irreducible quadratics over $FF_q$.],
  [Count all monic quadratics and subtract the reducible ones.],
  [Reducible monic quadratics correspond to unordered pairs of roots, allowing repetition.],
  [*Finding the approach.* Count the complement, where reducibility has a concrete description by roots. Separate repeated roots from distinct roots to avoid ordering errors.

*Argument.* There are $q^2$ monic quadratics. A reducible one has the form $(x-a)(x-b)$ with $a,b in FF_q$, and unique factorization identifies it with an unordered pair with repetition. There are $q(q+1)/2$ such pairs. Thus the number of monic irreducible quadratics is $q^2-q(q+1)/2=q(q-1)/2$.

There are $q$ repeated-root polynomials $(x-a)^2$. There are $q(q-1)/2$ pairs of distinct roots. Unique factorization ensures that no two different unordered multisets produce the same monic polynomial. Thus the reducible count is $q+q(q-1)/2$, giving the claimed remainder. For $q=2$, the one irreducible example is $x^2+x+1$, which checks the formula.

*A tempting dead end.* Counting ordered pairs gives each distinct-root polynomial twice but each repeated-root polynomial once. Dividing all $q^2$ ordered pairs by two therefore gives the wrong answer.

*Hypotheses.* Over a field, a quadratic is reducible exactly when it is a product of two linear factors. The count remains valid in characteristic two; no division by two inside the field is being performed.],
  [Include repeated roots and justify why no reducible quadratic is missed or counted twice.],
  idea: [Use unique factorization to replace reducible monic quadratics by unordered root multisets.]),
 p(13,
  "A",
  "U8 Transfer: An equation over a larger finite field",
  [For each $b in FF_q$, determine the number of $x in FF_(q^2)$ satisfying $x^q+x=b$. Include the case of characteristic two.],
  [Show that the left side always lies in the subfield $FF_q$.],
  [Use linearity over $FF_q$ and the root bound to show the map is not zero.],
  [*Finding the approach.* The equation is a fiber of a map between finite vector spaces. This avoids trying to solve a degree-$q$ polynomial separately for each value of $b$.

*Argument.* Define $T(x)=x^q+x$. Since $x^(q^2)=x$, we have $T(x)^q=x^(q^2)+x^q=T(x)$, so $T(x)$ lies in $FF_q$. Frobenius additivity and $c^q=c$ for $c in FF_q$ show that $T$ is $FF_q$-linear. It is not the zero map: the nonzero polynomial $X^q+X$ of degree $q$ cannot vanish at all $q^2$ elements. A nonzero linear map to a one-dimensional space is surjective. Its domain has dimension two, so its kernel has dimension one and cardinality $q$. Every fiber is a translate of the kernel; consequently there are exactly $q$ solutions for every $b$.

*A tempting dead end.* In odd characteristic $T(1)=2$ proves nonzeroness, but that argument fails in characteristic two. A failed test vector does not mean the linear map is zero.

*Hypotheses.* Use the field $FF_(q^2)$ with its subfield of $q$ elements and the polynomial root bound over a field. The argument avoids division by two.],
  [Prove the codomain, linearity, nonzeroness in every characteristic, and the fiber count.],
  optional: true,
  minutes: 60,
  idea: [Identify the equation as a nonzero linear functional, then count all fibers from its kernel.]),
)
