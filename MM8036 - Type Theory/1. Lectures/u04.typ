#import "/shared/book.typ": *
= Unit 4 · Normalization and constructive logic

*Bridge into this unit.* Induction on typing supplies termination of subterms, but termination is not stable under arbitrary application. Reducibility strengthens the invariant to control applications at each type. The proof's three layers are candidate closure, controlled beta expansion, and the fundamental substitution lemma.

== Lecture 7 · Strong normalization by reducibility
#focus[Understand why induction on typing needs a strengthened invariant and prove strong normalization for the arrow-only simply typed core.]

*Recall and approach.* Recall absence of infinite reduction, induction on types, and the syntax-directed typing rules.


The desired statement is that no infinite full beta-reduction sequence begins at a typable term. A direct application-case induction fails: two terminating terms can form a nonterminating application, as $Delta Delta$ shows. We therefore strengthen termination to a property indexed by the term's type.

#definition[Reducible terms][Let $SN$ be the strongly normalizing raw terms. Define $cal(R)_o=SN$ and
$ cal(R)_(A -> B)=\{t in SN: "for every" u in cal(R)_A, t u in cal(R)_B\}. $
Reducibility is defined for raw terms; the fundamental lemma will connect it to typing. A neutral term here means a term that is not an abstraction, so applications, including beta redexes, are neutral.]

#strategy[Strengthen termination to a type-indexed application property, and separate candidate closure, expansion, and the fundamental lemma.]

#theorem[Candidate properties][For every type $A$: (1) reducibility implies strong normalization; (2) a reduct of a reducible term is reducible; (3) a neutral term all of whose immediate reducts are reducible is reducible.]
#proof[Induct on $A$. At the base type these are the corresponding elementary properties of absence of an infinite reduction path. At an arrow type, (1) is part of the definition. For (2), a reduct $t'$ remains strongly normalizing, and $t u arrow.r_beta t'u$; closure at the result type puts $t'u$ in $cal(R)_B$ for every reducible $u$. For (3), the hypothesis makes every reduct of $t$ strongly normalizing, hence $t$ strongly normalizing. Fix reducible $u$. Prove $t u in cal(R)_B$ by induction on the maximum reduction length of $u$, which exists because reduction is finitely branching and $u$ is strongly normalizing. Since $t$ is not an abstraction, a one-step reduct of $t u$ reduces either $t$ or $u$. Reducing $t$ gives $t'u$ reducible by the hypothesis at arrow type. Reducing $u$ gives $t u'$ reducible by the smaller-length induction. Neutral closure at $B$ now gives the claim.]

In particular every variable is reducible at every type: it is neutral and has no reducts. The same applies to the inert base constant at its base type.

#theorem[Controlled beta expansion][If $s,u$ are strongly normalizing and $s[x:=u] in cal(R)_B$, then $(lambda x.s)u in cal(R)_B$.]
#proof[Induct on the sum of the maximal reduction lengths of $s,u$. The root contraction is reducible by assumption. A step in $s$ gives $s'$ with $s'[x:=u]$ a reduct of the substituted body, hence reducible by closure; the induction hypothesis handles the corresponding redex. A step $u -> u'$ makes $s[x:=u']$ a finite reduct of $s[x:=u]$, reducing each substituted occurrence (or taking zero steps when none occur), so it is reducible; use induction again. These exhaust the immediate reducts. The redex is neutral under our definition, so neutral closure at $B$ proves the result.]

#theorem[Fundamental lemma and normalization][If $Gamma tack.r t:A$ and a simultaneous capture-avoiding substitution sends every $x:B$ in $Gamma$ to a term in $cal(R)_B$, then the substituted term lies in $cal(R)_A$. Consequently every term typable in the arrow-only core is strongly normalizing.]
#proof[Induct on the typing derivation. Variables and the constant follow from the assumptions; application follows from the arrow definition. For an abstraction $lambda x.s$, rename $x$ fresh for the substitution. Extending the environment by a fresh reducible variable shows the substituted body is strongly normalizing, by the induction hypothesis and alpha-renaming. For arbitrary reducible argument $u$, extend the environment by $x:=u$; induction makes the substituted contractum reducible. Controlled beta expansion therefore makes the application reducible. The abstraction itself is strongly normalizing because its body is, so it satisfies the arrow clause. Finally choose the identity substitution: each variable is reducible, so $t$ is reducible and hence strongly normalizing.]

#example[Why the proof uses raw terms][The reducibility sets are defined on raw terms so that substitution environments and neutral closure can be handled uniformly. A variable has no reducts, so it belongs to every candidate by neutral closure. This does not mean a variable has every type in a fixed context: candidate membership is a metatheoretic predicate, while typing is a separate inductive judgment. The fundamental lemma is precisely the theorem connecting the two.]

To read the abstraction case, make two columns: the fresh-variable environment proves that the body terminates; an arbitrary reducible-argument environment proves the contractum reducible. Controlled beta expansion combines those facts. Omitting the first column leaves one hypothesis of the expansion lemma unproved.

#checkpoint("4.1", [Why is the arrow reducibility condition stronger than simply asking the function term to terminate?], [It also requires good behavior when applied to every reducible argument, exactly the condition needed for the typing rule for application.])
#takeaways[The strengthened invariant makes application work; the expansion lemma makes abstraction work. The theorem here concerns the specified simply typed core, not every later dependent type theory or every Agda feature.]
#study-links("U4")

== Lecture 8 · Curry–Howard and the BHK interpretation
#focus[Translate constructive propositions into types and proofs into terms, including products, sums, and the empty type.]

*Recall and approach.* Recall natural deduction, assumption discharge, and the difference between constructing data and denying its impossibility.


