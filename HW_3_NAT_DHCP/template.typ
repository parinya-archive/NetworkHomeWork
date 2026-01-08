#let template(title: "Document Name", doc) = {
  set page(
    paper: "a4",

    margin: (x: 2.5cm, y: 2.5cm),

    header: [

      #set text(8pt, fill: gray)

      #align(right)[#title]

      #v(-8pt)

      #line(length: 100%, stroke: 0.5pt + gray.lighten(50%))

    ],

    footer: [

      #set text(10pt, fill: gray)

      #align(center)[

        #context [

          #counter(page).display("1") / #counter(page).final().first()

        ]

      ]

    ],
  )


  set text(
    font: "Inter",

    lang: "us",

    size: 11pt,

    weight: "regular",

    fill: rgb(30, 30, 30),
  )


  set par(
    justify: true,

    leading: 0.8em,

    spacing: 1.2em,

    first-line-indent: 0pt,
  )


  set heading(numbering: "1)")

  show heading: it => {
    if it.level == 1 {
      pagebreak(weak: true)
    }
    block(above: 2em, below: 1em)[
      #text(font: "Inter", weight: "medium")[#it]
    ]
  }


  set enum(
    numbering: "1)",
    indent: 0.5em,
    body-indent: 0.8em,
    spacing: 1em,
  )


  show raw.where(block: true): block.with(
    fill: luma(240),

    inset: 10pt,

    radius: 4pt,

    width: 100%,
  )


  doc
}
