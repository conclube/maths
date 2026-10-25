#import "/shared/book.typ": *
#let p = problem.with(code: "MM8036", unit: "U2")
#let items = (
p(1,"E","U2.1 Beta reduction",[Reduce $(lambda x.x)(lambda y.y)$ to normal form.],[Locate the outer redex.],[Substitute the argument for $x$.],[One step gives $lambda y.y$. It has no application with an abstraction as function, so it is beta normal.],[Justify normality as well as the reduction.]),
p(2,"E","U2.1 Capture avoidance",[Reduce $(lambda x.lambda y.x)y$.],[The free argument must remain free.],[Rename the inner binder before contraction.],[Rename the body to $lambda z.x$; contraction then yields $lambda z.y$. The free-variable set is $\{y\}$, whereas the incorrect answer $lambda y.y$ is closed.],[Preserve the free occurrence of the argument.]),
p(3,"E","U2.1 Divergence",[Let $Delta=lambda x.x x$ and $Omega=Delta Delta$. Show an infinite beta sequence from $Omega$.],[Contract its outer redex.],[The contractum is identical to the source.],[$Omega -> Omega -> Omega -> dots$, because substituting $Delta$ into $x x$ gives $Delta Delta$. Repeating this valid step gives an infinite sequence.],[A self-loop is a reduction step even though the printed term repeats.]),
p(4,"E","U2.1 Reduction strategies",[Compare outermost reduction and call-by-value on $(lambda x.lambda z.z)Omega$.],[The function ignores its argument.],[Call-by-value evaluates the argument first.],[Outermost reduction gives $lambda z.z$ in one step. Call-by-value repeatedly reduces $Omega$ and never applies the outer function. Thus existence of a normal form does not ensure termination of every strategy.],[Name the strategy restriction causing divergence.]),
p(5,"C","U2.2 Joining a fork",[For $(lambda x.x x)((lambda y.y)z)$, contract either the outer redex or the argument redex first and exhibit a common reduct.],[The outer step duplicates the argument.],[Reduce both duplicated argument redexes.],[The outer-first path gives $((lambda y.y)z)((lambda y.y)z)$, then $z((lambda y.y)z)$, then $z z$. The argument-first path gives $(lambda x.x x)z$, then $z z$. Both branches join even though their lengths differ.],[List valid one-step moves on both paths.]),
p(6,"C","U2.2 Normal-form uniqueness",[Derive uniqueness of beta normal forms up to alpha equivalence from confluence.],[Apply confluence to two normal reducts of one term.],[A normal term cannot take a positive number of beta steps.],[If $t ->^* n$ and $t ->^* m$ with both normal, confluence yields $r$ with $n ->^* r$ and $m ->^* r$. Both sequences must have length zero, so $n,r,m$ are equal in the syntax modulo alpha equivalence.],[Use normality at the final step, not termination of all terms.]),
p(7,"C","U2.2 Conversion",[Show that beta-convertible normal terms are alpha equivalent. You may use Church–Rosser for conversion.],[Conversion can contain reversed steps.],[Church–Rosser replaces the zigzag by a common reduct.],[If $n$ and $m$ are convertible, Church–Rosser gives $r$ with $n ->^* r <-^* m$. Their normality forces both paths to be empty, hence their alpha classes agree. A direct appeal only to a common source would be insufficient until the conversion form of the theorem is established.],[Distinguish a conversion zigzag from a reduction sequence.]),
p(8,"C","U2.1 Weak versus strong normalization",[Prove that $(lambda x.lambda z.z)Omega$ is weakly normalizing but not strongly normalizing under full beta reduction.],[Use two different permitted sequences.],[Full reduction may reduce inside the ignored argument.],[A single outer contraction reaches normal form $lambda z.z$, proving weak normalization. Repeatedly contract the occurrence of $Omega$ in the argument without contracting the outside redex; this is an infinite full beta sequence. Hence the term is not strongly normalizing.],[Provide witnesses for both assertions.]),
p(9,"C","U2.2 Parallel reduction",[Compute the complete development of $(lambda x.x x)((lambda y.y)z)$. Explain why it differs from contracting just one redex.],[Develop the body and argument before substituting.],[The argument develops to $z$.],[Using the complete-development clause for a redex, the developed body is $x x$ and the developed argument is $z$, so the result is $z z$. A single outer beta step instead leaves two copies of the argument redex. Parallel development contracts the residual copies represented by the recursively developed argument.],[Use the definition recursively rather than treating development as a strategy name.]),
p(10,"A","U2.2 Confluence versus termination",[Give a finite abstract reduction system that is confluent but has an infinite reduction sequence, and prove both claims.],[A self-loop is enough, but add a visible normal form.],[Use $a->a$ and $a->b$ with $b$ normal.],[Take objects $\{a,b\}$ and exactly the rules $a->a$ and $a->b$, with no step from $b$. Every reduct of $b$ is $b$, while a reduct of $a$ is either $a$ or $b$. Any pair of reducts of $a$ joins at $b$; this proves confluence. The sequence repeating $a->a$ is infinite. Thus confluence alone does not imply strong normalization, even when every object has a normal form.],[Check all possible source objects and reduct pairs.]),
p(11,"A","U2.2 Substitution and reduction",[Prove that if $u -> u'$, then $t[x:=u] ->^* t[x:=u']$. Explain why one step is generally insufficient.],[Induct on $t$, renaming binders fresh.],[There is one copy of the step for each free occurrence of $x$.],[For $t=x$ use the given step; for another variable use zero steps. In an application, apply the induction sequences in its left and then right subterm. Under a binder other than $x$, rename fresh for $u,u'$ and lift the induction sequence under the abstraction. A binder $x$ blocks substitution and needs zero steps. For $t=x x$, the substitution produces two copies of $u$, so reducing both may require two steps; if $x$ is absent it requires none.],[Include zero steps and duplicated occurrences.]),
p(12,
  "A",
  "U2.2 Distinguishing convertibility",
  [Prove the closed terms $lambda x.lambda y.x$ and $lambda x.lambda y.y$ are not beta convertible. Why is their different behavior on some arguments not needed for this proof?],
  [Inspect normal forms and binding structure.],
  [Combine normal-form uniqueness for conversion with the de Bruijn invariant.],
  [*Finding the approach.* Normal forms provide a syntactic invariant. Check normality and binding structure first, then use confluence to rule out a hypothetical conversion.

*Argument.* Both terms are beta normal. Their encodings have respective bodies $1$ and $0$, so they are not alpha equivalent. If they were beta convertible, Church–Rosser and normality would force alpha equivalence, a contradiction. Operational tests could provide intuition, but this syntactic invariant already proves nonconvertibility without choosing or interpreting arguments.

Neither term contains an application with an abstraction in function position, so neither can take a beta step. Church–Rosser says beta-convertible terms have a common reduct, with terms considered up to alpha renaming. A normal term's only multistep reduct is itself up to that convention. The first body's occurrence points to the outer binder and the second to the inner binder, so they cannot share a reduct.

*A tempting dead end.* Merely observing that two normal terms have different variable names is insufficient, since bound names can be renamed. The different binder positions are the decisive distinction.

*Hypotheses.* The conversion is beta conversion with capture-avoiding substitution. Adding arbitrary new equations could identify terms that beta conversion distinguishes.],
  [Establish normality and failure of alpha equivalence separately.],
  idea: [Use confluence to reduce convertibility of normal terms to equality of their binding structures.]),
 p(13,
  "A",
  "U2 Transfer: Termination after duplicating an input",
  [Let $I=lambda z.z$ and $D=lambda x.x x$. Suppose a closed term t reduces in finitely many beta steps to I. Prove that D t has a normal form. Must D t be strongly normalizing for every such t?],
  [First follow the given finite reduction inside the argument of D.],
  [For the second part, an argument can reach I while containing a subterm whose reduction never stops.],
  [*Finding the approach.* The supplied reduction gives one successful strategy, so it proves weak normalization. To test the stronger claim, retain a divergent component that this successful strategy erases.

*Argument.* By closure of beta reduction under contexts, $D t ->^* D I -> I I -> I$, and I is normal. Thus D t is weakly normalizing. Let $Omega=(lambda u.u u)(lambda u.u u)$ and choose $t=(lambda v.I)Omega$. This closed term reduces to I in one outer step. However inside the argument of D, the Omega subterm can reduce to itself forever, producing an infinite full beta-reduction sequence from D t. Hence D t need not be strongly normalizing. Confluence guarantees that a reached normal form agrees with I up to alpha equivalence; it does not rule out the infinite path.

*A tempting dead end.* Existence of a terminating strategy is not termination of every reduction sequence. Confluence also does not convert weak normalization into strong normalization.

*Hypotheses.* This is the untyped calculus with full beta reduction, including reduction inside arguments. No typing claim is made for D or Omega.],
  [Give the finite path, the closed counterexample, its infinite path, and the precise role of confluence.],
  optional: true,
  minutes: 60,
  idea: [Use the given successful path for existence, then place divergence in a part that another strategy can keep reducing.]),
)
