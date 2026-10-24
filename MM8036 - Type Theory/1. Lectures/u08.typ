#import "/shared/book.typ": *
= Unit 8 · Categorical models and proof assistants

== Lecture 15 · Products, exponentials, and comprehension
#focus[Interpret simple types in a Cartesian closed category and describe the extra structure needed for dependent types.]

*Recall and approach.* Recall products, functions between sets, and reindexing of a family along a context map.


The categorical concepts needed here are introduced within this lecture. A terminal object admits one map from every object. A product $A times B$ represents pairs of maps into $A,B$. An exponential $B^A$ represents maps out of a product through a natural bijection $cal(C)(X times A,B) equiv cal(C)(X,B^A)$. A category with finite products and such exponentials is Cartesian closed.

#definition[Simple-type interpretation][Interpret base types as objects, function types as exponentials, and a context as a finite product. A judgment $Gamma tack.r t:A$ denotes a morphism from the context object to the type object. Variables are projections, abstraction is exponential transposition, and application uses evaluation after pairing the function and argument maps.]

#strategy[Use evaluation and currying for simple beta soundness; prove comprehension by checking and uniquely determining both coordinates.]

#theorem[Beta soundness in a Cartesian closed category][The interpretation of a beta contraction is an equality of morphisms.]
#proof[If the body denotes $b:Gamma times A -> B$, abstraction denotes its transpose $Lambda(b):Gamma -> B^A$. Applying this function to an argument $u:Gamma -> A$ denotes $"ev" compose chevron.l Lambda(b),u chevron.r$. The defining transpose/evaluation equation makes this equal to $b compose chevron.l 1_Gamma,u chevron.r$, which is exactly the interpretation of substituting $u$ into the body.]

The exponential universal property also validates function eta semantically. Our minimal paper syntax need not make eta a judgmental rule; the model may satisfy additional equalities. This is another reason not to read semantic equality backward as a derivation principle.

Dependent types require a category of contexts together with types and terms over each context, reindexing along substitutions, and context extension. A convenient formulation is a category with families. Its comprehension property can be described without additional machinery.

#definition[Context comprehension][For a type $A$ over $Gamma$, the extended context $Gamma dot A$ has a projection $p:Gamma dot A -> Gamma$ and a generic term $q:A[p]$. For every substitution $sigma:Delta -> Gamma$ and term $t:A[sigma]$ in $Delta$, there is a unique pairing $chevron.l sigma,t chevron.r:Delta -> Gamma dot A$ with $p compose chevron.l sigma,t chevron.r=sigma$ and $q[chevron.l sigma,t chevron.r]=t$.]

#theorem[Comprehension in families of sets][The environment interpretation from Lecture 14 has this property.]
#proof[The extended context is the set of pairs $(gamma,a)$. Projection forgets the second coordinate, and the generic term returns it. Given $sigma,t$, define the pairing by $delta|->(sigma(delta),t(delta))$. The type of $t$ makes this a valid pair, and the two component equations hold. Any map with those equations has exactly these two coordinates and is therefore equal, proving uniqueness.]

Dependent products, sums, and identity types add further operations to this contextual structure, stable under reindexing. In the family model they are built fiber by fiber as in Lecture 14. More sophisticated models can retain richer identity information, but those developments are outside the chosen proof-assistant application.

#example[The empty context as a categorical unit][In the category of syntactic contexts and substitutions, a map into the empty context supplies an empty tuple and is unique. Thus the empty context is terminal. A closed term of a closed type is a map from this terminal context into its one-variable extension. In the set model, the empty context is interpreted by a singleton environment, and such a map selects one element of the interpreted type.]

The direction is worth checking: context morphisms provide the target variables, so the empty target is easiest to supply. This connects the “global elements are maps from one” idea from category theory with the distinction between closed terms and terms carrying assumptions.

#checkpoint("8.1", [Why is an ordinary Cartesian closed category alone insufficient to specify all dependent types?], [It models fixed types and function objects, but dependent types require families over varying contexts and coherent reindexing/comprehension data.])
#takeaways[Simple functions are modeled by exponentials; dependency is modeled by families and comprehension. Category Theory provides optional further practice with these universal properties.]
#study-links("U8")

