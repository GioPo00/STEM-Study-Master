// studio_master.typ — Template Master per <MATERIA>_STUDIO.typ (Versione 1.0)
// Framework STEM Study Master — Compilazione modulare Typst -> PDF Unico

#import "src/macros.typ": *

#set document(title: "TITOLO_DOCUMENTO — Libro di Testo Integrale")

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
  header: context [
    #if counter(page).get().first() > 1 [
      #grid(
        columns: (1fr, 1fr),
        align(left)[#text(8.5pt, fill: rgb("64748b"))[*STEM Study Master* — Libro di Testo Integrale]],
        align(right)[#text(8.5pt, fill: rgb("1e3a8a"), weight: "bold")[#document.title]]
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
  size: 10.5pt,
  fill: rgb("0f172a"),
  lang: "it"
)
#set par(justify: true, leading: 0.75em)

// Regola Anti-Orfane: i titoli non rimangono mai isolati a fondo pagina
#show heading: it => block(breakable: false)[
  #v(if it.level == 1 { 1.2em } else { 0.8em })
  #text(fill: rgb("1e3a8a"))[#it]
  #v(0.4em)
]

// FRONTESPIZIO
#align(center + horizon)[
  #text(24pt, weight: "bold", fill: rgb("1e3a8a"))[NOME_DISCIPLINA] \
  #v(1em)
  #text(14pt, fill: rgb("475569"))[Trascrizione Rigorosa, Analisi Formale & Schemi Grafici Integrati] \
  #v(2em)
  #line(length: 40%, stroke: 1.5pt + rgb("1e3a8a"))
  #v(2em)
  #text(10pt, fill: rgb("64748b"))[Suite di Preparazione STEM Study Master — Versione 1.0]
]

#pagebreak()

// INDICE GENERALE COMPLETO
#outline(
  title: "Indice Generale del Corso",
  indent: auto,
  depth: 3
)

#pagebreak()

// INCLUSIONE MODULARE DEI CAPITOLI (Singolo PDF Unico)
// #include "src/cap01.typ"
