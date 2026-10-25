#import "/shared/book.typ": *
= Unit 5 · Dependent types

*Bridge into this unit.* A dependent function's result type changes with its input, while a dependent pair's second component is checked in the fiber selected by its first. Keep a term and its type together through every projection and substitution; ordinary tuple notation can hide the crucial dependency.

== Lecture 9 · Contexts, judgments, and dependent products
#focus[Read dependent judgments, distinguish formation/introduction/elimination/computation rules, and type applications whose result depends on the argument.]

*Recall and approach.* Recall contexts, alpha-renaming, and the simple substitution lemma; now types may also contain term variables.


In simple type theory, result types do not mention term variables. In dependent type theory they may: a vector's type can include its length, and a function can return a proof about the very input it receives. The type system must therefore track substitution in types as well as terms.

#definition[Judgment forms][We use judgments that a context is valid, that $Gamma tack.r A "type"$, that $Gamma tack.r t:A$, and judgmental equalities $Gamma tack.r A equiv B "type"$ and $Gamma tack.r t equiv u:A$. Equality here is a judgment of the theory, not yet a type inhabited by an equality proof.]

A dependent context is an ordered list $x_1:A_1,dots,x_n:A_n$, where each $A_i$ is a type in the preceding context. Reordering assumptions can be invalid. The abbreviation “$A$ type” will later mean that $A$ belongs to an appropriate universe. Our core uses intensional identity types, predicative universe levels, beta computation and congruence; it does not adopt equality reflection, uniqueness of identity proofs, function extensionality, or univalence as axioms. We do not require a function-eta judgmental rule in the paper core.

#definition[Dependent product][If $Gamma tack.r A "type"$ and $Gamma,x:A tack.r B(x) "type"$, then $Pi_(x:A)B(x)$ is a type. Introduction takes a term $b(x):B(x)$ in the extended context to $lambda x.b(x):Pi_(x:A)B(x)$. Elimination takes $f:Pi_(x:A)B(x)$ and $a:A$ to $f(a):B(a)$. The computation rule is $(lambda x.b(x))(a) equiv b(a)$.]

#inference([$Gamma tack.r f:Pi_(x:A) B(x) quad Gamma tack.r a:A$],[$Gamma tack.r f(a):B(a)$],name:"Dependent application")

Ordinary function types are the case where $B$ does not depend on $x$. Under Curry–Howard, a dependent product expresses universal quantification: one term must provide evidence of $B(a)$ uniformly for every input $a$.

#example[An indexed identity function][For a family $B:A -> U$, the expression $lambda x.lambda y.y$ has type $Pi_(x:A)(B(x)->B(x))$. After supplying $a:A$, it becomes the identity function on the particular fiber $B(a)$. The result type changes with the first argument.]

#strategy[Track substitution in the result type as carefully as in the term; apply each rule only in a well-formed context.]

#definition[Structural rules in this presentation][Conversion permits a term of type $A$ to be used at a judgmentally equal type $B$. We take simultaneous substitution of well-typed terms as a structural rule: substituting $a:A$ for an assumption $x:A$ substitutes into both the term and all subsequent dependent types. Context formation and freshness must remain valid. This is part of our specified dependent theory; it is not a claim that substitution has been derived for every possible extension of the calculus.]

#theorem[Substitution at a dependent application][Let $f:Pi_(x:A)B(x)$ and $a:A$ be over $Gamma$, and let $sigma:Delta->Gamma$ be a well-typed substitution. Then $(f a)[sigma]$ and $f[sigma](a[sigma])$ have the same dependent result type over $Delta$.]
#proof[Rename $x$ fresh for $sigma$. Substituting into the Pi judgment gives $f[sigma]:Pi_(x:A[sigma])B[sigma^+](x)$, where $sigma^+$ extends $sigma$ by retaining the fresh variable $x$. Applying to $a[sigma]$ gives type $B[sigma^+][x:=a[sigma]]$. Substituting into the original result judgment instead gives $(B[x:=a])[sigma]$. These type expressions agree by the capture-avoiding substitution-composition law, applied to their term and type syntax. Distribution of substitution through application identifies their term expressions. Conversion therefore places both at the same stated type.]

#example[Specializing a dependent identity][Let $B:A->U_0$ and define $f=lambda x.lambda y.y$. Its type is $Pi_(x:A)(B(x)->B(x))$. Applying it to $a:A$ gives a function on $B(a)$, not on an arbitrary fixed $B$. Applying that result to $b:B(a)$ computes to $b$.]

Every step can be read from the result type: first substitute $a$ into the family, then use the resulting function domain. In a dependent derivation, exchanging declarations is legal only when it preserves these formation dependencies. The ordinary simple-type exchange rule cannot be copied without checking them.

#checkpoint("5.1", [Why is the context $n:"Nat",v:"Vec"(A,n)$ not freely reorderable?], [The type of $v$ mentions $n$, so $n$ must be declared before that type can be formed.])
#takeaways[Every elimination rule must show the result's exact dependent type. Suppressing the substitution there hides the main mathematical content.]
#study-links("U5")

== Lecture 10 · Dependent sums and constructive witnesses
#focus[Use dependent pairs to package witnesses with evidence, type their projections, and derive a constructive choice principle.]

*Recall and approach.* Recall products and existential evidence; a Sigma pair stores its witness and the evidence in that witness’s fiber.


#definition[Dependent sum][From a type $A$ and family $B(x)$, form $Sigma_(x:A)B(x)$. A pair $(a,b)$ has this type when $a:A$ and $b:B(a)$. Its projections satisfy $"fst"(p):A$ and $"snd"(p):B("fst"(p))$, with computation rules $"fst"(a,b) equiv a$ and $"snd"(a,b) equiv b$.]

