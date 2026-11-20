# STEM Study Master — Versione 1.0 🎓

> **Sistema Operativo di Studio, Verbalizzazione Orale e Preparazione di Esami Universitari STEM su Windows.**  
> *Converte dispense e manoscritti grezzi in una suite editoriale nativa in formato PDF ad alta definizione (compilata tramite Typst), genera guide per l'esposizione orale calibrate sull'impronta vocale dello studente, gestisce la memoria evolutiva delle ripetizioni, somministra quiz interattivi con widget in tempo reale e aggiorna automaticamente il Quaderno degli Errori.*

---

## ⚡ Caratteristiche Tecniche & Requisiti di Sistema

* **Piattaforma Operativa:** **Windows 10 / Windows 11** (architettura ottimizzata per PowerShell e API native `Windows.Data.Pdf` / `.NET System.Drawing`).
* **Zero Dipendenze Esterne:** Il motore tipografico **Typst standalone** (`typst.exe`) è pre-incluso nella directory `tools/typst/`. Non è richiesta alcuna installazione globale di LaTeX, Python o pacchetti terzi.
* **Direttiva di Sicurezza sulle Dipendenze:** L'assistente AI non esegue download o installazioni autonome di estensioni, plugin o librerie esterne. Qualora si renda necessario un componente aggiuntivo, lo segnala all'utente spiegandone lo scopo e lasciando a lui l'installazione manuale.
* **Portabilità Totale:** Tutti gli script calcolano dinamicamente la radice del progetto senza alcun percorso assoluto hardcodato. Per avviare un nuovo ambiente di studio è sufficiente copiare le cartelle `.gemini/`, `tools/` e `config/`.

---

## 🏛️ Architettura Documentale: La Suite PDF per Materia

Per ogni disciplina presente in `subjects/<NomeMateria>/`, il framework produce e mantiene aggiornata una suite di documenti chiusi e stampabili in formato **A4**:

```text
subjects/<NomeMateria>/
├── <MATERIA>_STUDIO.pdf             # 📖 Il Libro di Testo Integrale & Rigoroso (PDF Unico)
├── <MATERIA>_ESPOSIZIONE.pdf        # 🗣️ La Guida Orale Personalizzata (PDF Unico, Zero Immagini)
├── <MATERIA>_VERIFICA_PROGRESSO.pdf # 🎯 Dashboard Avanzamento, Registro Quiz & Quaderno Errori
└── <MATERIA>_CHEATSHEET.pdf         # ⚡ Scheda di Sopravvivenza Pre-Esame (Su Richiesta, 2-3 pp.)
```

### 1. `<MATERIA>_STUDIO.pdf` — Il Libro di Testo Integrale (PDF Unico)
* **Struttura Modulare a Output Unico:** I singoli capitoli risiedono in moduli indipendenti (`src/cap01.typ`, `src/cap02.typ`...) che importano la libreria grafica condivisa (`#import "macros.typ": *`) e vengono aggregati dal documento master `<MATERIA>_STUDIO.typ` tramite direttive `#include`. Il risultato è un **unico PDF continuo** con numerazione unificata e indice generale automatico, che protegge i capitoli già consolidati da regressioni.
* **Fedeltà Assoluta alla Cattedra:** Trascrizione formale e analitica del materiale ufficiale (dimostrazioni algebriche integrali, condizioni al contorno, annotazioni del docente).
* **Componenti Grafici & Pedagogici Standardizzati:**
  * `#ponte`: raccordo concettuale tra i risultati del capitolo precedente e il nuovo argomento;
  * `#dubbio`: segnalazione visiva di passaggi manoscritti o pedici ambigui senza assunzioni arbitrarie;
  * `#integrazione`: approfondimenti fisici e dimostrazioni di supporto isolati dal canone della lezione;
  * `#figura`: ritagli chirurgici ad alta risoluzione (con padding protettivo del +5% sugli assi) incorniciati con didascalia vettoriale Typst;
  * `#trabocchetto`: tabelle e box ad alto contrasto sui tranelli tipici d'appello;
  * `#domanda_esame`: quesiti reali d'esame con risposta analitica modello;
  * `#checkpoint`: invito di fine capitolo alla verifica attiva.

