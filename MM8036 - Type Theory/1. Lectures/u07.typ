#import "/shared/book.typ": *
= Unit 7 · Substitutions and semantics

== Lecture 13 · Explicit substitutions as context morphisms
#focus[Represent simultaneous substitutions as typed objects, compose them in the correct direction, and explain substitution into dependent families.]

*Recall and approach.* Recall simultaneous substitutions supply every declaration of the target context in order.


So far substitution has been a metalevel operation on syntax. Making substitutions explicit exposes the bookkeeping needed for implementation and categorical semantics. We use a typed substitution interface with equations, not a claim that every possible explicit-substitution rewrite system is confluent or terminating.

#definition[Context substitution][For $Gamma=(x_1:A_1,dots,x_n:A_n)$, a substitution $sigma:Delta -> Gamma$ is a tuple $(t_1,dots,t_n)$ with $Delta tack.r t_1:A_1$ and $Delta tack.r t_i:A_i[t_1/x_1,dots,t_(i-1)/x_(i-1)]$. It interprets every variable of $Gamma$ by a term in $Delta$.]

The arrow direction can initially feel reversed: a map from environments in $Delta$ to environments in $Gamma$ supplies values for all variables of $Gamma$. Pulling a type or term back along it goes from syntax over $Gamma$ to syntax over $Delta$.

#definition[Identity and composition][The identity substitution lists the context's own variables. Given $rho:Theta -> Delta$ and $sigma:Delta -> Gamma$, define $sigma compose rho:Theta -> Gamma$ by substituting $rho$ into each component of $sigma$. Write $t[sigma]$ for the resulting simultaneous substitution into a term, and similarly for types.]

#strategy[Check equations componentwise and lift substitutions under binders by retaining the new bound variable.]

#definition[Projection and extension of substitutions][For the extended context $Gamma dot A$, the projection substitution $p:Gamma dot A->Gamma$ lists the old variables and forgets the last one. The generic term $q:A[p]$ is that last variable. Given $sigma:Delta->Gamma$ and $t:A[sigma]$ over $Delta$, append $t$ to the tuple $sigma$ to obtain $chevron.l sigma,t chevron.r:Delta->Gamma dot A$. Dropping its last component recovers $sigma$, and looking up its last variable recovers $t$. These are the explicit tuple operations behind comprehension in Unit 8.]

#theorem[Substitution laws][Capture-avoiding simultaneous substitution satisfies $t["id"] equiv t$ and $t[sigma][rho] equiv t[sigma compose rho]$, with analogous equations for types. These give associative substitution composition and identity laws, up to judgmental equality.]
#proof[Induct on syntax, renaming binders fresh as necessary. Variables reduce the statements to lookup and the definition of componentwise composition. Application follows from the induction hypotheses on its parts. Under a binder, extend the substitution by mapping the freshly bound variable to itself; the single-variable composition lemma proves compatibility with that extension. Dependent constructors require the same argument simultaneously for their term and type components. Composition of substitutions is associative because each of its components satisfies this substitution equation; identity laws follow from variable lookup.]

#example[A dependent tuple][Suppose $Gamma=(n:"Nat",v:"Vec"(A,n))$. A substitution from an empty context can supply a numeral $k$ and a closed vector $w:"Vec"(A,k)$. An arbitrary vector with a different length is not a valid second component. Applying another substitution to a context containing $A$ must substitute into $A$, $k$, and $w$ consistently.]

An implementation may store the suspended expression $t[sigma]$ rather than traverse $t$ immediately. Its rules include variable lookup, distribution through application, and binder lifting. The equations above specify the intended behavior. Adding a reduction rule that reassociates substitutions in both directions could obviously create loops; a concrete implementation must choose orientations and prove its own metatheory.

#example[Composition with a dependent tuple][Suppose a substitution into $n:"Nat",v:"Vec"(A,n)$ supplies terms $k,w$ over a context $Delta$. Applying $rho:Theta->Delta$ produces $k[rho]$ and $w[rho]$. The latter has type $"Vec"(A[rho],k[rho])$, so both the index and the element type must be reindexed. Keeping the old $k$ while substituting only into $w$ would generally be ill typed.]

