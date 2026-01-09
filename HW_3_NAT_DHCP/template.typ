#let template(
  title: "Document Title",
  date: datetime.today().display("[day] [month repr:long] [year]"),
  doc
) = {
  // --- 1. CONFIGURATION ---
  let primary-color = rgb("#0F172A") // สี Slate เข้ม (Modern Dark)
  let accent-color = rgb("#3B82F6")  // สีฟ้าสดใส (Modern Blue) สำหรับจุดเน้น

  // --- 2. PAGE SETUP ---
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm, top: 3cm, bottom: 2.5cm), // เพิ่มขอบบนเล็กน้อยเพื่อ Space

    // Header: เรียบง่าย ชื่อเรื่องซ้าย เส้นบางๆ
    header: context {
      if counter(page).get().first() > 1 { // ไม่แสดง Header หน้าแรก (ถ้าต้องการ)
        set text(9pt, fill: gray.darken(20%))
        grid(
          columns: (1fr, 1fr),
          align(left)[#strong[#title]],
          align(right)[#date]
        )
        v(-8pt)
        line(length: 100%, stroke: 0.5pt + gray.lighten(60%))
      }
    },

    // Footer: เลขหน้าแบบ Minimal (Page X of Y)
    footer: context {
      set text(9pt, fill: gray)
      align(center)[
        #counter(page).display("1") / #counter(page).final().first()
      ]
    },
  )

  // --- 3. TEXT & PARAGRAPH ---
  set text(
    // ใช้ Font Stack: ภาษาอังกฤษใช้ Inter, ไทยใช้ Sarabun (ต้องมีฟอนต์ในเครื่อง)
    font: ("Inter"),
    lang: "th", // ตั้งเป็น th เพื่อการตัดคำภาษาไทยที่ถูกต้อง
    size: 11pt,
    weight: "regular",
    fill: primary-color,
  )

  set par(
    justify: true, // จัดชิดขอบซ้ายขวา (Standard)
    leading: 1em,  // ระยะห่างบรรทัดที่กว้างขึ้น อ่านสบาย (Modern)
    spacing: 1.2em,
    first-line-indent: 0pt, // Modern มักไม่มีย่อหน้าบรรทัดแรก แต่ใช้ spacing ระหว่าง paragraph แทน
  )

  // --- 4. HEADING STYLES ---
  set heading(numbering: "1.1")

  show heading: it => {
    set text(font: ("Inter"), weight: "bold")
    if it.level == 1 {
      // Heading 1: ใหญ่ พิเศษ มีเส้นใต้
      pad(bottom: 0.5em, top: 1em)[
        #set text(18pt, fill: primary-color)
        #it
        #v(-0.5em)
        #line(length: 100%, stroke: 2pt + accent-color) // เส้นใต้สี Accent
      ]
    } else if it.level == 2 {
      // Heading 2: ขนาดกลาง สีเข้ม
      pad(top: 1em, bottom: 0.5em)[
        #set text(14pt, fill: primary-color)
        #it
      ]
    } else {
      // Heading อื่นๆ
      pad(top: 0.8em, bottom: 0.5em)[
        #set text(12pt, fill: primary-color.lighten(20%))
        #it
      ]
    }
  }

  // --- 5. VISUAL ELEMENTS ---

  // Bullet Points
  set list(indent: 1em, marker: ([•], [‣], [-]))

  // Code Block: สไตล์ Tech Minimal
  show raw.where(block: true): block.with(
    fill: luma(248), // เทาอ่อนมากๆ
    inset: 16pt,
    radius: 6pt,
    stroke: 0.5pt + luma(220), // ขอบบางๆ
    width: 100%,
  )

  show raw.where(block: true): it => {
    set text(font: ("JetBrains Mono", "Fira Code", "Consolas"), size: 10pt)
    it
  }

  // Links
  show link: it => {
    text(fill: accent-color, underline: true, it)
  }

  // --- 6. TITLE BLOCK (หน้าแรก) ---
  align(left)[
    #v(2em)
    #text(12pt, weight: "bold", fill: accent-color)[#upper(date)] \
    #v(0.5em)
    #text(28pt, weight: "black", fill: primary-color)[#title] \
    #v(0.5em)
    #text(14pt, style: "italic", fill: gray)[by Parinya Aobaun]
    #v(2em)
    #line(length: 100%, stroke: 0.5pt + gray.lighten(50%))
    #v(2em)
  ]

  // Content Body
  doc
}
