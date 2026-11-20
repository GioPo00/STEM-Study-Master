// esposizione_master.typ — Template Master per <MATERIA>_ESPOSIZIONE.typ (Versione 1.0)
// Framework STEM Study Master — Guida Orale Personalizzata (PDF Unico, Zero Immagini)

#import "src/macros.typ": *

#set document(title: "TITOLO_DOCUMENTO — Guida all'Esposizione Orale")

#set page(
  paper: "a4",
  margin: (top: 2.2cm, bottom: 2.2cm, left: 2.5cm, right: 2.5cm),
  header: context [
    #if counter(page).get().first() > 1 [
      #grid(
        columns: (1fr, 1fr),
        align(left)[#text(8.5pt, fill: rgb("64748b"))[*STEM Study Master* — Guida all'Esposizione Orale]],
        align(right)[#text(8.5pt, fill: rgb("0f766e"), weight: "bold")[#document.title]]
      )
      #v(-3pt)
      #line(length: 100%, stroke: 0.5pt + rgb("cbd5e1"))
    ]
  ],
  footer: context [
    #if counter(page).get().first() > 1 [
      #align(center)[#text(8.5pt, fill: rgb("94a3b8"))[— Pagina #counter(page).display() —]]
    ]
  ]
)

#set text(
  font: ("Segoe UI", "Calibri", "Arial"),
  size: 11pt,
  fill: rgb("0f172a"),
  lang: "it"
)
#set par(justify: true, leading: 0.85em)

// Regola Anti-Orfane
#show heading: it => block(breakable: false)[
  #v(if it.level == 1 { 1.2em } else { 0.8em })
  #text(fill: rgb("0f766e"))[#it]
  #v(0.4em)
]

// FRONTESPIZIO
#align(center + horizon)[
  #text(22pt, weight: "bold", fill: rgb("0f766e"))[NOME_DISCIPLINA] \
  #v(1em)
  #text(13pt, fill: rgb("475569"))[Guida all'Esposizione Orale & Coordinazione Grafica su Foglio Bianco] \
  #v(2em)
  #line(length: 40%, stroke: 1.5pt + rgb("0f766e"))
  #v(2em)
  #text(10pt, fill: rgb("64748b"))[Modellato sull'impronta vocale naturale dello studente — Zero Immagini (v1.0)]
]

#pagebreak()

// INDICE GENERALE COLLOQUIO
#outline(
  title: "Scaletta degli Argomenti Orali",
  indent: auto,
  depth: 2
)

#pagebreak()

// INCLUSIONE MODULARE DEI CAPITOLI ORALI
// #include "src/esposizione_cap01.typ"
