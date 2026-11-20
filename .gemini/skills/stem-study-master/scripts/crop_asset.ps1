param(
    [Parameter(Mandatory=$true)][string]$SourcePath,
    [Parameter(Mandatory=$true)][string]$DestPath,
    [Parameter(Mandatory=$true)][double]$NormX,
    [Parameter(Mandatory=$true)][double]$NormY,
    [Parameter(Mandatory=$true)][double]$NormW,
    [Parameter(Mandatory=$true)][double]$NormH,
    [Parameter(Mandatory=$false)][double]$Padding = 0.05,
    [switch]$CleanSourcePage
)

if (-not (Test-Path $SourcePath)) {
    Write-Error "Immagine sorgente per il ritaglio non trovata: $SourcePath"
    exit 1
}

Add-Type -AssemblyName System.Drawing

$resolvedSrc = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($SourcePath)
$resolvedDest = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($DestPath)

$srcImg = [System.Drawing.Bitmap]::FromFile($resolvedSrc)

# Calcolo coordinate normalizzate con padding di sicurezza (+5% predefinito)
$padX = $NormW * $Padding
$padY = $NormH * $Padding

$adjX = [Math]::Max(0.0, $NormX - $padX)
$adjY = [Math]::Max(0.0, $NormY - $padY)
$adjW = [Math]::Min(1.0 - $adjX, $NormW + (2 * $padX))
$adjH = [Math]::Min(1.0 - $adjY, $NormH + (2 * $padY))

$x = [int]([Math]::Round($srcImg.Width * $adjX))
$y = [int]([Math]::Round($srcImg.Height * $adjY))
$w = [int]([Math]::Min($srcImg.Width - $x, [Math]::Round($srcImg.Width * $adjW)))
$h = [int]([Math]::Min($srcImg.Height - $y, [Math]::Round($srcImg.Height * $adjH)))

$rect = New-Object System.Drawing.Rectangle($x, $y, $w, $h)
$cropped = $srcImg.Clone($rect, $srcImg.PixelFormat)

$parentDir = Split-Path -Parent $resolvedDest
if ($parentDir -and -not (Test-Path $parentDir)) {
    New-Item -ItemType Directory -Path $parentDir -Force | Out-Null
}

$ms = New-Object System.IO.MemoryStream
$cropped.Save($ms, [System.Drawing.Imaging.ImageFormat]::Png)
[System.IO.File]::WriteAllBytes($resolvedDest, $ms.ToArray())

$ms.Dispose()
$cropped.Dispose()
$srcImg.Dispose()

Write-Host "Ritaglio completato (con padding $($Padding*100)%): $DestPath ($w x $h px)"

if ($CleanSourcePage -and (Test-Path $resolvedSrc)) {
    Remove-Item -Path $resolvedSrc -Force -ErrorAction SilentlyContinue
    Write-Host "Scansione sorgente eliminata per pulizia: $resolvedSrc"
}
exit 0
