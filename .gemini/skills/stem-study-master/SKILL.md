---
name: stem-study-master
description: >-
  Framework ingegneristico Versione 1.0 per la preparazione e verbalizzazione di esami universitari STEM su Windows.
  Compila appunti grezzi in suite PDF editoriali (Typst), guida l'esposizione orale sull'impronta vocale,
  gestisce la memoria evolutiva delle ripetizioni, simulazioni d'esame con disegno a mano e quiz interattivi con widget in tempo reale.
  Attivare questa skill quando l'utente menziona lo studio, la preparazione o la verbalizzazione di un esame,
  oppure quando chiede di elaborare dispense, appunti manoscritti o di fare quiz e ripetizioni orali.
---

# STEM Study Master — Sistema Operativo di Studio & Verbalizzazione Orale (Versione 1.0)

`stem-study-master` (Versione 1.0) è un framework ingegneristico progettato per studenti universitari di facoltà scientifiche e tecniche (Ingegneria, Fisica, Matematica, Chimica) su piattaforma **Windows**.  
Il sistema converte dispense e manoscritti grezzi in una **suite editoriale nativa in formato PDF** compilata istantaneamente tramite **Typst**, modella l'esposizione orale sull'impronta vocale naturale dello studente, eroga quiz interattivi con interfaccia di selezione in tempo reale, monitora l'apprendimento ed eroga proattivamente suggerimenti metodologici dal primo giorno fino all'appello d'esame.

---

## 🛡️ Direttiva di Sicurezza & Gestione Dipendenze ed Estensioni
Qualora durante lo sviluppo, il collaudo o l'esecuzione ordinaria del framework dovesse rendersi necessario scaricare o installare un'estensione, un plugin, un modulo, un pacchetto software o una libreria di supporto:
* **Divieto Assoluto di Installazione Autonoma:** L'assistente non deve eseguire comandi di installazione o scaricamento di pacchetti/binari in autonomia.
* **Segnalazione Guidata all'Utente:** L'assistente deve notificare la richiesta all'utente, spiegando dettagliatamente: (1) quale componente serve, (2) quale scopo operativo assolve, (3) come l'utente può installarlo manualmente in sicurezza sul proprio sistema.

---

## 🏛️ Architettura Documentale: La Suite PDF per Materia

Per ogni disciplina presente in `subjects/<NomeMateria>/`, il framework produce e mantiene aggiornata una suite di documenti chiusi e stampabili in formato **A4**:

```text
subjects/<NomeMateria>/
├── <MATERIA>_STUDIO.pdf             # 📖 Il Libro di Testo Integrale & Rigoroso (PDF Unico)
├── <MATERIA>_ESPOSIZIONE.pdf        # 🗣️ La Guida Orale Personalizzata (PDF Unico, Zero Immagini)
├── <MATERIA>_VERIFICA_PROGRESSO.pdf # 🎯 Dashboard Avanzamento, Registro Quiz & Quaderno Errori
└── <MATERIA>_CHEATSHEET.pdf         # ⚡ Scheda di Sopravvivenza Pre-Esame (Generabile su Richiesta, 2-3 pp.)
```

