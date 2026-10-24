#import "/shared/book.typ": *
#show: book.with(code: "MM8036", title: "Type Theory", subtitle: "Complete solutions")
#v(8mm)
#text(size: 14pt, weight: "bold", fill: navy)[How to use this volume]
E problems practice definitions and standard arguments; C problems combine ideas; A problems require synthesis or generalization. These are study difficulty labels, not official SU grading criteria. Time estimates are guides, not deadlines. Write a complete attempt before opening hints. In the hints volume, read Hint 1 first and return to the problem before consulting Hint 2. Solutions give a decisive idea, a complete argument, and criteria for self-assessment.

= Unit 1 · Binding and substitution
#import "u01.typ" as u1
#render-exercises(u1.items, mode: "solutions")
= Unit 2 · Reduction and confluence
#import "u02.typ" as u2
#render-exercises(u2.items, mode: "solutions")
= Unit 3 · Simple types and judgments
#import "u03.typ" as u3
#render-exercises(u3.items, mode: "solutions")
= Unit 4 · Normalization and constructive logic
#import "u04.typ" as u4
#render-exercises(u4.items, mode: "solutions")
= Unit 5 · Dependent types
#import "u05.typ" as u5
#render-exercises(u5.items, mode: "solutions")
= Unit 6 · Induction, identity, and universes
#import "u06.typ" as u6
#render-exercises(u6.items, mode: "solutions")
= Unit 7 · Substitutions and semantics
#import "u07.typ" as u7
#render-exercises(u7.items, mode: "solutions")
= Unit 8 · Categorical models and proof assistants
#import "u08.typ" as u8
#render-exercises(u8.items, mode: "solutions")
= Mock assessment 1
Allow 180 minutes. Attempt all six problems and explain every inference. Use the rubric in the handbook for self-assessment; this is original practice, not an official examination.
#import "mock1.typ" as m1
#render-exercises(m1.items, mode: "solutions")
= Mock assessment 2
Allow 180 minutes. Attempt all six problems and explain every inference. Use the rubric in the handbook for self-assessment; this is original practice, not an official examination.
#import "mock2.typ" as m2
#render-exercises(m2.items, mode: "solutions")