### 2. `<MATERIA>_ESPOSIZIONE.pdf` — La Guida Orale Personalizzata (PDF Unico)
* **Regola Zero Immagini:** Documento interamente testuale e matematico per massimizzare la concentrazione e il ritmo durante la ripetizione ad alta voce.
* **Stile Modellato sull'Impronta Vocale:** Discorso continuo articolato per stringente concatenazione logica di causa-effetto, calibrato tramite `config/style_profile.json`.
* **Box `✏️ Cosa Disegna la Mano Mentre Parli` (`#disegno`):** Scaletta operativa passo-passo che istruisce lo studente su quali assi, curve, frecce e quote tracciare sul foglio bianco davanti alla commissione mentre espone la teoria.
* **Domande Flash di Autoverifica (`#autoverifica`):** Quesiti rapidi a fine argomento per testare i riflessi prima dell'interrogazione.
* **Potatura dei Tagli Intenzionali:** Gli argomenti secondari che lo studente decide motivatamente di omettere dall'esposizione orale vengono snelliti dal testo e registrati in `oral_tracker.json`.

### 3. `<MATERIA>_VERIFICA_PROGRESSO.pdf` — Dashboard & Quaderno degli Errori
* **Pagina 1 — Dashboard Esecutiva:** Percentuale di avanzamento pagine, obiettivo di voto, data dell'appello, mappa di padronanza dei capitoli (*Consolidato*, *In Rifinitura*, *Da Studiare*) e consiglio prioritario per la sessione.
* **Pagine Successive — Registro Verifiche & Quaderno degli Errori:** Cronologia delle sessioni di quiz e ripetizioni orali, seguita dalle schede analitiche `#errore` che documentano ogni risposta errata, l'anatomia fisica del trabocchetto e la **Regola d'Oro** da memorizzare.

### 4. `<MATERIA>_CHEATSHEET.pdf` — Scheda di Sopravvivenza Pre-Esame (Su Richiesta)
* Micro-documento compatto di **2–3 pagine A4 a 2 colonne fitte**, generabile 24–48 ore prima dell'appello:
  * Mappa logica universale del discorso per tutti i capitoli;
  * Formulario essenziale con unità di misura SI e ordini di grandezza ingegneristici reali;
  * Tavola dei divieti assoluti d'esame (`#divieto`).

---

## 📂 Struttura Completa del Repository

```text
stem-study-master/
├── .gemini/
│   └── skills/
│       └── stem-study-master/
│           ├── SKILL.md                          # Specifiche operative integrali (Versione 1.0)
│           ├── templates/                        # Template tipografici e configurazioni master
│           │   ├── macros.typ                    # Libreria grafica unificata (#ponte, #figura, #errore...)
│           │   ├── studio_master.typ             # Master template per <MATERIA>_STUDIO.typ
│           │   ├── esposizione_master.typ        # Master template per <MATERIA>_ESPOSIZIONE.typ
│           │   ├── verifica_progresso_master.typ # Master template per <MATERIA>_VERIFICA_PROGRESSO.typ
│           │   ├── cheatsheet.typ                # Master template a 2 colonne per il Cheatsheet
│           │   └── oral_tracker.json             # Struttura base per la memoria orale evolutiva
│           └── scripts/
│               ├── init_subject.ps1              # Scaffolding automatico nuova materia e PDF iniziale
│               ├── extract_pages.ps1             # Estrazione pagine PDF in PNG ad alta definizione
│               ├── crop_asset.ps1                # Ritaglio chirurgico (+5% padding) e pulizia temporanei
│               └── compile_pdf.ps1               # Compilazione deterministica Typst -> PDF (--root .)
├── tools/
│   └── typst/
│       └── typst.exe                             # Compilatore Typst standalone per Windows
├── config/
│   └── style_profile.json                        # Profilo stilistico vocale globale dello studente
├── subjects/
│   └── <NomeMateria>/
│       ├── source/appunti_grezzi.pdf             # Materiale didattico sorgente
│       ├── temp_raw/                             # Buffer estrazione temporanea (auto-pulito)
│       ├── assets/                               # Ritagli grafici definitivi (p<NN>_<nome>.png)
│       ├── src/                                  # Moduli Typst per capitolo e libreria macros.typ
│       ├── study_state.json                      # Stato avanzamento per ripresa istantanea
│       ├── oral_tracker.json                     # Memoria storica delle ripetizioni vocali
│       ├── <MATERIA>_STUDIO.typ / .pdf
│       ├── <MATERIA>_ESPOSIZIONE.typ / .pdf
│       ├── <MATERIA>_VERIFICA_PROGRESSO.typ / .pdf
│       └── <MATERIA>_CHEATSHEET.typ / .pdf
└── README.md                                     # Documentazione ufficiale Versione 1.0
```