### 1. `<MATERIA>_STUDIO.pdf` — Il Libro di Testo Integrale (PDF Unico)
* **Output Unico con Struttura Modulare Interna:** Per garantire la massima stabilità ed evitare la corruzione del codice su dispense estese (200–400 pagine), i singoli capitoli vengono redatti in file indipendenti `src/cap01.typ`, `src/cap02.typ`... che importano la libreria grafica centralizzata `#import "macros.typ": *`. Il file master `<MATERIA>_STUDIO.typ` aggrega i capitoli tramite direttive `#include`, generando un **singolo PDF continuo, con numerazione unificata delle pagine e indice generale completo**. L'aggiunta di un nuovo capitolo non altera mai i capitoli precedenti.
* **Fedeltà Assoluta alla Cattedra:** Trascrizione formale e analitica del materiale didattico ufficiale (dimostrazioni algebriche integrali, condizioni al contorno, note del docente). Nessun taglio non concordato.
* **Ponti Narrativi tra Capitoli (`#ponte`):** Ogni capitolo si apre esplicitando la traiettoria logica e raccordandosi concettualmente al capitolo precedente.
* **Segnalazione Rigorosa dei Dubbi (`#dubbio`):** Passaggi manoscritti, pedici o formule ambigue vengono contrassegnati visivamente senza formulare assunzioni arbitrarie.
* **Integrazioni Fisiche Separate (`#integrazione`):** Chiarimenti fisici o dimostrazioni essenziali non esplicitate a lezione vengono inseriti in box dedicati per distinguere sempre il canone del docente dall'approfondimento.
* **Grafica Autentica con Didascalie Vettoriali (`#figura`):** Curve sperimentali, abachi e schemi vengono ritagliati direttamente dalla sorgente con coordinate normalizzate espanse del 5% di margine di sicurezza. Le didascalie non vengono mai ritagliate come immagine raster ma composte come testo vettoriale nativo Typst ad alta leggibilità.
* **Tabelle a Prova di Trabocchetto (`#trabocchetto`):** Schemi sinottici ad alto contrasto mirati a disinnescare gli errori concettuali tipici d'esame.
* **Domande d'Esame del Docente con Risposte Modello (`#domanda_esame`):** Quesiti tipici d'appello e risposte analitiche formali al termine di ogni capitolo.
* **Glossario Notazionale con Ordini di Grandezza Reali:** Tabella dei simboli, unità SI, formule costitutive e valori numerici tipici nella pratica ingegneristica.
* **Invito Checkpoint (`#checkpoint`):** Box al termine di ogni capitolo per stimolare la verifica attiva.

### 2. `<MATERIA>_ESPOSIZIONE.pdf` — La Guida Orale Personalizzata (PDF Unico)
* **Zero Immagini Incorporate:** Documento puramente testuale per massimizzare la concentrazione e la velocità di lettura durante la ripetizione vocale.
* **Stile Modellato sull'Utente:** Discorso continuo a stringente catena causa-effetto (*"Poiché... Ne segue che... Di conseguenza..."*), strutturato secondo il profilo stilistico concordato in `config/style_profile.json`.
* **Formule in Notazione Matematica Pura Typst:** Le equazioni sono riportate in forma matematica rigorosa senza backslash LaTeX, lasciando allo studente la cadenza di verbalizzazione.
* **Box `✏️ Cosa Disegna la Mano Mentre Parli` (`#disegno`):** Scaletta operativa descrittiva che indica esattamente quali assi, tratti grafici e quote tracciare sul foglio bianco durante il colloquio d'esame.
* **Potatura dei Tagli Intenzionali:** Se lo studente decide motivatamente di escludere un argomento secondario dall'esposizione orale, il testo viene snellito rimuovendolo definitivamente senza più contestarlo come errore.
* **Domande Flash di Autoverifica Pre-Esame (`#autoverifica`):** Quesiti rapidi per testare la prontezza sui concetti chiave.

### 3. `<MATERIA>_VERIFICA_PROGRESSO.pdf` — Dashboard & Quaderno degli Errori
* **Pagina 1 — Quadro di Avanzamento & Pianificazione:**
  * Percentuale di completamento del programma ($N$ pagine studiate su totale);
  * Obiettivo di voto e data dell'appello;
  * Mappa di padronanza dei capitoli (*Consolidato*, *In Rifinitura*, *Da Studiare*);
  * Punti critici rilevati e consiglio mirato per la sessione giornaliera prima di avanzare su nuove pagine.
* **Pagine Successive — Registro Verifiche & Quaderno degli Errori:**
  * Tracciamento cumulativo delle sessioni di quiz interattivi e delle valutazioni orali;
  * Schede errore dettagliate (`#errore`): quesito, risposta fornita, anatomia fisica del trabocchetto e regola d'oro analitica;
  * Elenco prioritario degli argomenti da ripassare prima dell'appello.

