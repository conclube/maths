#import "/shared/book.typ": *
#let p = problem.with(code: "MM7033", unit: "U2")
#let items = (
 p(1,"E","U2.1 Chains",[Give a partially ordered set with two maximal elements and no greatest element.],[Use incomparable elements.],[A two-element set with only equality as its order suffices.],[Let the elements be $a,b$, with no comparison between distinct elements. Both are maximal because neither has a strictly larger element. Neither is greatest because it is not above the other.],[Distinguish the definitions of maximal and greatest.]),
 p(2,"E","U2.1 Proper ideals",[Prove an ideal $I$ of a unital ring is proper exactly when $1 notin I$.],[If one belongs, multiply it by every ring element.],[The converse follows because the whole ring contains one.],[If $1 in I$, then every $r=r 1$ lies in $I$, so $I=R$. Conversely if $I=R$, one belongs to it. Taking the negation gives the criterion.],[Use the ideal absorption property.]),
 p(3,"E","U2.2 Independence",[Is $\{t,t^2\}$ algebraically independent over $K$ in $K(t)$?],[Look for a polynomial in two variables.],[Use $Y-X^2$.],[No. The nonzero polynomial $Y-X^2 in K[X,Y]$ evaluates to zero at $(t,t^2)$. The singleton $\{t\}$ is independent by the definition of the indeterminate.],[Exhibit a nonzero formal polynomial relation.]),
 p(4,"E","U2.2 Transcendence bases",[Give a transcendence basis of an algebraic extension $L slash K$.],[The extension already is algebraic over the base.],[The empty set is independent.],[The empty set is a transcendence basis: $K(emptyset)=K$, and $L slash K$ is algebraic by hypothesis. Independence of the empty set means a nonzero constant cannot vanish.],[Check both parts of the definition.]),
 p(5,"C","U2.1 Chain unions",[Prove the union of a nonempty chain of proper ideals is proper and an ideal.],[Place any two chosen elements in a common member using comparability.],[If one were in the union, it would be in one member.],[For elements in the union, their two ideals are comparable, so both lie in the larger one; their difference belongs there. Multiplication by a ring element preserves whichever ideal contains the element. If one lay in the union, some member would contain one and be the whole ring, a contradiction.],[The empty chain requires a separately chosen upper bound in a Zorn application.]),
 p(6,"C","U2.1 Maximal ideals over an ideal",[Use maximal-ideal existence in a quotient to show every proper ideal $I$ lies in a maximal ideal.],[The quotient by a proper ideal is nonzero.],[Pull back a maximal ideal under the quotient map.],[$R slash I$ is a nonzero commutative unital ring, so it has a maximal ideal $M'$. Its inverse image $M$ contains $I$, and $R slash M iso (R slash I) slash M'$ is a field. Therefore $M$ is maximal.],[Use the quotient criterion for maximality.]),
 p(7,"C","U2.2 Algebraic closure",[Show an algebraically closed field has no proper algebraic field extension.],[Use the minimal polynomial of any element in the extension.],[An irreducible polynomial over an algebraically closed field is linear.],[For algebraic $alpha$ over $K$, its minimal polynomial splits over the algebraically closed $K$. Since it is irreducible, it must be linear, so $alpha in K$. Every element of an algebraic extension therefore already belongs to $K$.],[Apply the reasoning to every extension element.]),
 p(8,"C","U2.2 Transitivity",[Prove algebraicity is transitive through a tower, allowing infinite extensions.],[Only finitely many coefficients occur in an equation for one element.],[Put those coefficients into a finite intermediate extension.],[If $alpha$ is algebraic over algebraic $L slash K$, collect the finitely many coefficients of an annihilating polynomial into $F=K(c_1,dots,c_r)$. Then $F slash K$ and $F(alpha) slash F$ are finite. The tower law makes $F(alpha) slash K$ finite, so $alpha$ is algebraic over $K$.],[Do not assume $L slash K$ itself has finite degree.]),
 p(9,"C","U2.1 Extending independent sets",[Use Zorn's lemma to extend a linearly independent subset of a vector space to a basis.],[Order independent supersets of the given subset.],[A finite relation in a chain union lies in one chain member.],[Order the linearly independent subsets containing the prescribed independent set $S$ by inclusion. This poset is nonempty because it contains $S$. Every chain union remains independent by finite dependence and is an upper bound. Zorn gives a maximal independent superset. If it failed to span, adding a vector outside its span would preserve independence, contradicting maximality. Thus it is a basis.],[Preserve the originally specified independent set throughout.]),
 p(10,"A","U2.2 A nontrivial transcendence basis",[Show $\{t^2\}$ is a transcendence basis of $K(t) slash K$.],[A polynomial relation in $t^2$ would be a polynomial relation in $t$.],[The element $t$ satisfies $X^2-t^2$ over $K(t^2)$.],[If a nonzero polynomial $P$ vanished at $t^2$, then $P(X^2)$ would be a nonzero polynomial vanishing at the indeterminate $t$, impossible. Thus $t^2$ is transcendental. The element $t$ is algebraic over $K(t^2)$ through $X^2-t^2$, so $K(t) slash K(t^2)$ is algebraic. These two facts prove the basis property, in every characteristic.],[Do not assume separability in characteristic two.]),
 p(11,"A","U2.1 Units detected by maximal ideals",[Prove an element of a nonzero commutative unital ring is a unit exactly when it belongs to no maximal ideal.],[A nonunit generates a proper ideal.],[Extend that ideal to a maximal ideal.],[A unit cannot lie in a proper ideal, hence in no maximal ideal. Conversely if $r$ is not a unit, $(r)$ is proper: an equation $1=s r$ would make it a unit. Maximal-ideal existence places $(r)$ inside a maximal ideal, which contains $r$. Taking the contrapositive gives the result.],[Use commutativity for the principal-ideal/unit equivalence.]),
 p(12,
  "A",
  "U2.2 Maximal independence",
  [Prove every maximal algebraically independent subset $B$ of $L slash K$ is a transcendence basis.],
  [Assume an element is transcendental over $K(B)$.],
  [A relation after adjoining it would be a polynomial in that element with coefficients in $K(B)$.],
  [*Finding the approach.* Maximality can be used only after showing that adjoining a purported transcendental element preserves independence. Establish that implication with a finite polynomial relation.

*Argument.* Suppose $alpha$ is transcendental over $K(B)$. A nonzero polynomial relation among finitely many elements of $B$ and $alpha$ can be grouped by powers of $alpha$. At least one coefficient polynomial in the distinct elements of $B$ is nonzero after evaluation, by independence. Thus the relation makes $alpha$ algebraic over $K(B)$, impossible. Hence $B union\{alpha\}$ would be independent, contradicting maximality. Every element is therefore algebraic over $K(B)$.

Write a possible relation as $sum_(j=0)^n P_j(b_1,dots,b_r)alpha^j=0$, with not all coefficient polynomials $P_j$ zero. Independence of the distinct $b_i$ means a nonzero $P_j$ cannot evaluate to zero. Thus the displayed relation would be a nonzero polynomial over $K(B)$ vanishing at $alpha$, contradicting transcendence. This finite-support argument is valid even when $B$ itself is infinite.

*A tempting dead end.* A maximal independent set need not contain every element of the extension. It must make the remaining elements algebraic over the field it generates.

*Hypotheses.* The set is maximal under inclusion among algebraically independent sets. The proof uses finite polynomial expressions and does not require a finite transcendence degree.],
  [Explain why the coefficient polynomial does not vanish identically after evaluation.],
  idea: [Turn failure of algebraicity over the generated field into a strictly larger independent set.]),
 p(13,
  "A",
  "U2 Transfer: Maximal ideals of eventually constant sequences",
  [Let $R$ be the ring of eventually constant real sequences, with coordinatewise operations. Classify its maximal ideals and show that one of them is not finitely generated.],
  [Use coordinate evaluation and the eventual constant value as homomorphisms to $RR$.],
  [Let $e_n$ be one at coordinate n and zero elsewhere; in a field an idempotent is zero or one.],
  [*Finding the approach.* The visible evaluation maps give candidates. To prove completeness, examine where the coordinate idempotents can go in an arbitrary field quotient.

*Argument.* Each coordinate kernel $M_n=\{a:a_n=0\}$ and the eventual-value kernel $I$ is maximal because the corresponding evaluation onto $RR$ is surjective. The ideal $I$ consists exactly of finite-support sequences. Let $M$ be any maximal ideal. If all $e_n$ belong to $M$, then $I subset M$, so maximality of $I$ gives $M=I$. Otherwise choose $e_n notin M$. In the field $R slash M$ its nonzero idempotent image equals one, so $1-e_n in M$. Every sequence with nth coordinate zero equals its product with $1-e_n$, hence $M_n subset M$ and $M=M_n$. Finally finitely many elements of $I$ have support in some finite set. Any R-linear combination retains support inside that set, so cannot produce $e_n$ outside it. Thus $I$ is not finitely generated.

*A tempting dead end.* An infinite union of coordinate kernels is not the eventual-value kernel, and an arbitrary union of ideals need not be an ideal at all.

*Hypotheses.* The sequences are eventually constant, ensuring the eventual-value map is defined and its kernel has finite support. The field quotient is used to classify idempotents.],
  [Verify all evaluation maps, exhaust arbitrary maximal ideals, and prove the support obstruction.],
  optional: true,
  minutes: 60,
  idea: [Use quotient fields to force each coordinate idempotent to zero or one, then exploit finite support to obstruct finite generation.]),
)
