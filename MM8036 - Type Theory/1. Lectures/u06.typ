#import "/shared/book.typ": *
= Unit 6 · Induction, identity, and universes

*Bridge into this unit.* An eliminator is determined by a motive: the family of result types it must produce. Choose that family before the base and step cases. For identity elimination the endpoint must be allowed to vary; for natural numbers the computation equations determine which induction variable is useful.

== Lecture 11 · Natural numbers and dependent induction
#focus[State induction with its motive, distinguish recursion from induction, and compute a proof by structural recursion.]

*Recall and approach.* Recall recursion with a constant result type and the distinction between a variable and a visible constructor.


#definition[Natural-number rules][The type $"Nat"$ has constructors $"zero":"Nat"$ and $"suc":"Nat" -> "Nat"$. For a family $P(n)$, a base case $z:P("zero")$, and a step $s:Pi_(n:"Nat")(P(n)->P("suc"(n)))$, induction gives $"ind"(P,z,s,n):P(n)$. It computes to $z$ at zero and to $s(n,"ind"(P,z,s,n))$ at a successor.]

The family $P$ is the motive: it specifies what the output type must be at each input. Recursion is the special case in which this family is constant. A proof by induction becomes a program whose recursive call is justified by a structurally smaller natural number.

#example[Addition and its two zero laws][Define $"add"("zero",n) equiv n$ and $"add"("suc"(m),n) equiv "suc"("add"(m,n))$. The left-zero law computes judgmentally. The right-zero law $"add"(n,"zero")=n$ requires induction for an arbitrary variable $n$, because reduction cannot inspect a variable to choose its constructor.]

#strategy[Write the motive before the cases and make recursive calls only on the structurally smaller input.]

#theorem[Right-zero proof][For every $n$, there is an identity proof of $"add"(n,"zero")=n$.]
#proof[Use motive $P(n)="Id"_"Nat"("add"(n,"zero"),n)$. At zero, addition computes and reflexivity proves the claim. In the successor case, the induction hypothesis gives equality of $"add"(n,"zero")$ and $n$. Applying the function $"suc"$ to that equality gives equality of their successors, which is the required goal after the addition computation rule. Function application to equality is derived by identity elimination in Lecture 12.]

#definition[Length-indexed vectors][For a type $A$, the family $"Vec"(A,n)$ has a constructor $"nil":"Vec"(A,"zero")$ and a constructor taking $a:A$ and $v:"Vec"(A,n)$ to $"cons"(a,v):"Vec"(A,"suc"(n))$.]

Appending a vector of length $m$ to one of length $n$ produces length $"add"(m,n)$. Recurse on the first vector: the empty case returns the second vector, and the constructor case retains the head and recursively appends the tail. The resulting length matches the addition equations by judgmental conversion. No separate length-correctness theorem is required because the result type already states it.

Inductive definitions must respect positivity restrictions. A purported datatype constructor accepting a function from the datatype itself into the empty type can introduce negative self-reference and undermine normalization or consistency. The optional labs use ordinary strictly positive natural-number, sum, equality, and vector definitions; the type checker verifies their permitted forms and termination.

#example[Associativity follows the definition’s recursion direction][For fixed $b,c$, prove $(a+b)+c=a+(b+c)$ by induction on $a$, where addition recurses on its first argument. At zero both sides compute to $b+c$. At successor they compute to successors of the two sides of the induction hypothesis, so congruence of successor proves the step.]

Inducting on a different variable is not wrong in principle, but the defining equations may stop reducing and require extra lemmas. Choosing an induction variable to match computation often produces the shortest proof. The optional lab uses exactly this alignment, with the result expressed as an identity type.

#checkpoint("6.1", [Why can $"add"("zero",n)$ reduce when $"add"(n,"zero")$ is stuck for variable $n$?], [The recursion inspects its first argument. A constructor is visible in the first expression but not in the second.])
#takeaways[Write the motive before the induction cases. Dependent induction ensures each recursive result has exactly the type needed at the smaller input.]
#study-links("U6")

== Lecture 12 · Identity elimination and universe levels
#focus[Distinguish judgmental equality from identity proofs, derive transport, and use predicative universes without type-in-type.]

*Recall and approach.* Recall a type judgment is different from a term of an identity type; universes stratify type formation.


#definition[Identity type and path induction][For $a,b:A$, form $"Id"_A(a,b)$, with constructor $"refl"_a:"Id"_A(a,a)$. To define a term of a family $C(a,b,p)$ for $p:"Id"_A(a,b)$, it suffices to give $d(a):C(a,a,"refl"_a)$. The eliminator $J$ returns that case when $p$ is reflexivity.]

#strategy[Generalize the endpoints in the motive of J, reduce to reflexivity, and then supply the required canonical proof.]

#theorem[Transport and equality operations][For a family $B:A -> U$ and $p:"Id"_A(a,b)$, there is a function $"transport"_B(p):B(a)->B(b)$, computing to the identity for reflexivity. Identity types also admit symmetry, transitivity, and congruence under a function.]
#proof[For transport, use path induction with motive $C(a,b,p)=B(a)->B(b)$ and reflexive case the identity function. For symmetry, use motive $"Id"_A(b,a)$ and reflexivity in the reflexive case. For transitivity, induct on one equality proof with the other endpoint and proof appropriately retained in the motive; the reflexive case returns the remaining proof. For congruence under $f:A -> D$, use motive $"Id"_D(f(a),f(b))$, with reflexivity at the base case. Each operation's computation on reflexivity follows from the $J$ rule.]