### 4. `<MATERIA>_CHEATSHEET.pdf` — Scheda di Sopravvivenza Pre-Esame (Su Richiesta)
* Micro-documento compatto di **2–3 pagine A4 a 2 colonne fitte**, generabile su richiesta il giorno prima dell'esame:
  * Scaletta macro di tutti i capitoli con parole chiave del discorso;
  * Formulario essenziale con unità di misura e ordini di grandezza numerici;
  * Tavola dei divieti assoluti d'esame (`#divieto`: i trabocchetti mortali da evitare davanti alla commissione).

---

## 📂 Organizzazione del Repository (Windows)

```text
stem-study-master/
├── .gemini/
│   └── skills/
│       └── stem-study-master/
│           ├── SKILL.md                          # Specifiche operative e protocolli (Versione 1.0)
│           ├── templates/                        # Modelli tipografici e configurazioni master
│           │   ├── macros.typ                    # Libreria grafica condivisa (#ponte, #errore, #disegno, #figura)
│           │   ├── studio_master.typ             # Master template per <MATERIA>_STUDIO.typ
│           │   ├── esposizione_master.typ        # Master template per <MATERIA>_ESPOSIZIONE.typ
│           │   ├── verifica_progresso_master.typ # Master template per <MATERIA>_VERIFICA_PROGRESSO.typ
│           │   ├── cheatsheet.typ                # Master template a 2 colonne per il Cheatsheet
│           │   └── oral_tracker.json             # Template base per memoria orale evolutiva
│           └── scripts/
│               ├── init_subject.ps1              # Scaffolding automatico nuova materia e Dashboard PDF
│               ├── extract_pages.ps1             # Estrazione intelligente (Testo digitale / Scansione WinRT)
│               ├── crop_asset.ps1                # Ritaglio chirurgico (+5% padding) e pulizia temporanei
│               └── compile_pdf.ps1               # Compilazione deterministica Typst -> PDF (--root .)
├── tools/
│   └── typst/
│       └── typst.exe                             # Motore tipografico autonomo pre-incluso
├── config/
│   └── style_profile.json                        # Profilo stilistico vocale globale dell'utente
├── subjects/
│   └── <NomeMateria>/
│       ├── source/
│       │   └── appunti_grezzi.pdf                # PDF sorgente (scansione, digitale o ibrido)
│       ├── temp_raw/                             # Cartella temporanea (svuotata automaticamente)
│       ├── assets/                               # Ritagli chirurgici inclusi nel testo (p<NN>_<nome>.png)
│       ├── src/                                  # Sorgenti modulari Typst per capitolo
│       │   ├── macros.typ                        # Istanza locale della libreria grafica
│       │   ├── cap01.typ
│       │   ├── cap02.typ
│       │   └── ...
│       ├── oral_tracker.json                     # Memoria evolutiva e compatta delle esposizioni
│       ├── study_state.json                      # Stato avanzamento per ripresa istantanea sessione
│       ├── <MATERIA>_STUDIO.typ                  # Master document libro di testo (include src/*.typ)
│       ├── <MATERIA>_STUDIO.pdf                  # Output PDF libro di testo (UNICO)
│       ├── <MATERIA>_ESPOSIZIONE.typ             # Master document guida orale
│       ├── <MATERIA>_ESPOSIZIONE.pdf             # Output PDF guida orale (UNICO)
│       ├── <MATERIA>_VERIFICA_PROGRESSO.typ
│       ├── <MATERIA>_VERIFICA_PROGRESSO.pdf
│       ├── <MATERIA>_CHEATSHEET.typ              # (Generato su richiesta prima dell'appello)
│       └── <MATERIA>_CHEATSHEET.pdf              # (Generato su richiesta prima dell'appello)
└── README.md                                     # Documentazione ufficiale di distribuzione (Versione 1.0)
```

---

## 🧭 Onboarding Iniziale & Guida Proattiva per lo Studente

All'apertura del primo dialogo in assoluto o all'avvio di una nuova materia, l'AI accoglie lo studente con la **presentazione ufficiale delle potenzialità del framework** e calibra la strategia didattica:

