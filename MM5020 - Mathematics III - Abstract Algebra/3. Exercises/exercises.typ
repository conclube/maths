#import "/shared/book.typ": *
#show: book.with(code: "MM5020", title: "Mathematics III - Abstract Algebra", subtitle: "Exercises and mock assessments")
#v(8mm)
#text(size: 14pt, weight: "bold", fill: navy)[How to use this volume]
E problems practice definitions and standard arguments; C problems combine ideas; A problems require synthesis or generalization. These are study difficulty labels, not official SU grading criteria. Time estimates are guides, not deadlines. Write a complete attempt before opening hints. In the hints volume, read Hint 1 first and return to the problem before consulting Hint 2. Solutions give a decisive idea, a complete argument, and criteria for self-assessment.

= Unit 1 · Groups and cyclic structure
#import "u01.typ" as u1
#render-exercises(u1.items, mode: "questions")
= Unit 2 · Cosets and permutations
#import "u02.typ" as u2
#render-exercises(u2.items, mode: "questions")
= Unit 3 · Homomorphisms and quotients
#import "u03.typ" as u3
#render-exercises(u3.items, mode: "questions")
= Unit 4 · Actions and simple groups
#import "u04.typ" as u4
#render-exercises(u4.items, mode: "questions")
= Unit 5 · Rings and their quotients
#import "u05.typ" as u5
#render-exercises(u5.items, mode: "questions")
= Unit 6 · Polynomials and factorization
#import "u06.typ" as u6
#render-exercises(u6.items, mode: "questions")
= Unit 7 · Fields as vector spaces
#import "u07.typ" as u7
#render-exercises(u7.items, mode: "questions")
= Unit 8 · Finite fields and applications
#import "u08.typ" as u8
#render-exercises(u8.items, mode: "questions")
= Mock assessment 1
Allow 180 minutes. Attempt all six problems and explain every inference. Use the rubric in the handbook for self-assessment; this is original practice, not an official examination.
#import "mock1.typ" as m1
#render-exercises(m1.items, mode: "questions")
= Mock assessment 2
Allow 180 minutes. Attempt all six problems and explain every inference. Use the rubric in the handbook for self-assessment; this is original practice, not an official examination.
#import "mock2.typ" as m2
#render-exercises(m2.items, mode: "questions")
