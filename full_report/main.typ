// Author: Oskar Perers
//
// Inspiration from:
// https://github.com/independent-project-in-it-uu-2021/rapport-mall
// https://www.overleaf.com/latex/templates/mall-kandidatarbete-i-teknisk-fysik-uppsala-universitet/hcvpscsrypvt

// DRAFT VERSION
// Change to false for final version
#let DRAFT = true

// =====================
// Imports
// =====================
#import "@preview/abbr:0.3.0"
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "../full_report/uppsala_thesis.typ": *

// =====================
// Document setup
// =====================
#show: codly-init.with()
#codly(languages: codly-languages)


#set text(
  font: "Roboto", // If you don't have it Roboto is stored in dependencies. You might have to install static version for Typst to work
  size: 12pt,
  lang: "en", // Typst webapp does not support all languages. Look it up if needed and run locally if necessary for spellchecking.
  overhang: false,
)

//If you don't want underlined links, comment out the next line:
#show link: underline
// #show link: set text(blue)

#set enum(
  indent: 12pt,
  spacing: 18pt,
)
#show enum: block.with(
  above: 30pt,
  below: 30pt,
)
#show list: block.with(
  above: 30pt,
  below: 30pt,
)
#set par(
  justify: true,
)
#show heading: block.with(
  above: 30pt,
  below: 30pt,
)

// If you don't want italics for references, comment out the next line:
#show ref: it => emph(it)

// Customize references to show "Appendix" for labels starting with "app:"
#show ref.where(
  form: "normal",
  supplement: auto,
): set ref(
  supplement: it => {
    if "app:" in str(it.label) {
      "Appendix"
    } else {
      it.supplement
    }
  },
)

// Equetion numbering style
#set math.equation(numbering: "(1)")

// Customize figures
#show figure: it => {
  block(
    above: 24pt,
    below: 24pt,
  )[
    // Top rule
    #line(length: 100%, stroke: 0.8pt)
    #v(-12pt)

    // Figure body (image / table / etc.)
    #it.body

    // Rule above caption
    #v(-12pt)
    #line(length: 100%, stroke: 0.8pt)
    #v(-10pt)

    // Caption
    #if (it.caption != none) {
      [
        #align(left)[
          #it.caption
        ]

        // Botom rule
        #v(-10pt)
        #line(length: 100%, stroke: 0.8pt)
      ]
    }
  ]
}

// Customize caption style for figure captions
#show figure.caption: it => [
  #text(weight: "bold")[
    #it.supplement #it.counter.display(it.numbering)
    ~]#it.body
]

// Set spacing in TOC between top-level entries
#show outline.entry.where(
  level: 1,
): set block(above: 24pt)

// Bold top-level entries in TOC
#show outline.entry.where(
  level: 1,
): set text(weight: "bold")

// =====================
// Metadata (from UppsalaExjobb)
// =====================
#let today = datetime.today().display("[month repr:long], [year]")
#let cfg = thesis-config(
  title: "Your Fancy Title",
  subtitle: "Subtitle?",
  serial: "UPTEC XX XXXXX",
  credits: "X",
  program: "Master's Programme in X",
  author: "First name Last name",
  supervisor: "X",
  reviewer: "Y",
  examiner: "Z",
  secrecy: "", // Leave empty if not confidential
  today: today,
)

// =====================
// Title page
// =====================

#title-page(cfg)

// ----------------------
// Abstract
// ----------------------

#abstract-page(cfg, include "text/abstract.typ")

// Page setup for Sammanfattning, Acknowledgements and toc
#counter(page).update(2)
#set page(
  numbering: "I",
  paper: "a4",
  margin: (top: 4cm, bottom: 4cm, left: 3cm, right: 3cm),
)

//========================
// Swedish summary (Sammanfattning)
//========================

// Comment out this section if you do not need a Swedish summary.
#sammanfattning-page(cfg, include "text/summary.typ")

//========================
// Acknowledgements
//========================

#acknowledgements-page(cfg, include "text/acknowledgements.typ")

//========================
// Acronyms
//========================

#if DRAFT {
  text[
    *NOTE:* Check @sec:examples:acronyms for how to define and use acronyms.
  ]
}

#show: abbr.show-rule
#abbr.list(title: "Acronyms")

#pagebreak()

// Table of contents
#set heading(numbering: "1.1.1.1.1  ")
#outline()

#pagebreak()

// =====================
// Main matter
// =====================

// Page setup for Sammanfattning, Acknowledgements and toc
#counter(page).update(1)
#set page(
  numbering: "1",
  paper: "a4",
  margin: (top: 4cm, bottom: 4cm, left: 3cm, right: 3cm),
)

// Header with current section title
#set page(
  header: [
    #context{
      let headers = query(
        heading.where(level: 1)
      )
      let current_best = none
      for header in headers {
        if header.location().page() < here().page() {
          current_best = header
        } else if header.location().page() == here().page(){
          current_best = header
          break
        } else {
          break
        }
      }
      align(right + horizon)[
        #emph(text(
          size: 10pt,
        )[
          #if current_best.numbering != none {
            numbering(current_best.numbering, (counter(heading).at(current_best.location()).at(0)))
          }
          #current_best.body
        ])
        
        #v(-10pt)
        #line(length: 100%, stroke: 0.8pt)
      ]
      
    }
  ],
)

// NOTE paragraph
#if DRAFT {
  text[
    *NOTE:* The order and types of chapters/sections provided are just examples.
    You should decide on the best chapters and order for your work.
  ]
}
// ---------------------
// Sections
// ---------------------

= Introduction <sec:introduction>
#include "text/introduction.typ"

= Purpose, Aims and Motivation <sec:purpose>
#include "text/purpose.typ"

= Background <sec:background>
#include "text/background.typ"

= Method <sec:method>
#include "text/method.typ"

= Results and Discussion <sec:result_discussion>
#include "text/result_discussion.typ"

= Conclusions <sec:conclusions>
#include "text/conclusions.typ"

#pagebreak()

// =====================
// References
// =====================

#bibliography(
  "refs.yml",
  title: auto,
  full: false, //Whether to include all works from the given bibliography files, even those that weren't cited in the document.
  style: "ieee",
)

#pagebreak()

// =====================
// Appendix
// =====================
#set heading(numbering: "A.1.1.1   ")
#context counter(heading).update(0)
= Appendix <app:appendix>

#include "text/appendix.typ"

#if DRAFT {
  include "../dependencies/appendix_tips.typ"
}
