#let navy = rgb("183b53")
#let teal = rgb("247a79")
#let pale = rgb("edf4f5")
#let triangleleft = $◁$
#let notin = $∉$
#let coproduct = $∐$
#let compose = $∘$
#let oplus = $⊕$
#let bigoplus = math.op("⨁", limits: true)
#let otimes = $⊗$
#let wedge = $∧$
#let FV = math.op("FV")
#let SN = math.op("SN")
#let iso = $≅$
#let inference(premises, conclusion, name: "") = align(center)[
  #table(columns: 1, align: center, inset: 5pt, stroke: none,
    table.cell(stroke: (bottom: 0.6pt + navy), premises), conclusion)
  #text(size: 9pt, fill: navy)[#name]
]
#let book(code: "", title: "", subtitle: "", body) = {
  set document(title: code + " | " + title, author: "Independent mathematics study series", keywords: (code, "mathematics", "self-study"))
  set page(paper: "a4", margin: (x: 23mm, top: 22mm, bottom: 23mm), numbering: "1", header: context {
    if counter(page).get().first() > 1 { text(size: 8pt, fill: navy)[#code #h(1fr) #title] }
  })
  set text(font: "Libertinus Serif", size: 11pt, lang: "en")
  set par(justify: true, leading: 0.55em)
  set math.equation(numbering: "(1.1)")
  set heading(numbering: "1.1")
  show heading.where(level: 1): it => { pagebreak(weak: true); v(5mm); text(size: 21pt, fill: navy, weight: "bold", it); v(3mm) }
  show heading.where(level: 2): it => { v(2mm); text(size: 14pt, fill: navy, weight: "bold", it); v(1mm) }
  show heading.where(level: 3): it => text(size: 11pt, fill: teal, weight: "bold", it)
  show link: set text(fill: navy)
  align(center)[
    #v(32mm)
    #text(size: 14pt, tracking: 1.2pt, fill: teal)[MATHEMATICS / INDEPENDENT STUDY]
    #v(14mm)
    #text(size: 32pt, weight: "bold", fill: navy)[#code]
    #v(7mm)
    #text(size: 25pt, weight: "bold")[#title]
    #v(9mm)
    #text(size: 15pt)[#subtitle]
    #v(18mm)
    #line(length: 65%, stroke: 1pt + teal)
    #v(8mm)
    Original teaching material aligned with Stockholm University course descriptions.\
    Independently authored; not an official university publication.
    #v(10mm)
    Edition 2 · 25 October 2026
  ]
  pagebreak()
  outline(title: [Contents], depth: 2)
  body
}

#let statement(kind, title, body) = figure(
  align(left, block(width: 100%, inset: (left: 9pt, right: 9pt, top: 7pt, bottom: 7pt), fill: pale, stroke: (left: 2pt + teal))[
    #text(weight: "bold", fill: navy)[#kind #context counter(figure.where(kind: kind)).display("1") · #title] #linebreak() #body
  ]), kind: kind, supplement: kind, numbering: "1", caption: none,
)
#let definition(title, body) = statement("Definition", title, body)
#let theorem(title, body) = statement("Theorem", title, body)
#let example(title, body) = statement("Example", title, body)
#let proof(body) = [*Proof.* #body #h(1fr) $square$]
#let strategy(body) = [*Proof strategy.* #body]
#let focus(body) = block(inset: 8pt, stroke: 0.5pt + teal, radius: 2pt, width: 100%)[*Learning goals and prerequisites*\ #body]
#let checkpoint(id, question, answer) = [
  #block(inset: 7pt, fill: rgb("f5f5f2"), width: 100%)[*Checkpoint #id.* #question]
  #metadata((kind: "checkpoint", id: id, question: question, answer: answer))
]
#let takeaways(body) = [*Takeaways.* #body]
#let study-links(unit) = block(above: 5pt, below: 6pt)[
  #text(size: 9pt)[Continue with #link("../2.%20Learning%20Material/handbook.pdf")[study guide #unit] and #link("../3.%20Exercises/exercises.pdf")[exercise sheet #unit].]
]
#let warning(body) = [*Watch for this.* #body]
#let exercise(id: "", level: "E", objective: "", minutes: 15, question: [], hint1: [], hint2: [], solution: [], idea: none, criteria: [], optional: false) = (
  id: id, level: level, objective: objective, minutes: minutes, question: question,
  hint1: hint1, hint2: hint2, solution: solution, idea: idea, criteria: criteria, optional: optional,
)
#let render-exercises(items, mode: "questions") = {
  set par(spacing: 0.5em)
  show heading.where(level: 3): set block(above: 0.7em, below: 0.3em)
  for (index, ex) in items.enumerate() {
    if mode != "solutions" and (ex.optional or (index > 0 and calc.rem(index, 6) == 0)) { pagebreak(weak: true) }
    // Solution bodies flow across pages; keep each question with its heading.
    block(breakable: mode == "solutions", {
    let opening() = {
    [#heading(level: 3, numbering: none)[#ex.id · #ex.level · #ex.minutes min#if ex.optional [ · Optional challenge]]#label(ex.id)]
    text(size: 9pt, fill: navy)[Learning objective: #ex.objective]
    parbreak()
    ex.question
    }
    if mode == "solutions" { block(breakable: false, sticky: true, opening()) } else { opening() }
    if mode == "hints" {
      parbreak(); [*Hint 1 — a starting point.* #ex.hint1]; parbreak()
      [*Hint 2 — the key move.* #ex.hint2]
    } else if mode == "solutions" {
      if ex.idea != none { parbreak(); [*Decisive idea.* #ex.idea] }
      parbreak()
      block(breakable: true)[
        #ex.solution
        #linebreak()
        *Check your argument.* #ex.criteria
      ]
    }
    })
    if mode == "solutions" { v(8pt) } else { v(1fr) }
  }
}
#let diagram-square(a, b, c, d, top, left, right, bottom) = align(center)[
  #grid(columns: (auto, 24mm, auto), rows: (auto, 9mm, auto), align: center + horizon,
    a, [$arrow.r$ #top], b,
    [$arrow.b$ #left], [], [$arrow.b$ #right],
    c, [$arrow.r$ #bottom], d)
]
#let problem(n, level, objective, question, hint1, hint2, solution, criteria, code: "", unit: "", minutes: auto, optional: false, idea: none) = exercise(
  id: code + "-" + unit + "." + (if n < 10 { "0" } else { "" }) + str(n), level: level, objective: objective,
  minutes: if minutes == auto { if unit.starts-with("M") { (E: 15, C: 30, A: 40).at(level) } else { (E: 15, C: 30, A: 50).at(level) } } else { minutes },
  question: question, hint1: hint1, hint2: hint2, solution: solution, idea: idea, criteria: criteria, optional: optional,
)

#let workload(items) = {
  let core = items.filter(ex => not ex.optional).map(ex => ex.minutes).sum()
  let extra = items.filter(ex => ex.optional).map(ex => ex.minutes).sum()
  [Core exercise attempts: *#core minutes*. Optional challenge attempt: *#extra minutes*, plus approximately 30 minutes for review.]
}