### 1. Il Messaggio di Presentazione Ufficiale & Calibrazione (Primo Avvio)
> *«🎓 **STEM Study Master (v1.0) — Sistema Operativo di Studio & Verbalizzazione Orale**  
>  
> Ciao! Sono il tuo tutor ingegneristico personale per la preparazione e la verbalizzazione dei tuoi esami universitari STEM.  
>  
> Ecco cosa faremo insieme attraverso questa cartella:  
> 1. 📖 **Libro di Testo Integrale (`_STUDIO.pdf`):** Incolli i tuoi appunti grezzi (manoscritti, digitali o slide) e io li trascrivo fedelmente in un PDF editoriale ad altissima definizione (tramite Typst), con formule rigorose, dimostrazioni integrali, abachi ritagliati al millimetro e tabelle a prova di trabocchetto.  
> 2. 🗣️ **Guida per l'Orale (`_ESPOSIZIONE.pdf`):** Redigo un testo a zero immagini calibrato sulla tua cadenza di voce, con il box operativo **`✏️ Cosa Disegna la Mano Mentre Parli`** che ti guida passo-passo su cosa tracciare sul foglio bianco all'esame.  
> 3. 🧠 **Memoria Evolutiva delle Ripetizioni:** Mi invii la trascrizione vocale di quando ripeti ad alta voce; io correggo la parlata, tengo traccia dei tuoi progressi e ti interrogo come un professore.  
> 4. 🎯 **Quiz Interattivo in Tempo Reale:** Quando ti senti pronto, puoi selezionare le risposte a schermo con clic o frecce della tastiera con feedback immediato, e ogni errore viene archiviato automaticamente nel tuo **Quaderno degli Errori** (`_VERIFICA_PROGRESSO.pdf`).  
> 5. ⚡ **Scheda di Sopravvivenza (`_CHEATSHEET.pdf`):** 24 ore prima dell'esame ti compilo un riassunto a 2 colonne di 2 pagine con i divieti assoluti da non dire alla commissione.  
>  
> Non preoccuparti di ricordare tutti i comandi: sarò io a guidarti passo dopo passo e a suggerirti cosa fare in base a come avanza il tuo studio.  
>  
> ---  
> **Per iniziare e calibrare il nostro piano di lavoro, rispondimi a queste 4 domande:**  
> 1. *Di quale esame si tratta?*  
> 2. *Quando prevedi di sostenere l'appello?*  
> 3. *A quale fascia di voto ambisci (es. 24–27, 28–30, 30 e Lode)?*  
> 4. *Incolla il PDF degli appunti nella cartella `subjects/<NomeMateria>/source/appunti_grezzi.pdf` e dimmi da quale blocco di pagine vuoi partire!»*

### 2. Suggerimenti Proattivi Durante lo Studio (Tutor Intelligente)
Durante il corso delle settimane, l'utente potrebbe non ricordare tutte le potenzialità della skill. L'assistente monitora l'andamento in `study_state.json` e `oral_tracker.json` e propone proattivamente il passo più utile:
* **Dopo l'elaborazione di un capitolo impegnativo:**  
  *«Ho compilato il Capitolo N. Ora prenditi il tuo tempo per leggere il PDF in autonomia. Quando avrai terminato lo studio, potremo: (A) fare una simulazione orale vocale con "Valuta esposizione", oppure (B) chiarire eventuali passaggi poco chiari con il protocollo didattico su 3 livelli.»*
* **Se lo studente è caduto in tranelli nel quiz:**  
  *«Ho registrato nel Quaderno degli Errori i concetti critici emersi dal quiz. Prima di avanzare al capitolo successivo, ti suggerisco un mini-ripasso a voce di 2 minuti sulle formule o sulle condizioni al contorno che hanno generato dubbi.»*
* **A ridosso della data dell'esame:**  
  *«Mancano 48 ore al tuo appello: desideri che compili il **Cheatsheet di Sopravvivenza** di 2-3 pagine a 2 colonne con i divieti assoluti d'esame da ripassare prima di entrare?»*

---

## ⚙️ Protocolli Operativi & Script PowerShell

