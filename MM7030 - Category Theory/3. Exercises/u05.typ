#import "/shared/book.typ": *
#let p = problem.with(code: "MM7030", unit: "U5")
#let items = (
 p(1,"E","U5.1 Equalizers",[Find the equalizer in sets of $f,g:ZZ -> ZZ$, $f(n)=n^2,g(n)=n$.],[Solve the equality of the two values.],[The equation is $n(n-1)=0$.],[The equalizer is the inclusion $\{0,1\} -> ZZ$. Any function whose composites with $f,g$ agree has all values in this subset and factors uniquely through its inclusion.],[Give the structural map and universal factorization.]),
 p(2,"E","U5.1 Pullbacks",[Find the pullback of $f:ZZ -> ZZ$, $f(a)=2a$, and $g:ZZ -> ZZ$, $g(b)=3b$, in sets.],[Solve $2a=3b$.],[Coprimality implies $a=3k,b=2k$.],[The pullback is the set $\{(3k,2k):k in ZZ\}$ with coordinate projections. It can be identified with $ZZ$ by $k |-> (3k,2k)$. Compatibility of any pair of functions forces each value to be such a pair, giving the unique mediator.],[Distinguish the abstract apex from its two projection maps.]),
 p(3,"E","U5.2 Coequalizers",[In sets, coequalize the two maps from a singleton to $\{a,b,c\}$ selecting $a$ and $b$.],[Identify only what the maps force.],[The equivalence classes are $\{a,b\}$ and $\{c\}$.],[The coequalizer is the quotient onto the classes $\{a,b\}$ and $\{c\}$. A map from $\{a,b,c\}$ coequalizes the pair exactly when its values at $a,b$ agree, exactly the condition for a unique map from this quotient.],[Describe the factorization condition.]),
 p(4,"E","U5.1 Empty diagrams",[Explain why a limit of the empty diagram is terminal and a colimit is initial.],[There is one empty family of maps for every apex.],[The mediator must therefore be unique for every object.],[A cone over the empty diagram has no structural arrows or compatibility conditions. Its universal property asks for a unique arrow from each object to the chosen apex, which is terminality. Reversing arrows gives initiality for the colimit.],[Explain why no extra cone data remain.]),
 p(5,"C","U5.1 Equalizers are monic",[Prove an equalizer arrow is monic using only its universal property.],[Consider two maps with the same composite through the equalizer.],[They are mediators of the same equalizing arrow.],[For equalizer $e:E -> A$, if $e u=e v$, this common composite equalizes the original pair. Both $u,v$ factor it through $e$, so uniqueness of the factorization yields $u=v$.],[Do not assume the category has elements.]),
 p(6,"C","U5.1 Pullbacks of monos",[Prove a pullback of a monomorphism is monic.],[Use the two projections to compare arrows into the pullback.],[Cancel the original monomorphism to obtain equality of the other projected composites.],[Let the pullback square have $p:P -> A,q:P -> B$, with $f:A -> C$ monic and $f p=g q$. If $q u=q v$, then $f p u=g q u=g q v=f p v$, so $p u=p v$. Both projected composites now agree, and pullback uniqueness gives $u=v$. Thus $q$ is monic.],[Identify which projection is the pullback of the given mono.]),
 p(7,"C","U5.2 Linear coequalizers",[Prove the coequalizer of linear maps $f,g:V -> W$ is $W slash "im"(f-g)$.],[A linear map coequalizes exactly when it kills the difference.],[Use the universal property of a quotient vector space.],[For $h:W -> X$, the condition $h f=h g$ is equivalent to $h(f-g)=0$, hence to $"im"(f-g) subset.eq ker h$. This is exactly the condition for a unique linear factor through the quotient map. Thus the quotient has the coequalizer property.],[Prove the equivalence of the equations and the kernel condition.]),
 p(8,"C","U5.2 Pushout of sets",[Compute the pushout of inclusions $\{b\} -> \{a,b\}$ and $\{b\} -> \{b,c\}$ in sets.],[Start with a tagged disjoint union.],[Identify the two copies of $b$.],[The resulting set has three elements represented by $a,b,c$. The two inclusion maps agree on the common $b$. Any pair of maps from the original sets agreeing at $b$ determines one function on these three elements and conversely, proving universality.],[Begin with distinct tagged copies before imposing the identification.]),
 p(9,"C","U5.1 Limits in groups",[Show the equalizer of group homomorphisms $f,g:G -> H$ is a subgroup of $G$. Must it be normal?],[Test $a b^(-1)$ for elements with equal images.],[For failure of normality compare an inner automorphism with the identity.],[If $f(a)=g(a)$ and $f(b)=g(b)$, then $f(a b^(-1))=f(a)f(b)^(-1)=g(a)g(b)^(-1)=g(a b^(-1))$, proving subgroup closure. It need not be normal: in $S_3$, the equalizer of conjugation by $(12)$ and the identity is its centralizer $\{e,(12)\}$, which is not normal.],[Distinguish a general equalizer from a homomorphism kernel.]),
 p(10,"A","U5.1 Finite-limit construction",[Construct the pullback of $f:A -> C,g:B -> C$ using a product and an equalizer.],[Compare two arrows from $A times B$ to $C$.],[Equalize $f pi_A$ and $g pi_B$.],[Let $e:P -> A times B$ equalize $f pi_A,g pi_B:A times B->C$. The composites $pi_A e,pi_B e$ form a compatible square. A compatible pair $u:X -> A,v:X -> B$ gives a unique product map $chevron.l u,v chevron.r$ that equalizes the two maps, hence factors uniquely through $e$. This is precisely the pullback property.],[Use both universal properties in sequence and track uniqueness.]),
 p(11,"A","U5.2 Gluing may identify more",[Give a coequalizer in sets where the initially required identification pairs are not themselves transitive, and compute the actual quotient.],[Use maps from a two-element set.],[Require $a~b$ and $b~c$.],[Take $A=\{0,1\}$, $B=\{a,b,c\}$, with $f(0)=a,g(0)=b$ and $f(1)=b,g(1)=c$. The listed pairs do not include $a~c$, but any coequalizing function has $h(a)=h(b)=h(c)$. Thus all three elements must be identified, giving a singleton quotient.],[Explain why transitive closure is forced by equality in every target.]),
 p(12,
  "A",
  "U5.1 Pullback pasting",
  [Prove that two horizontally composable pullback squares have a pullback as their outer rectangle.],
  [Factor a compatible pair through the right square first.],
  [Then use the left square; reverse this reasoning for uniqueness.],
  [*Finding the approach.* Introduce a general test object and solve its compatibility equations one square at a time. The order matters: the right square supplies the intermediate data needed by the left.

*Argument.* Given maps to the outer lower-left and upper-right corners whose composites to the lower-right agree, compose the first map to the lower-middle corner. The right pullback gives a unique map to the upper-middle corner. Its compatibility with the lower-left map is now exactly the hypothesis for the left pullback, yielding a map to the upper-left corner. Any outer mediator must give the same middle map by right-square uniqueness and then the same left map by left-square uniqueness. Thus the outer square is a pullback.

Name the top row $A -> B -> C$ and the bottom row $D -> E -> F$. Given $x:T -> D$ and $z:T -> C$ with equal composites into $F$, the right square yields $y:T -> B$ with lower composite equal to the image of $x$ in $E$ and right composite $z$. The left square then yields $w:T -> A$ with projections $x,y$. For uniqueness, any competing $w'$ has a $B$-composite solving the same right-square problem, so it equals $y$; left-square uniqueness then gives $w'=w$.

*A tempting dead end.* Proving that the outside rectangle commutes establishes only a cone, not a universal cone. Omitting uniqueness is a common incomplete proof.

*Hypotheses.* Both inner squares are pullbacks and the two rows compose in the indicated direction. The result does not assert that an arbitrary factor of a pullback rectangle is a pullback.],
  [Specify the order of the two factorizations and both uniqueness steps.],
  idea: [Factor the universal mapping problem through the shared edge and apply uniqueness in the same order.]),
 p(13,
  "A",
  "U5 Transfer: Compatible integer measurements",
  [Fix a positive integer $n$. Find an abelian group $P$ and maps $p,q:P -> ZZ$ with $p$ congruent to $2q$ modulo $n$, such that every pair $f,g:A -> ZZ$ with this congruence factors uniquely through $p,q$. Give a basis for $P$.],
  [Describe a pair of compatible integers by their difference $x-2y$.],
  [Write $(x,y)=(n k+2y,y)$.],
  [*Finding the approach.* Translate the congruence into an exact equation with an extra integer. That parameter should both describe the universal object and give its basis.

*Argument.* Let $P=\{(x,y) in ZZ^2:n | (x-2y)\}$, a subgroup under coordinatewise addition, and take coordinate projections. Given $f,g$, the only possible mediator is $h(a)=(f(a),g(a))$. The congruence ensures it lands in $P$; the coordinate formulas show it is a homomorphism. Its two projections prescribe every value, proving uniqueness. Each element of $P$ is uniquely $k(n,0)+y(2,1)$ because $k=(x-2y)/n$ is an integer. Thus the two displayed vectors form a basis and $P iso ZZ^2$. Under these coordinates $p(k,y)=n k+2y$ and $q(k,y)=y$.

*A tempting dead end.* Choosing $P=ZZ^2$ with its standard projections ignores the congruence. Choosing only the pairs $(2y,y)$ imposes equality and excludes legitimate multiples of $n$.

*Hypotheses.* The positive integer $n$ ensures the integer parameter is unique. The universal property quantifies over all abelian groups $A$, not only over individual integer pairs.],
  [Prove closure, both existence and uniqueness of mediation, and independence of the two basis vectors.],
  optional: true,
  minutes: 60,
  idea: [Parametrize the compatibility equation and verify that the resulting parameterization respects all test maps.]),
)
