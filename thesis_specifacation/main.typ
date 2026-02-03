#set text(size: 12pt)
#set page(
  paper: "a4",
  margin: 4cm,
  header: [
      #align(left)[Uppsala University]
       // 12 Digits
    #line(length: 100%, stroke: 0.5pt)
  ],
  footer: [
    #line(length: 100%, stroke: 0.5pt)
    #grid(
      columns: (1fr, 0.5fr, 1fr),
      align: (left,center, right),
      [],
      [#context counter(page).display()],
      [Student Personnummer]
    )
  ],
)

#set text(
  font: "Libertinus Serif",
  size: 12pt,
  lang: "en",
)

#set document(title: "Master Thesis Specification")

// Title Page
#align(center)[
  #image("../dependencies/logo.svg", width: 30%)

  #v(1cm)

  #text(size: 14pt)[MASTER THESIS SPECIFICATION] // Change to Bachelor if applicable

  #v(0.5cm)

  #line(length: 100%, stroke: 1.2pt)
  #text(size: 14pt, weight: "bold")[Title]
  #line(length: 100%, stroke: 1.2pt)

  #v(0.5cm)
]

#grid(
  columns: (1fr, 1fr),
  align: (left, right),
  [
    _Student:_ \
    Name \
    Email \
    Signature
  ],
  [
    _Supervisor:_ \
    Name \
    Email \
    Signature
  ]
)

#v(0.5cm)

#align(left)[
  _Subject Reviewer:_ \
  Name \
  Email \
  Signature
]

#v(0.2cm)

#align(center)[
  #text(size: 14pt, weight: "bold")[Department of Information Technology]

  #datetime.today().display("[month repr:long] [day], [year]")
]

#pagebreak()

// Table of Contents
#outline(indent: auto)

#pagebreak()

= Title
= Abstract
= Background
= Description of Tasks
= Methods
= Relevant Courses
= Delimitations
= Time Plan

#bibliography("refs.yml", style: "ieee")