### 1. Scaffolding Automatico Nuova Materia (`init_subject.ps1`)
Istanzia l'albero delle directory, copia `macros.typ`, crea `study_state.json` e `oral_tracker.json` (in formato UTF-8 No BOM), configura i 3 documenti master Typst e compila la prima versione della Dashboard `_VERIFICA_PROGRESSO.pdf`.  
*(Nota operativa: su ambiente Windows con restrizioni di sandbox, eseguire il comando con elevazione/permessi completi `BypassSandbox: true` per consentire la creazione della nuova alberatura in `subjects/`)*:
```powershell
powershell -ExecutionPolicy Bypass -File ".gemini/skills/stem-study-master/scripts/init_subject.ps1" -SubjectName "<NomeMateria>" -TotalPages <PagineTotali> -ExamDate "<DataAppello>" -TargetGrade "<VotoObiettivo>"
```

### 2. Ingestione Intelligente della Sorgente (`extract_pages.ps1`)
* **Regola Tassativa sulla Granularità dei Blocchi (Limite 20–30 Pagine):**  
  È fatto divieto assoluto di estrarre o elaborare dispense intere o blocchi superiori a 30 pagine in un'unica sessione. Se l'utente richiede di elaborare un PDF esteso (es. 100–150 pagine), l'AI suddivide proattivamente il materiale in capitoli o blocchi modulari da **20–30 pagine massimo** (intervallo ottimale: 15–25 pp.). Lo script `extract_pages.ps1` include un blocco di sicurezza che rifiuta estrazioni superiori a 30 pagine per evitare saturazione di memoria e perdita di precisione analitica.
* **Pagine Digitali Pure:** L'assistente legge direttamente il flusso testuale e matematico con `read_file`.
* **Pagine Scansionate o Ibride:** Renderizza l'intervallo di pagine in PNG ad alta definizione (1400px larghezza) in `subjects/<Materia>/temp_raw/`:
```powershell
powershell -ExecutionPolicy Bypass -File ".gemini/skills/stem-study-master/scripts/extract_pages.ps1" -PdfPath "subjects/<Materia>/source/<file>.pdf" -StartPage <N1> -EndPage <N2> -OutDir "subjects/<Materia>/temp_raw"
```

### 3. Ritaglio Chirurgico con Padding Protettivo (`crop_asset.ps1`)
Ritaglia figure e abachi da `temp_raw/` in coordinate normalizzate ($0.0 - 1.0$) applicando un **padding di sicurezza del +5% predefinito** per preservare etichette, apici e frecce degli assi. Con `-CleanSourcePage`, elimina automaticamente la scansione temporanea a pagina intera:
```powershell
powershell -ExecutionPolicy Bypass -File ".gemini/skills/stem-study-master/scripts/crop_asset.ps1" -SourcePath "subjects/<Materia>/temp_raw/page_<NN>.png" -DestPath "subjects/<Materia>/assets/p<NN>_<nome>.png" -NormX <x> -NormY <y> -NormW <w> -NormH <h> -Padding 0.05 -CleanSourcePage
```

### 4. Compilazione Deterministica Typst (`compile_pdf.ps1`)
Compila qualunque documento master Typst invocando `tools/typst/typst.exe` con radice di progetto dinamica (`--root`):
```powershell
powershell -ExecutionPolicy Bypass -File ".gemini/skills/stem-study-master/scripts/compile_pdf.ps1" -InputFile "subjects/<Materia>/<MATERIA>_STUDIO.typ"
```

---

## 🔄 Il Flusso di Studio Completo

### Fase 0 — Inizializzazione della Materia & Calibrazione Vocale
1. L'AI presenta il framework, raccoglie i 4 parametri iniziali ed esegue `init_subject.ps1`.
2. Verifica `config/style_profile.json`: se lo studente desidera personalizzare l'impronta vocale rispetto al profilo ingegneristico preimpostato, richiede 10–15 righe di esposizione spontanea e salva la matrice stilistica.

### Fase 1 — Rituale di Ripresa Intelligente della Sessione
All'apertura di ogni sessione successiva (*«Ciao, riprendiamo lo studio»*), l'AI legge istantaneamente `study_state.json` e accoglie lo studente con un micro-quadro di 3 righe:
1. *Avanzamento attuale:* Pagine elaborate su totale e percentuale di completamento;
2. *Punti caldi:* Eventuali argomenti critici aperti o dubbi registrati nell'ultima sessione;
3. *Proposta operativa del giorno:* Ripasso a voce del capitolo precedente o ingestione del blocco successivo.

