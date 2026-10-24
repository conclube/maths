#import "/shared/book.typ": *
= Unit 6 · Localization

== Lecture 11 · Inverting selected scalars
#focus[Construct localization even in the presence of zero divisors and prove its universal property.]

*Recall and approach.* Recall a zero divisor can become zero when another element is made invertible.


Fraction fields invert every nonzero element of a domain. Localization inverts a chosen multiplicatively closed subset and works even when the original ring has zero divisors. We allow a localization to be the zero ring; this occurs, in particular, when the chosen subset contains zero.

#definition[Localization][Let $S subset.eq R$ contain one and be closed under multiplication. On pairs $(a,s)$, define $(a,s)~(b,t)$ if some $u in S$ satisfies $u(t a-s b)=0$. The class is denoted $a/s$. Addition and multiplication use the usual fraction formulas. The resulting ring is $S^(-1)R$.]

The extra factor $u$ is essential. It records that an equality becomes true after inverting elements of $S$, even if ordinary cancellation was invalid in $R$. For transitivity, if $u(t a-s b)=0$ and $v(r b-t c)=0$, then $u v t(r a-s c)=0$, so the relation is transitive. Reflexivity and symmetry are immediate. Multiplying cross-differences by suitable denominators verifies that the operations descend to classes.

#strategy[Use the denominator-annihilator relation rather than cancellation, then force the extension formula by inverses.]

#theorem[Universal property][A ring map $f:R -> T$ sending every element of $S$ to a unit extends uniquely to $S^(-1)R -> T$, through $a/s |->f(a)f(s)^(-1)$.]
#proof[If $u(t a-s b)=0$, then applying $f$ and cancelling the unit images of $u,s,t$ gives equality of the proposed values. The fraction formulas show this is a unital ring homomorphism. Any extension must send the inverse of $s/1$ to the inverse of $f(s)$, forcing the formula and uniqueness.]

#theorem[Vanishing criterion][The element $a/s$ is zero exactly when some $u in S$ satisfies $u a=0$.]
#proof[Compare $(a,s)$ with $(0,1)$ in the defining relation. The condition is exactly $u(a-0)=0$.]

#example[A localization that kills elements][In $R=ZZ slash 6ZZ$, invert the powers of two. The element $[3]$ becomes zero because $[2][3]=0$. The localization is isomorphic to $FF_3$: reduction modulo three sends two to a unit, and every localized fraction has a unique value there. Inverting nonunits can identify formerly distinct elements.]

For a prime ideal $frak(p)$, the complement $R without frak(p)$ is multiplicatively closed. The localization is written $R_frak(p)$. If $R$ is a domain and $S=R without\{0\}$, the construction is its fraction field. If $S=\{1,f,f^2,dots\}$, write $R_f$.

#example[Cross multiplication alone is too strict][In $ZZ/6ZZ$ localized at powers of two, the fractions $3/1$ and $0/1$ are equal, although their naive cross-difference is the nonzero class three. Multiplication by the allowed denominator two kills that difference. This example is the reason for the extra factor in the equivalence relation.]

If zero lies in the denominator set, the vanishing criterion kills every numerator and the localization is the zero ring. Under the convention allowing the zero ring, this causes no contradiction: any target in which zero becomes a unit must itself be the zero ring. State that convention when discussing such degenerate cases.

#checkpoint("6.1", [Why can the complement of a nonprime ideal fail to be multiplicatively closed?], [There may be $a,b$ outside the ideal with $a b$ inside it. Prime ideals exclude exactly this possibility.])
#takeaways[In a ring with zero divisors, equality of localized fractions is not just cross multiplication. Use the explicit vanishing criterion.]
#study-links("U6")

== Lecture 12 · Localizing modules and exact sequences
#focus[Construct localized modules, prove localization is exact, and identify localization with tensoring.]

*Recall and approach.* Recall the vanishing criterion and how tensoring with a localized ring reexpresses fractions of module elements.


For an $R$-module $M$, define $S^(-1)M$ using pairs $(m,s)$ and the relation $(m,s)~(n,t)$ when some $u in S$ kills $t m-s n$. Scalar multiplication by $a/r in S^(-1)R$ is $(a/r)(m/s)=a m/(r s)$. The same checks as for rings prove the construction is well defined.

#strategy[Clear a localized kernel condition with one denominator factor and then use original exactness to lift a numerator.]

#theorem[Exactness of localization][Localization takes every exact sequence of modules to an exact sequence.]
#proof[Let $A arrow.r^f B arrow.r^g C$ be exact at $B$. Certainly the localized composite is zero. If $g(b)/s=0$, the vanishing criterion gives $u in S$ with $u g(b)=0$. Thus $u b in ker g="im"f$, so $u b=f(a)$ for some $a$. Then $b/s=f(a)/(u s)$, showing the localized kernel lies in the localized image. If $f$ was injective, $f(a)/s=0$ gives $u f(a)=0$, hence $u a=0$, so $a/s=0$; injectivity is preserved. Surjectivity is preserved by lifting a numerator.]

#theorem[Localization as tensor product][There is a canonical isomorphism $S^(-1)R otimes_R M iso S^(-1)M$, sending $(a/s)otimes m$ to $a m/s$. In particular $S^(-1)R$ is a flat $R$-module.]
#proof[The displayed formula is bilinear and respects fraction equality. The inverse sends $m/s$ to $(1/s)otimes m$. To see it is well defined, if $u(t m-s n)=0$, then the difference of the proposed images equals $(1/(u s t))otimes u(t m-s n)=0$, using scalar movement. Composites on pure tensors and fractions are identities. Exactness of localization then gives flatness.]

#theorem[Localization at a prime is local][The ring $R_frak(p)$ has a unique maximal ideal, consisting of fractions with numerator in $frak(p)$.]
#proof[A numerator outside $frak(p)$ is in the denominator set, so its fraction is a unit. Fractions with numerator in $frak(p)$ form an ideal. It is proper: equality $a/s=1$ with $a in frak(p)$ would give $u(a-s)=0$ for some $u notin frak(p)$, hence $u s=u a in frak(p)$, contradicting primeness. Every element outside this ideal is a unit, so the ideal is maximal and every proper ideal lies in it.]

#example[Local information at a prime][$ZZ_((p))$ consists of rational numbers whose denominators are not divisible by $p$. Its maximal ideal consists of those with numerator divisible by $p$. Integers coprime to $p$ become units; $p$ remains a nonunit.]
#example[Localizing torsion at different primes][Consider the integer module $ZZ/12ZZ$. At the prime two, three is invertible, so its localization is the cyclic module killed by four, naturally $ZZ/4ZZ$ with the induced localized scalar action. At the prime three, four is invertible and the result is $ZZ/3ZZ$. At a prime dividing neither twelve, twelve itself is invertible and the module becomes zero.]

This calculation makes “local information” concrete: different localizations retain different prime parts. It also explains why a single localization need not detect every nonzero module, whereas testing at all maximal ideals does, as proved on the exercise sheet.

#checkpoint("6.2", [If $S^(-1)M=0$ and $M$ is finitely generated, what single-annihilator conclusion follows?], [Choose an element of $S$ killing each generator and multiply them. The product lies in $S$ and kills all of $M$.])
#takeaways[Localization preserves exact algebraic relationships. The numerator test makes this preservation concrete and is often the shortest route through a calculation.]
#study-links("U6")
