#let logo_width = 4.2cm

// ----------------------
// Configuration record
// ----------------------
#let thesis-config(
  title: "",
  subtitle: "",
  author: "",
  program: "",
  serial: "",
  credits: "",
  supervisor: "",
  reviewer: "",
  examiner: "",
  secrecy: "",
  today: "",
) = (
  title: title,
  subtitle: subtitle,
  author: author,
  program: program,
  serial: serial,
  credits: credits,
  supervisor: supervisor,
  reviewer: reviewer,
  examiner: examiner,
  secrecy: secrecy,
  today: today,
)

// ----------------------
// Title page
// ----------------------
#let title-page(cfg) = {
  let margin = 2.0cm
  set page(
    numbering: none,
    paper: "a4",
    margin: (top: margin, bottom: margin, left: margin, right: margin),
  )

  // ---------- Top row ----------
  place(
    top + left,
    dx: -margin / 2,
    dy: -margin / 2,
  )[
    #image("dependencies/logo.svg", width: logo_width)
  ]

  place(
    top + right,
  )[
    #v(.4cm)
    #text(size: 10pt, fill: gray)[#cfg.serial]\
    #text(size: 14pt)[
      Degree project #cfg.credits credits
    ] \
    #text(size: 14pt, fill: gray)[
      #cfg.today
    ]
  ]


  // ---------- Title ----------
  let title_dx = 3.5cm
  place(
    dy: logo_width + 0.5cm,
    dx: title_dx,
  )[
    #align(left)[
      #text(size: 26pt, fill: gray)[#cfg.title] \
      #if cfg.subtitle != "" [
        #text(size: 14pt, fill: gray)[#cfg.subtitle]
      ]
      #line(length: 100% - title_dx, stroke: 0.8pt)
      #text(size: 14pt)[#cfg.author]
    ]
  ]
  // ---------- Bottom ----------
  place(
    bottom + right,
    dx: 2.0cm,
    dy: 2.0cm,
  )[
    #image("dependencies/logo_side.svg", width: 10cm)
  ]

  place(
    bottom + right,
    dy: 0.6cm,
  )[
    #text(size: 14pt, fill: gray)[#cfg.program]
  ]

  pagebreak(to: "odd")
}

// ----------------------
// Abstract
// ----------------------

#let abstract-page(cfg, body) = {
  let margin = 2.0cm
  set page(
    numbering: none,
    paper: "a4",
    margin: (top: margin, bottom: margin, left: margin, right: margin),
  )
  // ---------- Top row ----------
  place(
    top + left,
    dx: -margin / 2,
    dy: -margin / 2,
  )[
    #image("dependencies/logo_black.svg", width: logo_width)
  ]

  place(
    top + left,
    dx: logo_width + 1.5cm,
    dy: -.5cm,
  )[
    #v(.8cm)
    #text(size: 12pt, fill: gray)[#cfg.title]
    #v(-.2cm)
    #line(length: 100% - (logo_width + 1.5cm), stroke: 0.8pt)
    #v(-.2cm)
    #text(size: 12pt)[#cfg.author]
  ]
  v(logo_width)

  // Content
  block(
    inset: (left: 1cm),
  )[
    #text(size: 12pt)[*Abstract*]
    #body
  ]

  // ---------- Bottom ----------

  place(
    bottom + center,
  )[
    #text(size: 14pt, fill: gray)[*Faculty of Science and Technology*]

    #text(size: 14pt, fill: gray)[*Uppsala University, Place of publication Uppsala*]

    #text(size: 10pt, fill: gray)[
      Supervisor: #cfg.supervisor #h(6pt) Subject reader: #cfg.reviewer  \
      Examiner: #cfg.examiner
    ]
  ]

  pagebreak(to: "odd")
}

// Sweredish summary page (optional)
#let sammanfattning-page(cfg,body) ={
  block(below: 40pt)[
    #text(size: 17pt)[*Sammanfattning*]
  ]
  body
  pagebreak()
}

// Acknowledgements page (optional)
#let acknowledgements-page(cfg,body) ={
  block(below: 40pt)[
    #text(size: 17pt)[*Acknowledgements*]
  ]
  body
  pagebreak()
}