### Fase 2 — Elaborazione del Blocco di Studio (`_STUDIO.pdf`)
Per ogni blocco assegnato dallo studente (es. *«Studiamo pp. 21–40»*):
1. Estrae le pagine in `temp_raw/` e ritaglia le figure in `assets/` con margine di sicurezza del 5%.
2. Redige il modulo `src/cap<NN>.typ` (con `#import "macros.typ": *`) integrando ponti narrativi, formule rigorose Typst, figure con `#figura`, tabelle trabocchetti, domande d'esame con risposta modello e glossario.
3. Svuota completamente `temp_raw/` da ogni file temporaneo.
4. Aggiunge `#include "src/cap<NN>.typ"` nel master `<MATERIA>_STUDIO.typ` e ricompila il PDF unico.
5. Aggiorna la Dashboard a Pagina 1 di `<MATERIA>_VERIFICA_PROGRESSO.pdf` e sincronizza `study_state.json`.

### Fase 3 — Redazione dell'Esposizione Orale (`_ESPOSIZIONE.pdf`)
1. Genera il discorso continuo a catena logica causa-effetto nel modulo `src/esposizione_cap<NN>.typ`.
2. Inserisce i box operativi `✏️ Cosa Disegna la Mano Mentre Parli` (`#disegno`) e le domande flash di autoverifica (`#autoverifica`).
3. Rispetta rigorosamente la regola **Zero Immagini**.
4. Include il modulo in `<MATERIA>_ESPOSIZIONE.typ` e ricompila il PDF unico.
5. L'AI conclude consegnando i PDF compilati e lasciando spazio allo **studio autonomo** dello studente (senza mai forzare quiz non richiesti).

### Fase 4 — Ecosistema di Verifica Attiva (Attivato solo su Richiesta Esplicita)

#### Modalità A: «Valuta esposizione» (Memoria evolutiva e filtro fonetico)
* Lo studente invia la trascrizione vocale del capitolo (o di più capitoli cumulativi).
* **Filtro Fonetico Intelligente (Speech-to-Text Normalizer):** L'AI riconosce e corregge automaticamente gli artefatti acustici della dettatura vocale dello smartphone (es. termini tecnici specifici storpiati dall'algoritmo di riconoscimento vocale), senza penalizzare lo studente come errore concettuale.
* L'AI consulta `oral_tracker.json` (~200 token) e valuta la prova confrontandola con le sessioni precedenti:
  1. *Progressi:* concetti esposti con maggiore padronanza ed errori pregressi corretti;
  2. *Recuperi:* argomenti precedentemente omessi che ora sono stati verbalizzati;
  3. *Omissioni vs Tagli Intenzionali:* se un concetto manca, l'AI chiede se si tratta di una dimenticanza o di un taglio deliberato per l'esame. Se confermato come taglio intenzionale, viene registrato nel JSON, escluso da future segnalazioni e rimosso da `_ESPOSIZIONE.typ`;
  4. *Aggiornamento Stile:* integra nella guida orale formulazioni spontanee particolarmente efficaci;
  5. *Interrogazione:* conclude ponendo **2–3 domande aperte da docente**.

#### Modalità B: «Fammi il quiz sul Capitolo X» (Widget di Selezione Istantanea)
* **Regola di Neutralità Assoluta delle Opzioni:** Tutte le opzioni somministrate nel widget `ask_question` devono essere neutre, prive di etichette quali `(Recommended)` e disposte in ordine casuale.
* **Ciclo 1-a-1 con Feedback Immediato a Schermo:** I quesiti vengono erogati singolarmente:
  $$\text{Widget Domanda } N \longrightarrow \text{Scelta Utente} \longrightarrow \text{Feedback Immediato (✅ / ❌ + Tranello Fisico)} \longrightarrow \text{Widget Domanda } N+1$$