The dependent elimination rule allows a family $C(p)$ over such pairs. To define a term of $C(p)$ for arbitrary $p$, it suffices to give $d(a,b):C((a,b))$ for arbitrary $a:A,b:B(a)$. The eliminator computes on a constructed pair by returning $d(a,b)$. This is stronger than merely projecting components because the output type itself may depend on the whole pair.

#example[Existence includes a witness][A term of $Sigma_(n:"Nat")P(n)$ contains an actual natural number and evidence of the property at that number. The type $Sigma_(n:"Nat")"Vec"(A,n)$ packages a finite sequence with its length. It is different from fixing $n$ first and asking for a vector of that prescribed length.]

#strategy[Construct the witness function by first projection and its evidence by second projection, then check the dependent conversion.]

#theorem[Constructive dependent choice of witnesses][There is a term of
$ (Pi_(x:A) Sigma_(y:B(x)) C(x,y)) -> Sigma_(f:Pi_(x:A)B(x)) Pi_(x:A)C(x,f(x)). $
It is constructed without adding a classical choice axiom.]
#proof[Given $h$, define $f=lambda x."fst"(h(x))$ and $p=lambda x."snd"(h(x))$. The second projection has type $C(x,"fst"(h(x)))$, which converts to $C(x,f(x))$ by the beta rule for $f$. Therefore $(f,p)$ inhabits the required dependent sum. Every witness is extracted from the supplied constructive evidence $h(x)$, rather than chosen from a bare existence assertion with erased witnesses.]

This illustrates why translating a theorem into types requires attention to the chosen interpretation of existence. The input is already a uniform function returning witness–proof pairs. A classical statement about arbitrary nonempty sets does not automatically provide that computational data.

#theorem[Dependent pair extensionality, propositional form][Every $p:Sigma_(x:A)B(x)$ can be proved equal, in the identity type introduced next, to the reconstructed pair $("fst"p,"snd"p)$.]
#proof[Use dependent elimination on $p$. In the constructor case $p=(a,b)$, both projections compute and the reconstructed pair becomes $(a,b)$. Reflexivity therefore supplies the equality proof. This proves a propositional eta law without adopting it as judgmental equality.]

#example[A common-witness obstruction][From $Sigma_(x:A)(B(x) times C(x))$, one can extract two Sigma terms with the same witness. The reverse construction does not follow from two arbitrary Sigma terms: their witnesses may differ. In a set interpretation with $A=\{0,1\}$, let $B$ be inhabited only at zero and $C$ only at one. Both separate existence types are inhabited, while the common-witness type is empty.]

This is a useful diagnostic for an attempted proof: write the first components of the supplied pairs before trying to combine their second components. A mismatch of witnesses is a mathematical missing hypothesis, not a typographical inconvenience.

#checkpoint("5.2", [Why is the second projection's type not simply a fixed type $B$?], [It is the fiber $B("fst"p)$ and therefore depends on the first component.])

#pagebreak()
=== A slower route through the central ideas

#example[Applying an indexed identity in two stages][
Assume $A:U_0$ and $B:A->U_0$. In context $x:A,y:B(x)$, the variable rule gives $y:B(x)$. Abstracting y gives $lambda y.y:B(x)->B(x)$; abstracting x gives $f:Pi_(x:A)(B(x)->B(x))$. Given $a:A$ and $b:B(a)$, dependent application first gives $f(a):B(a)->B(a)$ and then $f(a)(b):B(a)$. Beta computation returns b. The first input changes the domain expected by the second application.
]
#inference([$Gamma tack.r f:Pi_(x:A)(B(x)->B(x)) quad Gamma tack.r a:A$],
[$Gamma tack.r f(a):B(a)->B(a)$], name: "First dependent application")
#inference([$Gamma tack.r f(a):B(a)->B(a) quad Gamma tack.r b:B(a)$],
[$Gamma tack.r f(a)(b):B(a)$], name: "Second application")

*Expanded substitution bookkeeping.* Under a context substitution sigma, a dependent application has type $(B[x:=a])[sigma]$. Substituting into the function first gives a family with the binder x retained fresh, written $B[sigma^+]$; applying to $a[sigma]$ then gives $B[sigma^+][x:=a[sigma]]$. Capture-avoiding substitution composition identifies these two type expressions. It is not enough merely to note that the term syntax distributes as $(f a)[sigma]=f[sigma](a[sigma])$: the types must match as well.

#example[Unpacking and repacking a witness][
For $p:Sigma_(x:A)B(x)$, put $a="fst"(p)$ and $b="snd"(p)$. Their types are $a:A$ and $b:B(a)$, so the pair $(a,b)$ is well typed in the original sum. A function $h:Pi_(x:A)(B(x)->C)$ can consume this package as $h(a)(b):C$. On an input constructor $p=(u,v)$, the expression computes to $h(u)(v)$. This gives an explicit uncurrying operation without selecting a witness from an untagged existential claim.
]
*Expanded constructive-choice calculation.* Suppose $g:Pi_(x:A)Sigma_(y:B(x))C(x,y)$. Define $f=lambda x."fst"(g(x))$. Its type is $Pi_(x:A)B(x)$. The term $lambda x."snd"(g(x))$ has type $Pi_(x:A)C(x,f(x))$, since f(x) computes to the first projection of g(x). Pairing these terms constructs the claimed choice data. No external choice principle is used: g already provides a witness and its evidence uniformly for each x.

*A failed shortcut.* The second projection of p is not a term of a fixed type independent of p. Nor do constructor computation rules alone imply a judgmental eta equality for an arbitrary function or record variable. State which equality is being claimed.

#takeaways[Dependent sums package data and its specification. Optional Lab 3 uses indexed data to make length information part of the type.]
#study-links("U5")
