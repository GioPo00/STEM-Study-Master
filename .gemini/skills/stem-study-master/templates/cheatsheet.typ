// cheatsheet.typ — Template Universale Scheda di Sopravvivenza Pre-Esame (2-3 Pagine A4)
// Framework STEM Study Master — Compilato con Typst standalone

#set page(
  paper: "a4",
  flipped: false,
  margin: (top: 1.5cm, bottom: 1.5cm, left: 1.5cm, right: 1.5cm),
  header: [
    #grid(
      columns: (1fr, 1fr),
      align(left)[#text(8pt, fill: rgb("64748b"))[*STEM Study Master* — Scheda di Sopravvivenza Pre-Esame]],
      align(right)[#text(8pt, fill: rgb("dc2626"), weight: "bold")[RIPASSO LAMPO 24H PRIMA DELL'APPELLO]]
    )
    #v(-4pt)
    #line(length: 100%, stroke: 0.5pt + rgb("cbd5e1"))
  ],
  footer: context [
    #align(center)[#text(8pt, fill: rgb("94a3b8"))[Pagina #counter(page).display() — Uso Riservato per Ripasso]]
  ]
)

#set text(
  font: ("Segoe UI", "Calibri", "Arial"),
  size: 8.5pt,
  lang: "it"
)
#set par(justify: true, leading: 0.6em)

#let divieto(body) = {
  rect(
    width: 100%,
    fill: rgb("fff1f2"),
    stroke: (left: 3pt + rgb("e11d48"), rest: 0.5pt + rgb("fecdd3")),
    radius: (right: 3pt),
    inset: (x: 8pt, y: 6pt),
    [
      #text(fill: rgb("9f1239"), weight: "bold", size: 8pt)[❌ TRABOCCHETTO MORTALE DA NON DIRE MAI:] \
      #v(2pt)
      #text(fill: rgb("1e293b"), size: 8pt)[#body]
    ]
  )
}

#let sezione(titolo) = {
  rect(
    width: 100%,
    fill: rgb("1e3a8a"),
    radius: 2pt,
    inset: (x: 6pt, y: 4pt),
    text(fill: white, weight: "bold", size: 9pt)[#titolo]
  )
}

// Layout a 2 Colonne dense per massimizzare la concentrazione di concetti
#show: rest => columns(2, gutter: 14pt, rest)

// CONTENUTO SEGNAPOSTO CAMPIONE (UNIVERSALE PER QUALSIASI DISCIPLINA STEM)
#sezione("1. MAPPA MENTALE DEL DISCORSO")
*Filo Logico di Presentazione Orale:*
- Inquadramento fenomenologico e definizioni preliminari.
- Principi primi, bilanci ed equazioni costitutive fondamentali.
- Condizioni al contorno, ipotesi semplificative e limiti di validità.
- Risvolto applicativo, criteri di verifica e ordini di grandezza fisici.

#v(6pt)
#sezione("2. FORMULARIO CHIAVE & ORDINI DI GRANDEZZA")
#table(
  columns: (1.2fr, 1.4fr, 1.4fr),
  stroke: 0.5pt + rgb("cbd5e1"),
  fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
  table.header([*Parametro*], [*Formula Costitutiva*], [*Unità SI / Valore Tipico*]),
  [Grandezza 1], [$f(x) = alpha dot beta$], [$["MPa"] quad 10 - 100$],
  [Grandezza 2], [$g(y) = sqrt(A / B)$], [$["m/s"] quad 100 - 1000$],
  [Parametro Limite], [$theta lt.eq theta_(lim)$], [$[-] quad 10^(-4) - 10^(-2)$]
)

#v(6pt)
#sezione("3. TAVOLA DEI DIVIETI ASSOLUTI D'ESAME")
#divieto[
  Confondere le ipotesi cinematiche/costitutive valide in campo lineare con quelle del campo non lineare o post-critico.
]

#v(4pt)
#divieto[
  Enunciare equazioni o formule empiriche senza esplicitare le condizioni di validità al contorno e le unità di misura delle variabili.
]