A term $p:"Id"_A(a,b)$ does not automatically make $a$ and $b$ judgmentally equal. The latter is a conversion judgment used by the type checker; the former is internal evidence which can be consumed by transport. We do not assume equality reflection. Nor does path induction assert that every equality proof with fixed endpoints is judgmentally reflexivity; that mistaken inference would confuse the general motive of $J$ with a stronger uniqueness principle.

#definition[Universe hierarchy][We use levels $U_0:U_1:U_2:dots$. If $A:U_i$ and $B(x):U_j$, dependent products and sums belong to $U_(max(i,j))$. Identity types on $A:U_i$ lie in $U_i$, and natural numbers lie in $U_0$. We do not identify a universe with its own type and do not assume cumulativity in the paper presentation.]

#example[Polymorphic identity][The expression $lambda A.lambda x.x$ inhabits $Pi_(A:U_0)(A->A)$, a type in $U_1$. The outer quantification ranges over $U_0$, whose type is $U_1$; it is not a small endofunction on an unstratified “type of all types.”]

Agda uses `Set`, `Set₁`, and further levels for this hierarchy. Its conversion includes some additional eta rules compared with our minimal paper core; the labs use proofs valid in their common fragment. The labs run with `--safe --without-K`, so they do not bypass checking by postulates or rely on the K principle for identity proofs.

#example[Changing a fiber without changing data][If $p:"Id"_"Nat"(m,n)$ and $v:"Vec"(A,m)$, transport in the family $k mapsto "Vec"(A,k)$ yields a vector in $"Vec"(A,n)$. No vector elements are inserted or removed. The equality evidence justifies treating the same dependent data in the endpoint fiber. When $p$ is reflexivity, the cast computes to $v$.]

For an arbitrary proof variable $p$, that reflexive computation is not immediately available. A further proof about the cast should eliminate $p$ with a motive valid for varying endpoints, rather than pretending all paths are judgmentally reflexivity.

#checkpoint("6.2", [When does transport compute immediately?], [When its equality argument is reflexivity; a general variable proof does not expose that computation rule until eliminated.])

#pagebreak()
=== A slower route through the central ideas

#example[Computing a proof of the right-zero law][
Addition recurses on its first argument. Set $P(n)="Id"_"Nat"("add"(n,"zero"),n)$. At zero, both endpoints compute to zero, so reflexivity proves $P("zero")$. Given $h:P(n)$, congruence of successor gives an identity from $"suc"("add"(n,"zero"))$ to $"suc"(n)$. The defining addition equation makes this precisely $P("suc"(n))$. At the concrete numeral two, both recursion steps unfold and the proof reduces through successor congruence; at a variable n, induction provides evidence where computation alone is stuck.
]
#inference([$h:"Id"_"Nat"("add"(n,"zero"),n)$],
[$"ap"_"suc"(h):"Id"_"Nat"("suc"("add"(n,"zero")),"suc"(n))$],
name: "Successor congruence")
*Deriving congruence rather than assuming it.* For $f:A -> D$, use J with motive $C(a,b,p)="Id"_D(f(a),f(b))$. Its reflexive case is $"refl"_(f(a))$. Therefore $"ap"_f(p)$ has the desired endpoints, and $"ap"_f("refl"_a)$ computes to reflexivity. This supplies the equality operation used in the induction step above and makes its dependency explicit.

#example[A cast with a variable endpoint][
For $B:A->U_0$, $a:A$, $b:A$, $p:"Id"_A(a,b)$, and $v:B(a)$, the term v cannot simply be used at type $B(b)$. Take motive $C(a,b,p)=B(a)->B(b)$ for J, with identity function as the reflexive case. This yields $"transport"_B(p)(v):B(b)$. When p is reflexivity, it computes to v. For a proof variable p it is a valid term in the new fiber but need not visibly reduce. In the vector family this changes the justified length index without adding or removing vector entries.
]
*A failed shortcut.* A proposed comparison of every loop p with reflexivity must first make sense for $p:"Id"_A(a,b)$ at a general b. Reflexivity at a has the wrong identity type for that comparison. The missing formation judgment cannot be supplied by saying “now take b=a”; that restricts the elimination problem before applying J. This diagnoses the gap without asserting that J yields K or UIP.

*Universe check.* The identity family on $A:U_0$ remains in $U_0$. But the polymorphic type $Pi_(A:U_0)(A->A)$ lies in $U_1$, because its domain $U_0$ is itself a type in $U_1$. These level calculations are formation obligations, just as endpoint calculations are obligations for identity motives. No type-in-type or cumulativity rule is being added.

#takeaways[Equality proofs move terms between dependent fibers. Universe levels keep the formation rules stratified. Optional Lab 4 makes both transport and its computation visible.]
#study-links("U6")
