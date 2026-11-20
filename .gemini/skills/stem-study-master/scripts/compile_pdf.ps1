param(
    [Parameter(Mandatory=$true)][string]$InputFile,
    [Parameter(Mandatory=$false)][string]$OutputFile
)

if (-not (Test-Path $InputFile)) {
    Write-Error "File sorgente Typst non trovato: $InputFile"
    exit 1
}

# Calcola la radice del repository (4 livelli sopra rispetto alla cartella scripts)
$repoRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot "..\..\..\.."))
$typstExe = Join-Path $repoRoot "tools\typst\typst.exe"

if (-not (Test-Path $typstExe)) {
    if (Test-Path "tools\typst\typst.exe") {
        $typstExe = (Resolve-Path "tools\typst\typst.exe").Path
    } else {
        $typstExe = (Get-Command "typst.exe" -ErrorAction SilentlyContinue).Source
    }
}

if (-not (Test-Path $typstExe)) {
    Write-Error "Typst non trovato in $typstExe. Assicurarsi che tools\typst\typst.exe sia presente."
    exit 1
}

$resolvedTypst = (Resolve-Path $typstExe).Path
$resolvedInput = (Resolve-Path $InputFile).Path
$projectRoot = $repoRoot

if ($OutputFile) {
    & $resolvedTypst compile --root $projectRoot $resolvedInput $OutputFile
} else {
    & $resolvedTypst compile --root $projectRoot $resolvedInput
}

if ($LASTEXITCODE -eq 0) {
    Write-Host "Compilazione PDF completata con successo: $InputFile -> PDF"
    exit 0
} else {
    Write-Error "Errore durante la compilazione Typst."
    exit 1
}