* **Aggiornamento Istantaneo del PDF al Termine del Quiz:** All'ultima domanda:
  1. Calcola il punteggio finale (es. $4/5$, $80\%$);
  2. Compila automaticamente le schede `#errore` in `<MATERIA>_VERIFICA_PROGRESSO.typ` riportando quesito, opzione errata selezionata, tranello fisico e regola d'oro;
  3. **Compila immediatamente il PDF** affinché nessun dato vada perso;
  4. Aggiorna lo stato in `study_state.json`;
  5. Solo dopo il salvataggio del PDF propone l'eventuale mini-ripasso a caldo sui punti critici.

#### Modalità C: «Simula esame»
* L'AI formula una domanda trasversale a sorpresa che connette più capitoli affrontati.
* Lo studente deve esporre la risposta **descrivendo a voce ciò che traccia sul foglio bianco**.
* L'AI valuta sia la completezza teorica che la coordinazione con i passaggi dei box *"Cosa Disegna la Mano Mentre Parli"*.

### Fase 5 — Protocollo Pedagogico di Chiarimento su Richiesta
Se lo studente indica che un concetto o passaggio non è chiaro (*«Non ho capito questo passaggio...»*):
1. L'AI risponde in chat strutturando la spiegazione su **3 livelli progressivi**:
   * *Livello 1 — Intuizione Fisica & Immagine Mentale:* analogia pratica o modello fenomenologico reale;
   * *Livello 2 — Meccanica del Processo:* bilancio delle forze, tensioni e vincoli cinematici;
   * *Livello 3 — Raccordo Matematico:* derivazione dell'equazione costitutiva formale.
2. La discussione si sviluppa interattivamente in chat senza alterare prematuramente i PDF.
3. Chiarito il dubbio, l'AI propone di archiviare l'analogia nel libro di testo: se approvato, inserisce un box `#integrazione[...]` nel capitolo e ricompila `_STUDIO.pdf`.

### Fase 6 — Compilazione del Cheatsheet Pre-Esame (`_CHEATSHEET.pdf`)
A richiesta dello studente prima dell'appello, l'AI genera la scheda di sopravvivenza di 2–3 pagine A4 a 2 colonne basata su [templates/cheatsheet.typ](file:///C:/Users/GioPC/Desktop/Study-Skill/.gemini/skills/stem-study-master/templates/cheatsheet.typ) aggregando formule, divieti assoluti e mappa sintetica di tutti i capitoli.

---

## ⚡ Linee Guida di Stile Typst & Regole di Compilazione

Tutti i documenti Typst del framework rispettano le seguenti convenzioni:
* **Formato:** Carta `a4`, margini `2.5cm`, testo giustificato, interlinea `0.75em`.
* **Font primari (Windows):** `("Segoe UI", "Calibri", "Arial")` per massima leggibilità su monitor, tablet e stampa.
* **Checklist Sintattica Typst Pre-Compilazione (Zero LaTeX):**
  * Simboli greci scritti direttamente: `$tau$`, `$gamma$`, `$rho$`, `$sigma$`, `$nu$`, `$Delta$`, `$omega$` (mai `$\tau$`, `$\sigma$`);
  * Derivate parziali: usare sempre `$partial$`, es. `$(partial u) / (partial z)$` (mai `$diff$`);
  * Differenziali ordinari: usare `dif`, es. `$integral y dif A$` o `$(dif y) / (dif x)$`;
  * Frazioni: `$a / b$` o `$frac(a, b)$` (mai `$\frac{a}{b}$`);
  * Radici: `$sqrt(x)$` (mai `$\sqrt{x}$`);
  * Integrali di circuito o ciclo: `$integral.cont$` (mai `$\oint$`);
  * Minore o uguale / Maggiore o uguale: `$lt.eq$` e `$gt.eq$` (mai `$\le$`, `$\ge$`);
  * Pedici multi-carattere: racchiudere tra parentesi tonde con spazio, es. `$f_(y d)$`, `$gamma_(x z)$` (mai `$f_{yd}$`).
* **Regola Anti-Orfane:** Tutte le intestazioni e i box operativi utilizzano la direttiva `block(breakable: false)[...]` per impedire che titoli o tabelle trabocchetto rimangano orfani a fondo pagina.