== Lecture 16 · Formal proofs as checked programs
#focus[Translate paper derivations into Agda, interpret checker feedback mathematically, and distinguish verified code from unproved metatheory.]

*Recall and approach.* Recall introduction/elimination rules, structurally recursive induction, and transport between dependent fibers.


The four optional labs use a small common mathematical fragment. They define their own basic datatypes and need no external standard library. Completed solutions are checked with the project's pinned Agda release using safe mode and without the K principle. Starter files contain deliberately unfinished goals; only the completed solutions are expected to pass the verification script.

#example[From a theorem to a function][To prove $A -> B -> A$, write a function taking inputs of types $A,B$ and returning the first. To prove a natural-number identity, pattern-match on the number and use the recursively obtained equality. To preserve vector length, give a result type indexed by the same length. To change a dependent fiber along equality, use transport. Each technique corresponds to one of the preceding introduction or elimination rules.]

Lab 1 treats implication, products, sums, and absurd elimination. Lab 2 defines addition recursively and proves right-zero and associativity by induction. Lab 3 defines length-indexed vectors, mapping, and append with its result index. Lab 4 defines equality elimination operations and transport, showing the distinction between a computation that closes by reflexivity and a proof that must inspect equality evidence.

#definition[Verification contract][For a completed lab accepted under the recorded settings, its declarations have the stated types according to that Agda checker, including its termination, positivity, and universe checks.]
#block[This is the contract of the checking procedure, not an independent proof of the compiler's correctness. The project invokes the checker on the completed source files and records its successful exit status. Safe mode excludes the mechanisms used to assert an arbitrary theorem without a proof, and the files contain no unresolved goals. Thus the result is evidence for these concrete formal declarations under the stated trusted toolchain.]

#theorem[A vector program preserves identity][For every vector $v:"Vec"(A,n)$, there is a proof of $"Id"_("Vec"(A,n))("map"(lambda x.x,v),v)$.]
#strategy[Induct on the vector and lift the tail equality through the constructor with its head fixed.]
#proof[For nil, map computes to nil, so reflexivity supplies the required proof. For $v="cons"(a,w)$, map computes to $"cons"(a,"map"(lambda x.x,w))$. The induction hypothesis identifies the mapped tail with $w$ in its fixed length fiber. Congruence under $z mapsto "cons"(a,z)$ gives equality with $"cons"(a,w)$ in the successor-length fiber. These are all vector constructors. The completed Lab 3 includes this proof as `map-identity`, connecting each clause to this induction.]

When a term fails to check, inspect the expected type and the inferred type before changing the program. A vector-length mismatch often means a recursively defined addition expression has not reduced in the direction you expected. An equality goal that fails under reflexivity may require induction or transport. An unsolved implicit argument may mean the intended type is ambiguous rather than false.

#warning[Type checking a collection of examples does not prove normalization or consistency of the entire proof assistant. Our explicit normalization proof concerned the arrow-only simply typed core. The richer dependent theory and the checker require their own metatheoretic justification.]

For independent study, first solve each lab on paper, then fill the starter functions, then run the checker. Compare with the completed solution only after understanding the remaining goal. Keep the `.agda` files as executable companions; the lectures and exercises remain fully usable without installing an editor plugin.

#example[A checked theorem can still be the wrong theorem][If the intended goal is addition commutativity but the written type is reflexivity of $m+n$ with itself, a reflexivity proof checks without establishing commutativity. The remedy is to compare the encoded signature with the intended statement before reading the implementation. For vector append, inspect the length index; for a transport theorem, inspect both endpoint fibers; for a logical implication, inspect the order of its assumptions.]

The laboratory workflow therefore has three checks: verify the statement on paper, complete its proof term under the fixed rules, and explain the accepted clauses mathematically. Machine checking is strongest when paired with that semantic audit of what was actually asked.

#checkpoint("8.2", [Why should a proof with an unfilled hole not count as verified merely because the surrounding file parses?], [A hole represents a missing term of the required type. Parsing checks syntax, whereas successful checking of the completed file must resolve every proof obligation.])
#takeaways[The proof assistant makes the typing rules operational. Its most useful feedback is a precise statement of the mathematical obligation still missing.]
#study-links("U8")
