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
#import "@preview/tblr:0.4.4": *
#import "uppsala_thesis.typ": *

// =====================
// Document setup
// =====================
#show: codly-init.with()
#codly(languages: codly-languages)


#set text(
  font: "Roboto", // If you don't have it Roboto is stored in dependencies. You might have to install static version for Typst to work, Alternatively switch to Libertinus Serif
  // font: "Libertinus Serif",
  size: 12pt,
  lang: "en", // Typst webapp does not support all languages. Look it up if needed and run locally if necessary for spellchecking.
  overhang: false,
)

#show: doc => styling(doc)

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

// =====================
// Abstract
// =====================

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

= Declaration of generative AI use
#include "text/declaration_ai.typ"

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
