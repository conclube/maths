#import "/shared/book.typ": *
#let p = problem.with(code: "MM5020", unit: "U5")
#let items = (
 p(1,"E","U5.1 Units",[Find every unit in $ZZ slash 10 ZZ$ and its inverse.],[A residue is a unit exactly when it is coprime to ten.],[Test the residues one, three, seven, and nine.],[The units are $[1],[3],[7],[9]$. Their inverses are respectively $[1],[7],[3],[9]$, since $3 dot 7=21=1$ modulo ten and $9^2=81=1$. The remaining residues share a factor with ten and cannot have a product congruent to one.],[Show why the list is exhaustive.]),
 p(2,"E","U5.1 Zero divisors",[Give nonzero matrices $A,B in M_2(QQ)$ with $A B=0$.],[Use projections onto different coordinate axes.],[Take diagonal matrices with complementary single nonzero entries.],[Take $A=mat(1,0;0,0)$ and $B=mat(0,0;0,1)$. Both are nonzero and their product is the zero matrix.],[Verify the product explicitly.]),
 p(3,"E","U5.2 Ideals",[Show $6 ZZ$ is an ideal of $ZZ$, and describe the identity of its quotient.],[Check additive subgroup and absorption.],[Multiplying a multiple of six by any integer preserves that form.],[Differences of multiples of six are multiples of six, and $r(6k)=6(r k)$, so it is an ideal. The quotient identity is $[1]=1+6 ZZ$, since $[1][a]=[a]$.],[Do not confuse the zero coset with the multiplicative identity.]),
 p(4,"E","U5.1 Quaternions",[Find the inverse of $q=1+2i-j$.],[Use quaternion conjugation.],[Its squared norm is six.],[The conjugate is $1-2i+j$ and the norm is $1^2+2^2+(-1)^2=6$. Thus $q^(-1)=(1-2i+j)/6$. Multiplication in either order gives one by the norm identity.],[Use the squared norm rather than its square root as denominator.]),
 p(5,"C","U5.2 Quotient criteria",[Determine whether $(5)$ and $(6)$ are prime or maximal in $ZZ$.],[Inspect the quotient rings.],[A prime-order residue ring is a field; modulo six there are zero divisors.],[$ZZ slash 5 ZZ$ is a field, so $(5)$ is maximal and prime. Modulo six, $[2][3]=0$ with both factors nonzero, so $(6)$ is not prime and therefore not maximal.],[Justify both the positive and negative conclusions using quotient properties.]),
 p(6,"C","U5.2 Evaluation",[Show $RR[x] slash (x^2+1) iso CC$.],[Evaluate a polynomial at $i$.],[Divide by $x^2+1$ to identify the kernel.],[Evaluation at $i$ is a unital ring homomorphism and is surjective because $a+b i$ is the image of $a+b x$. Dividing a polynomial by $x^2+1$ leaves $a+b x$; its value at $i$ vanishes only if $a=b=0$. Thus the kernel is exactly $(x^2+1)$, and the first isomorphism theorem applies.],[Prove the kernel equality, not just one containment.]),
 p(7,"C","U5.1 Characteristic",[Prove a nonzero domain has characteristic zero or a prime.],[A composite characteristic factors.],[Translate the integer factorization into a zero product in the ring.],[If the characteristic is a positive composite $n=a b$ with $1<a,b<n$, then $(a dot 1)(b dot 1)=n dot 1=0$. Minimality of $n$ makes both factors nonzero, contradicting the domain property. Thus any positive characteristic is prime.],[Use minimality to establish that both factors are nonzero.]),
 p(8,"C","U5.2 Ideals and units",[Prove an ideal contains a unit if and only if it is the whole ring. Deduce that a field has exactly two ideals.],[Multiply the unit by its inverse.],[An ideal containing one contains every element.],[If $u in I$ is a unit, absorption gives $u^(-1)u=1 in I$, then $r=r dot 1 in I$ for every $r$. Conversely the whole ring contains one, a unit. In a field, every nonzero ideal contains a nonzero element, hence a unit, so the only ideals are zero and the whole field.],[Explain both implications and specify nonzero ideals in the deduction.]),
 p(9,"C","U5.2 Noncommutative ideals",[Show the matrices with zero second column form a left ideal of $M_2(K)$ but not a two-sided ideal.],[Left multiplication preserves a zero column.],[Multiply $E_(11)$ on the right by $E_(12)$.],[The set is an additive subgroup and left multiplication preserves the zero second column. But $E_(11)$ lies in it, while $E_(11)E_(12)=E_(12)$ does not. Hence it is not closed under right multiplication and is not two-sided.],[Check the specified side of multiplication carefully.]),
 p(10,"A","U5.2 Chinese remainder theorem",[Prove $ZZ slash m n ZZ iso ZZ slash m ZZ times ZZ slash n ZZ$ for coprime positive $m,n$.],[Use simultaneous reduction and a Bézout identity.],[The kernel is $m n ZZ$; use Bézout to construct any prescribed pair of residues.],[Let $f(a)=([a]_m,[a]_n)$. Its kernel consists of integers divisible by both $m,n$, hence by $m n$ because they are coprime. Choose $u m+v n=1$. For a target $([r]_m,[s]_n)$, the integer $r v n+s u m$ maps to it. Thus $f$ is surjective with the stated kernel, and the ring isomorphism theorem proves the claim.],[Verify both congruences in the surjectivity construction.]),
 p(11,"A","U5.2 Matrix ring ideals",[Prove every two-sided ideal of $M_n(K)$, for a field $K$, is zero or the whole ring.],[Start with a nonzero entry of a matrix in the ideal.],[Multiplication by matrix units isolates that entry in any desired position.],[If $A in I$ has nonzero entry $a_(i j)$, then $E_(r i) A E_(j s)=a_(i j)E_(r s) in I$ for every $r,s$. Multiplying by the scalar inverse gives every matrix unit in $I$. Their linear combinations yield every matrix, so $I=M_n(K)$. Thus any nonzero ideal is the whole ring.],[Use two-sided absorption and the invertibility of the nonzero coefficient.]),
 p(12,
  "A",
  "U5.1 Division rings",
  [Prove quaternion conjugation reverses products and deduce multiplicativity of $N(q)=q overline(q)$.],
  [It is enough to verify the reversal on the basis elements and extend bilinearly.],
  [Use $overline(q r)=overline(r)overline(q)$ and centrality of real norms.],
  [*Finding the approach.* Quaternion multiplication is not commutative. Check what conjugation does to a small basis, then use bilinearity rather than expanding two arbitrary four-term expressions without a plan.

*Argument.* For the basis $1,i,j,k$, the rule follows from the multiplication table: conjugation negates each imaginary basis element, and reversing two distinct imaginary factors negates their product. Equal factors give the same real value in either order. Real bilinearity extends the identity to all $q,r$. Hence $N(q r)=q r overline(r)overline(q)=q N(r)overline(q)=N(r)N(q)$, since $N(r)$ is real and central.

For distinct imaginary basis elements $u,v$, write $u v=w$ or $-w$ with $w$ imaginary. Then $v u=-u v$ and $overline(u v)=-u v=overline(v)overline(u)$. For $u=v$, both sides are $-1$; factors equal to $1$ are immediate. Distributing over real coefficients proves the identity for arbitrary quaternions. Finally $q overline(q)$ is the real sum of four coordinate squares, which justifies moving $N(r)$ through $q$.

*A tempting dead end.* Writing $overline(q r)=overline(q)overline(r)$ keeps the wrong order. Taking $q=i,r=j$ gives $-k$ on the left and $k$ on that incorrect right side.

*Hypotheses.* Real coefficients commute with the basis elements, and the norm is a central real scalar. Neither fact licenses commuting arbitrary quaternions.],
  [Check equal as well as distinct imaginary factors, and justify the central scalar step.],
  idea: [Conjugation reverses multiplication; the norm becomes multiplicative because the middle conjugate pair is central.]),
 p(13,
  "A",
  "U5 Transfer: Coordinates hidden in residues",
  [Find all $e$ in $ZZ slash 12ZZ$ satisfying $e^2=e$. Construct an explicit ring isomorphism from $ZZ slash 12ZZ$ to $(ZZ slash 3ZZ) times(ZZ slash 4ZZ)$ and use it to explain your list.],
  [Compute the two residues of a class modulo twelve.],
  [The classes of four and nine isolate the two coordinates.],
  [*Finding the approach.* The requested product suggests recording two residues. Constructing its inverse will also reveal how to combine idempotents in the two smaller rings.

*Argument.* Send $x$ to $(x mod 3,x mod 4)$. This is a well-defined ring homomorphism. Given $(a,b)$, the class $4a+9b$ is independent of representatives, since changes by three and four alter it by multiples of twelve. Its residues are $(a,b)$. Conversely $4x+9x=13x=x mod 12$, so these maps are inverse. In $ZZ slash 3ZZ$, the idempotents are zero and one since it is a field. Directly testing zero, one, two, three modulo four gives only zero and one there too. The four coordinate choices therefore give $0,4,9,1$ modulo twelve.

*A tempting dead end.* Solving $e(e-1)=0$ by declaring a factor zero is invalid in a ring with zero divisors.

*Hypotheses.* The two moduli are coprime, as reflected by the explicit coefficients four and nine. The proof gives an inverse, not just a surjection between unspecified rings.],
  [Verify both composites and explain why the zero-product inference fails modulo twelve.],
  optional: true,
  minutes: 60,
  idea: [Separate residue coordinates to turn one equation with zero divisors into two tiny equations.]),
)
