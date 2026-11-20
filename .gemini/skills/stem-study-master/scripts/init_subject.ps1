param(
    [Parameter(Mandatory=$true)][string]$SubjectName,
    [Parameter(Mandatory=$false)][int]$TotalPages = 100,
    [Parameter(Mandatory=$false)][string]$ExamDate = "Da definire",
    [Parameter(Mandatory=$false)][string]$TargetGrade = "28-30L"
)

$ErrorActionPreference = "Stop"
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)

$repoRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot "..\..\..\.."))
$templatesDir = Join-Path $PSScriptRoot "..\templates"
$subjectDir = Join-Path $repoRoot "subjects\$SubjectName"

# 1. Creazione cartelle
$dirs = @("source", "assets", "src", "temp_raw")
foreach ($d in $dirs) {
    $target = Join-Path $subjectDir $d
    if (-not (Test-Path $target)) {
        New-Item -ItemType Directory -Path $target -Force | Out-Null
    }
}

# 2. Copia libreria grafica condivisa
Copy-Item (Join-Path $templatesDir "macros.typ") (Join-Path $subjectDir "src\macros.typ") -Force

# 3. Istanziazione JSON di monitoraggio (UTF-8 No BOM)
$studyState = [ordered]@{
    materia = $SubjectName
    versione = "1.0"
    data_inizio = (Get-Date).ToString("yyyy-MM-dd")
    data_appello = $ExamDate
    voto_obiettivo = $TargetGrade
    totale_pagine = $TotalPages
    ultima_pagina_elaborata = 0
    percentuale_completamento = 0
    stato_calibrazione_orale = "preimpostato"
    storico_sessioni = @()
    argomenti_critici_aperti = @()
    prossimo_blocco_consigliato = @(1, [Math]::Min(20, $TotalPages))
} | ConvertTo-Json -Depth 5
[System.IO.File]::WriteAllText((Join-Path $subjectDir "study_state.json"), $studyState, $utf8NoBom)

$oralTracker = [ordered]@{
    materia = $SubjectName
    versione = "1.0"
    data_creazione = (Get-Date).ToString("yyyy-MM-dd")
    sessioni_orali = @()
    tagli_intenzionali_concordati = @()
    terminologia_fonetica_mappata = @{}
    punti_forza_acquisiti = @()
} | ConvertTo-Json -Depth 5
[System.IO.File]::WriteAllText((Join-Path $subjectDir "oral_tracker.json"), $oralTracker, $utf8NoBom)

# 4. Istanziazione File Master Typst personalizzati
$cleanNameUpper = ($SubjectName -replace '_', ' ').ToUpper()
$cleanTitle = ($SubjectName -replace '_', ' ')

# Master STUDIO
$studioTpl = Get-Content (Join-Path $templatesDir "studio_master.typ") -Raw
$studioTpl = $studioTpl.Replace('TITOLO_DOCUMENTO', $cleanTitle).Replace('NOME_DISCIPLINA', $cleanNameUpper)
[System.IO.File]::WriteAllText((Join-Path $subjectDir "$($SubjectName)_STUDIO.typ"), $studioTpl, $utf8NoBom)

# Master ESPOSIZIONE
$espoTpl = Get-Content (Join-Path $templatesDir "esposizione_master.typ") -Raw
$espoTpl = $espoTpl.Replace('TITOLO_DOCUMENTO', $cleanTitle).Replace('NOME_DISCIPLINA', $cleanNameUpper)
[System.IO.File]::WriteAllText((Join-Path $subjectDir "$($SubjectName)_ESPOSIZIONE.typ"), $espoTpl, $utf8NoBom)

# Master VERIFICA_PROGRESSO
$veriTpl = Get-Content (Join-Path $templatesDir "verifica_progresso_master.typ") -Raw
$veriTpl = $veriTpl.Replace('TITOLO_DOCUMENTO', $cleanTitle).Replace('TOTALE_PAGINE', "$TotalPages").Replace('VOTO_OBIETTIVO', $TargetGrade).Replace('DATA_APPELLO', $ExamDate)
$veriPath = Join-Path $subjectDir "$($SubjectName)_VERIFICA_PROGRESSO.typ"
[System.IO.File]::WriteAllText($veriPath, $veriTpl, $utf8NoBom)

# 5. Compilazione iniziale della Dashboard di Verifica Progresso
$compileScript = Join-Path $PSScriptRoot "compile_pdf.ps1"
if (Test-Path $compileScript) {
    & $compileScript -InputFile $veriPath
}

Write-Host "Scaffolding v1.0 completato con successo per [$SubjectName] in: $subjectDir"
exit 0