This bookkeeping explains the direction of context arrows: a substitution into a context is a way to provide its variables. Reindexing its types and terms therefore travels back along that arrow. Draw the arrow directions before expanding a nested substitution.

#checkpoint("7.1", [If $sigma:Delta -> Gamma$ and $rho:Theta -> Delta$, in which context does $t[sigma][rho]$ live when $t$ originally lives in $Gamma$?], [It lives in $Theta$ and equals substitution by $sigma compose rho$.])
#takeaways[Typed substitutions are the arrows between contexts. They make dependent-variable bookkeeping explicit and lead directly to semantic reindexing.]
#study-links("U7")

== Lecture 14 · Meaning explanations and a family-of-sets model
#focus[Explain canonical evidence, interpret contexts as environments, and prove soundness of the main universe-free rules.]

*Recall and approach.* Recall functions, indexed families of sets, and sections selecting one element in each appropriate fiber.


A meaning explanation describes what counts as an element of a type and when two such elements agree. A natural number is given canonically by zero or successor data; a pair by its two components; a function by its action on arbitrary inputs. Elimination rules explain how this evidence may be used, and computation rules explain what happens when an eliminator meets a constructor. This is a semantic motivation, not a substitute for the formal metatheorems of a particular calculus.

#definition[Family-of-sets interpretation][Interpret a context $Gamma$ as a set of environments. A type over it is a family of sets $A(gamma)$. A term is a section assigning $t(gamma) in A(gamma)$. Context extension is the set of pairs $(gamma,a)$ with $a in A(gamma)$. A substitution is a function between environment sets, and reindexing is composition: $A[sigma](delta)=A(sigma(delta))$.]

Interpret a dependent product at $gamma$ as the set of functions assigning to each $a in A(gamma)$ an element of $B(gamma,a)$. Interpret a dependent sum as the corresponding set of pairs. Interpret natural numbers by the ordinary natural-number set with recursion and induction. Interpret an identity type as a singleton when its endpoints are equal and as the empty set otherwise.

#strategy[Interpret each rule in environments and prove its computation equation by evaluating the corresponding semantic construction.]

#theorem[Soundness of the universe-free rules][Valid typing derivations in the described fragment denote elements of their interpreted types; judgmental equalities denote equal elements or equal families.]
#proof[Proceed by simultaneous induction on derivations. A variable is an environment projection. Abstraction maps each environment to the function given by the body section, and application evaluates it, so the beta equation is literal function evaluation. Pairing forms a member of the dependent sum, and projections recover its components, proving their computation equations. Natural-number elimination is interpreted by ordinary recursion with the supplied motive and step, which satisfies the two recursion equations. For identity elimination, an inhabited identity fiber has equal endpoints and its unique proof, so define the interpretation by the supplied reflexive case; the $J$ computation follows. Substitution is composition with environment maps, so its laws follow from function composition. Conversion is valid because equal interpreted types have the same elements.]

This is a model of the universe-free fragment. Interpreting the entire universe hierarchy additionally requires externally chosen collections of small sets closed under the relevant operations; we do not pretend that the set of all sets is itself a set. The model also validates principles, such as uniqueness of identity proofs, that our intensional syntax does not adopt. Soundness only says derivable statements are valid in the model, not that every model-valid statement is derivable.

#example[An empty fiber distinguishes sums from products][Let the base set have two elements and let one fiber be empty while the other is a singleton. The dependent sum has one element, from the inhabited fiber. The dependent product is empty, because a section would have to select an element of the empty fiber as well.]

This interpretation mirrors existential and universal evidence: one successful witness is enough for a sum, whereas a product must work at every input. It also illustrates a reliable semantic counterexample method. To refute a proposed uniform constructive map, look for an interpretation in which its domain is inhabited and its codomain empty, then invoke soundness in the forward direction.

#checkpoint("7.2", [What is a term of a family $A(gamma)$ in this model?], [A section choosing an element of the appropriate fiber for every environment, not a single element shared by all fibers.])
#takeaways[Separate syntax, judgmental equality, internal identity types, and semantic equality. The set model helps calculate meanings while illustrating that a model may identify more than the syntax does.]
#study-links("U7")
