// macros.typ — Libreria Universale Macro & Box Grafici Typst
// Framework STEM Study Master — Importabile con: #import "macros.typ": *

#let ponte(body) = {
  rect(
    width: 100%,
    fill: rgb("f8fafc"),
    stroke: (left: 3.5pt + rgb("475569"), rest: 0.5pt + rgb("e2e8f0")),
    radius: (right: 3pt),
    inset: (x: 10pt, y: 8pt),
    [
      #text(fill: rgb("334155"), weight: "bold", size: 9pt)[🌉 PONTE LOGICO TRA CAPITOLI] \
      #v(2pt)
      #text(fill: rgb("1e293b"), size: 9.5pt)[#body]
    ]
  )
}

#let dubbio(body) = {
  rect(
    width: 100%,
    fill: rgb("fefce8"),
    stroke: (left: 3.5pt + rgb("eab308"), rest: 0.5pt + rgb("fef08a")),
    radius: (right: 3pt),
    inset: (x: 10pt, y: 8pt),
    [
      #text(fill: rgb("854d0e"), weight: "bold", size: 9pt)[⚠️ SEGNALAZIONE DUBBIO MANOSCRITTO] \
      #v(2pt)
      #text(fill: rgb("422006"), size: 9.5pt)[#body]
    ]
  )
}

#let integrazione(body) = {
  rect(
    width: 100%,
    fill: rgb("f0f9ff"),
    stroke: (left: 3.5pt + rgb("0284c7"), rest: 0.5pt + rgb("bae6fd")),
    radius: (right: 3pt),
    inset: (x: 10pt, y: 8pt),
    [
      #text(fill: rgb("0369a1"), weight: "bold", size: 9pt)[🔍 APPROFONDIMENTO & INTEGRAZIONE FISICA] \
      #v(2pt)
      #text(fill: rgb("0c4a6e"), size: 9.5pt)[#body]
    ]
  )
}

#let trabocchetto(titolo, body) = {
  block(breakable: false)[
    #rect(
      width: 100%,
      fill: rgb("fff1f2"),
      stroke: (left: 4pt + rgb("e11d48"), rest: 0.5pt + rgb("fecdd3")),
      radius: (right: 3pt),
      inset: (x: 10pt, y: 8pt),
      [
        #text(fill: rgb("9f1239"), weight: "bold", size: 9.5pt)[❌ TRABOCCHETTO D'ESAME: #titolo] \
        #v(3pt)
        #text(fill: rgb("1e293b"), size: 9.5pt)[#body]
      ]
    )
  ]
}

#let domanda_esame(domanda, risposta) = {
  block(breakable: false)[
    #rect(
      width: 100%,
      fill: rgb("f5f3ff"),
      stroke: (left: 3.5pt + rgb("7c3aed"), rest: 0.5pt + rgb("ddd6fe")),
      radius: (right: 3pt),
      inset: (x: 10pt, y: 8pt),
      [
        #text(fill: rgb("5b21b6"), weight: "bold", size: 9.5pt)[🎯 DOMANDA D'ESAME TIPICA:] \
        #text(fill: rgb("1e1b4b"), style: "italic", size: 9.5pt)[#domanda] \
        #v(4pt)
        #text(fill: rgb("4c1d95"), weight: "bold", size: 9pt)[Risposta Modello Cattedra:] \
        #text(fill: rgb("0f172a"), size: 9.5pt)[#risposta]
      ]
    )
  ]
}

#let checkpoint(body) = {
  rect(
    width: 100%,
    fill: rgb("f0fdf4"),
    stroke: (left: 3.5pt + rgb("16a34a"), rest: 0.5pt + rgb("bbf7d0")),
    radius: (right: 3pt),
    inset: (x: 10pt, y: 8pt),
    [
      #text(fill: rgb("15803d"), weight: "bold", size: 9.5pt)[✅ CHECKPOINT DI FINE CAPITOLO] \
      #v(2pt)
      #text(fill: rgb("14532d"), size: 9.5pt)[#body]
    ]
  )
}

#let disegno(titolo, passi) = {
  block(breakable: false)[
    #rect(
      width: 100%,
      fill: rgb("f0fdfa"),
      stroke: (left: 4pt + rgb("0d9488"), rest: 0.5pt + rgb("ccfbf1")),
      radius: (right: 3pt),
      inset: (x: 10pt, y: 8pt),
      [
        #text(fill: rgb("115e59"), weight: "bold", size: 10pt)[✏️ COSA DISEGNA LA MANO MENTRE PARLI: #titolo] \
        #v(3pt)
        #text(fill: rgb("134e4a"), size: 9.5pt)[#passi]
      ]
    )
  ]
}

#let autoverifica(domanda) = {
  block(breakable: false)[
    #rect(
      width: 100%,
      fill: rgb("f8fafc"),
      stroke: (left: 3.5pt + rgb("3b82f6"), rest: 0.5pt + rgb("e2e8f0")),
      radius: (right: 3pt),
      inset: (x: 10pt, y: 8pt),
      [
        #text(fill: rgb("1d4ed8"), weight: "bold", size: 9.5pt)[⚡ DOMANDA FLASH DI AUTOVERIFICA:] \
        #v(2pt)
        #text(fill: rgb("1e293b"), style: "italic", size: 9.5pt)[#domanda]
      ]
    )
  ]
}

#let errore(capitolo, quesito, risposta_data, spiegazione_tranello, regola_oro) = {
  block(breakable: false)[
    #rect(
      width: 100%,
      fill: rgb("fff1f2"),
      stroke: (left: 4pt + rgb("e11d48"), rest: 0.5pt + rgb("fecdd3")),
      radius: (right: 3pt),
      inset: (x: 10pt, y: 8pt),
      [
        #grid(
          columns: (1fr, auto),
          text(fill: rgb("9f1239"), weight: "bold", size: 9pt)[#capitolo],
          text(fill: rgb("dc2626"), size: 8.5pt, weight: "bold")[ERRORE REGISTRATO]
        )
        #v(2pt)
        #text(weight: "bold", size: 9.5pt)[Quesito:] #text(style: "italic")[#quesito] \
        #text(fill: rgb("b91c1c"), size: 9pt)[*Risposta errata fornita:* #risposta_data] \
        #v(3pt)
        #text(fill: rgb("475569"), size: 9pt)[*Anatomia del Trabocchetto:* #spiegazione_tranello] \
        #v(3pt)
        #rect(
          width: 100%,
          fill: rgb("ffffff"),
          stroke: 0.5pt + rgb("fda4af"),
          inset: 6pt,
          [#text(fill: rgb("881337"), weight: "bold", size: 9pt)[💡 Regola d'Oro da Ricordare:] #text(size: 9pt)[#regola_oro]]
        )
      ]
    )
  ]
}

#let figura(path, didascalia, width: 80%) = {
  align(center)[
    #block(width: width, breakable: false)[
      #rect(
        stroke: 0.5pt + rgb("cbd5e1"),
        radius: 3pt,
        inset: 4pt,
        fill: white
      )[
        #image(path, width: 100%)
      ]
      #v(4pt)
      #text(8.5pt, fill: rgb("475569"))[*Figura:* #didascalia]
    ]
  ]
}