---

## 🎯 Flusso Pedagogico & Modalità Interattive in Chat

Il sistema rispetta i tempi cognitivi dello studio universitario: l'assistente elabora i documenti di studio ed esposizione, lascia allo studente il tempo di studiare in autonomia e attiva le verifiche su richiesta esplicita, proponendo proattivamente il passo metodologico più efficace.

1. **`«Valuta esposizione»` (Memoria Evolutiva & Filtro Fonetico):**  
   Lo studente invia la trascrizione della propria ripetizione vocale. Il sistema filtra automaticamente gli artefatti di dettatura (*Speech-to-Text Normalizer*), confronta la prova con `oral_tracker.json`, evidenzia progressi e omissioni, distingue i tagli intenzionali e conclude con **2–3 domande aperte da docente**.
2. **`«Fammi il quiz sul Capitolo X»` (Widget Interattivo in Tempo Reale):**  
   Il quiz viene somministrato tramite widget grafico interattivo (`ask_question`) selezionabile con clic del mouse o frecce della tastiera, senza digitare lettere in chat. I quesiti sono erogati uno alla volta con opzioni neutre e randomizzate, feedback analitico immediato dopo ogni risposta e **ricompilazione istantanea** di `<MATERIA>_VERIFICA_PROGRESSO.pdf` al termine dell'ultima domanda.
3. **`«Simula esame»`:**  
   Interrogazione trasversale tra più capitoli in cui lo studente espone la teoria descrivendo a voce ciò che disegna sul foglio bianco.
4. **Protocollo di Chiarimento a 3 Livelli (*«Non ho capito questo passaggio...»*):**  
   Spiegazione progressiva in chat strutturata in: (1) *Intuizione Fisica & Immagine Mentale*, (2) *Meccanica del Processo*, (3) *Raccordo Matematico*, integrabile a richiesta nel PDF di studio.

---

## 🚀 Guida Rapida all'Avvio (Quickstart)

### 1. Posiziona il PDF sorgente
Inserisci il PDF della dispensa o degli appunti manoscritti in:
```text
subjects/<NomeMateria>/source/appunti_grezzi.pdf
```

### 2. Avvia la sessione in chat
Apri la conversazione con l'assistente AI. Al primo avvio, il tutor presenterà le funzionalità della suite e raccoglierà i 4 parametri di calibrazione (**Nome Esame**, **Data Appello**, **Voto Obiettivo**, **Blocco di Pagine iniziale**), eseguendo automaticamente lo scaffolding tramite `init_subject.ps1`.

### 3. Studia, Ripeti e Verifica
Consulta i PDF generati nella cartella `subjects/<NomeMateria>/`, studia il capitolo e utilizza i comandi vocali e i quiz interattivi per consolidare la preparazione fino al giorno dell'appello.