Under Curry–Howard, a typing derivation can be read as a natural-deduction proof. An assumption $x:A$ is available evidence for proposition $A$; a term of type $A -> B$ transforms evidence for $A$ into evidence for $B$. Abstraction discharges an assumption, and application is implication elimination.

#definition[Constructive connectives][Conjunction is represented by a product $A times B$, with pair introduction and two projections. Disjunction is a sum $A+B$, with injections naming the chosen alternative and case analysis as elimination. Truth is the unit type $1$ with one constructor. Falsehood is the empty type $0$ with no constructors; its eliminator produces a term of any type from an assumed term of $0$. Negation abbreviates $A ->0$.]

The Brouwer–Heyting–Kolmogorov interpretation explains what constitutes evidence: a conjunction proof supplies both pieces; a disjunction proof supplies a chosen side and its evidence; an implication proof supplies a uniform transformation; an existential proof supplies a witness and evidence about it; a universal proof supplies evidence uniformly for each input. Dependent sums and products will make the last two precise.

#example[Two proof programs][A proof of $A -> B -> A$ is $lambda a.lambda b.a$. A proof of $(A times B)->(B times A)$ takes a pair and returns its two projections in reversed order. A proof of $(A+B)->C$ requires a function $A -> C$ and a function $B -> C$, then uses case analysis on the tag.]

#strategy[Read the introduction and elimination rules of each connective as constructors and consumers of evidence.]

#theorem[Constructive distributivity][There are maps both ways between $A times(B+C)$ and $(A times B)+(A times C)$ whose composites compute to the identity on constructor inputs.]
#proof[Given $(a,s)$, inspect $s$. If it is a left injection of $b$, return the left injection of $(a,b)$; if a right injection of $c$, return the right injection of $(a,c)$. Conversely inspect the outer sum and return the corresponding pair with a tagged second coordinate. On either constructor case, each composite returns the original constructor data by the product and sum computation rules.]

Computational content depends on the proof principles adopted. The general law $A+(A ->0)$ is not an added axiom of our constructive core. A decision procedure for a particular proposition can nevertheless construct such a sum, selecting a branch with evidence. Classical principles, if later assumed, must be recorded explicitly rather than hidden inside a case distinction.

#warning[The normalization proof in the preceding lecture covered only base and arrow types. Products and sums can be treated by extending the reducibility argument with additional clauses; no normalization theorem for unrestricted recursion is being asserted here.]
#example[One direction of a De Morgan principle][A term of $(A+B)->0$ yields both $A->0$ and $B->0$: precompose it with the two injections. Conversely, a pair of refuters gives a refuter of $A+B$ by case analysis. Both constructions are constructive because a sum exposes its tag.]

The corresponding informal proof should describe which evidence is consumed in each branch. A statement such as “one of the cases must hold” is not enough unless the input supplies a sum tag or a decision procedure produces one. This discipline makes the computational content of a proof explicit before any code is written.

#checkpoint("4.2", [What extra information does a term of $A+B$ carry compared with the bare assertion that at least one side is true?], [It carries a tag choosing a side and a term providing evidence for that side.])

#pagebreak()
=== A slower route through the central ideas

*Expanded dependency map.* Define candidates by induction on types, with the arrow clause requiring both strong normalization and preservation of reducibility under application. Prove closure under reduction and neutral expansion by induction on type. In the arrow neutral case, fix a reducible argument and induct on its maximal reduction length. A reduct of the application reduces either the neutral function or its argument; the former uses the given arrow-candidate hypothesis on the function's reduct, while the latter uses the strictly smaller argument measure. Neutral closure at the result type then finishes the step. A strongly normalizing term has such a finite maximal length because this reduction system is finitely branching.

Controlled beta expansion next considers all immediate reducts of $(lambda x.s)u$. They are the root contractum, a reduction in s, or a reduction in u. Induct on the sum of the two maximal reduction lengths. Candidate closure handles the corresponding substituted contracta, and neutral closure combines the cases. Here “neutral” means not an abstraction, so the redex itself qualifies; it does not mean beta-normal.

#example[The identity satisfies every arrow self-candidate][
Fix a type A. The raw body x is normal, hence strongly normalizing, so $lambda x.x$ is strongly normalizing. For an arbitrary $u in cal(R)_A$, the contractum of $(lambda x.x)u$ is u, already reducible. The body and argument both terminate, so controlled expansion makes the application reducible. Thus $lambda x.x in cal(R)_(A->A)$. This proof checks both arrow clauses rather than only the contraction's result.
]
*The abstraction case as two experiments.* In the fundamental lemma, first extend a reducible substitution by a fresh variable for the binder. The induction hypothesis makes the substituted body strongly normalizing. Next extend it by an arbitrary reducible argument. This makes the substituted contractum reducible. Controlled expansion combines the two experiments; neither can replace the other. Finally the identity substitution is reducible because variables lie in every candidate, connecting the substitution theorem back to all typed terms.

#example[Why uncontrolled expansion is false][
The raw term $(lambda x.c)Omega$ contracts to the reducible base constant c, but it is not strongly normalizing: reduction may remain inside Omega forever. Thus reducibility of a contractum alone does not justify reducibility of the redex. The controlled lemma's assumption that the argument terminates excludes this case. If a substitution erases its variable, that assumption is still required.
]
*A failed shortcut.* Candidate membership is a predicate on raw terms, not a typing judgment. A fresh variable belongs to every candidate without having every type in one fixed context. The fundamental lemma is the bridge from well-typed substitutions to these predicates. Its conclusion here is restricted to the specified arrow-only simply typed core.

#takeaways[Proof rules become term constructors, and proof simplification becomes computation. Optional Lab 1 implements these basic proof programs.]
#study-links("U4")
