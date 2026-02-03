// Author: Oskar Perers
//
// Inspiration from:
// Provided template as well as
// https://github.com/independent-project-in-it-uu-2021/rapport-mall
// and
// https://www.overleaf.com/latex/templates/mall-kandidatarbete-i-teknisk-fysik-uppsala-universitet/hcvpscsrypvt

// DRAFT VERSION
// Change to false for final version
#let DRAFT = true


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

#if DRAFT {
  text[
    *NOTE:* For updated instructions, please refer to the latest guidelines.
  ]
}

= Title
#include "text/title.typ"

= Abstract
#include "text/abstract.typ"

= Background
#include "text/background.typ"

= Description of Tasks
#include "text/description.typ"

= Methods
#include "text/method.typ"

= Relevant Courses
#include "text/relevant_courses.typ"

= Delimitations
#include "text/delimitations.typ"

= Time Plan
// Create your own time plan, instructions are included in the appendix tips.

#pagebreak()
#bibliography("refs.yml", style: "ieee")

#if DRAFT {
  include "../dependencies/appendix_tips.typ"
}