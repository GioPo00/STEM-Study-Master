// verifica_progresso_master.typ — Template Master per <MATERIA>_VERIFICA_PROGRESSO.typ (Versione 1.0)
// Framework STEM Study Master — Dashboard Avanzamento, Registro Quiz & Quaderno degli Errori

#import "src/macros.typ": *

#set document(title: "TITOLO_DOCUMENTO — Verifica Progresso & Quaderno Errori")

#set page(
  paper: "a4",
  margin: (top: 2cm, bottom: 2cm, left: 2.2cm, right: 2.2cm),
  header: context [
    #grid(
      columns: (1fr, 1fr),
      align(left)[#text(8.5pt, fill: rgb("64748b"))[*STEM Study Master* — Verifica Progresso & Quaderno Errori]],
      align(right)[#text(8.5pt, fill: rgb("7c3aed"), weight: "bold")[#document.title]]
    )
    #v(-3pt)
    #line(length: 100%, stroke: 0.5pt + rgb("cbd5e1"))
  ],
  footer: context [
    #align(center)[#text(8.5pt, fill: rgb("94a3b8"))[— Pagina #counter(page).display() —]]
  ]
)

#set text(
  font: ("Segoe UI", "Calibri", "Arial"),
  size: 10pt,
  fill: rgb("0f172a"),
  lang: "it"
)
#set par(justify: true, leading: 0.7em)

// Regola Anti-Orfane
#show heading: it => block(breakable: false)[
  #v(if it.level == 1 { 1.2em } else { 0.8em })
  #text(fill: rgb("6d28d9"))[#it]
  #v(0.4em)
]

// PAGINA 1: DASHBOARD DI AVANZAMENTO & PIANIFICAZIONE
= Dashboard di Avanzamento & Stato del Corso

#v(8pt)
#grid(
  columns: (1fr, 1fr, 1.2fr),
  gutter: 12pt,
  rect(
    width: 100%, fill: rgb("f8fafc"), stroke: 0.5pt + rgb("cbd5e1"), radius: 4pt, inset: 10pt,
    [
      #text(8.5pt, fill: rgb("64748b"), weight: "bold")[COMPLETAMENTO DISPENSE] \
      #v(4pt)
      #text(20pt, weight: "bold", fill: rgb("1e3a8a"))[0%] \
      #text(8.5pt, fill: rgb("64748b"))[0 di TOTALE_PAGINE pagine elaborate]
    ]
  ),
  rect(
    width: 100%, fill: rgb("f8fafc"), stroke: 0.5pt + rgb("cbd5e1"), radius: 4pt, inset: 10pt,
    [
      #text(8.5pt, fill: rgb("64748b"), weight: "bold")[OBIETTIVO & APPELLO] \
      #v(4pt)
      #text(12pt, weight: "bold", fill: rgb("16a34a"))[Target: VOTO_OBIETTIVO] \
      #text(8.5pt, fill: rgb("64748b"))[Appello: DATA_APPELLO]
    ]
  ),
  rect(
    width: 100%, fill: rgb("f5f3ff"), stroke: 0.5pt + rgb("ddd6fe"), radius: 4pt, inset: 10pt,
    [
      #text(8.5pt, fill: rgb("7c3aed"), weight: "bold")[CONSIGLIO GIORNALIERO] \
      #v(4pt)
      #text(9pt, fill: rgb("4c1d95"))[Inizializzazione completata. Pronto per l'elaborazione del primo blocco di studio.]
    ]
  )
)

#v(14pt)
== Mappa di Padronanza dei Capitoli

#table(
  columns: (0.8fr, 2.5fr, 1fr, 1.2fr),
  stroke: 0.5pt + rgb("cbd5e1"),
  fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
  table.header([*Cap.*], [*Titolo Argomento*], [*Stato*], [*Punteggio Quiz*]),
  [Cap. 1], [In attesa di elaborazione], [Da Studiare], [-]
)

#pagebreak()

// PAGINA 2+: QUADERNO DEGLI ERRORI & REGISTRO VERIFICHE
= Quaderno degli Errori & Registro Storico Quiz

#text(9.5pt, fill: rgb("64748b"))[
  Questo registro archivia automaticamente ogni risposta errata o imprecisione rilevata durante i quiz interattivi e le esposizioni orali, evidenziando il principio fisico e analitico per superare i trabocchetti tipici d'esame.
]

#v(10pt)
== Cronologia Sessioni di Verifica

#table(
  columns: (1fr, 1.5fr, 1.5fr, 1fr),
  stroke: 0.5pt + rgb("cbd5e1"),
  fill: (col, row) => if row == 0 { rgb("f1f5f9") } else { none },
  table.header([*Data*], [*Modalità*], [*Argomento*], [*Esito*]),
  [-], [-], [-], [-]
)

#v(14pt)
== Analisi Dettagliata Trabocchetti Riscontrati

// Le schede errore verranno inserite automaticamente qui di seguito tramite la macro #errore(...)
