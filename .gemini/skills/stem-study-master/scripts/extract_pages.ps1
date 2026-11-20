param(
    [Parameter(Mandatory=$true)][string]$PdfPath,
    [Parameter(Mandatory=$true)][int]$StartPage,
    [Parameter(Mandatory=$true)][int]$EndPage,
    [Parameter(Mandatory=$true)][string]$OutDir,
    [int]$DestinationWidth = 1400
)

if (-not (Test-Path $PdfPath)) {
    Write-Error "File PDF sorgente non trovato: $PdfPath"
    exit 1
}

Add-Type -AssemblyName System.Runtime.WindowsRuntime
$asTaskGeneric = ([System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object { 
    $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and $_.IsGenericMethod 
})[0]

function Await($winRtOp, $resultType) {
    $m = $asTaskGeneric.MakeGenericMethod($resultType)
    $task = $m.Invoke($null, @($winRtOp))
    $task.Wait()
    return $task.Result
}

function AwaitAction($winRtAction) {
    $asTaskAction = ([System.WindowsRuntimeSystemExtensions].GetMethods() | Where-Object { 
        $_.Name -eq 'AsTask' -and $_.GetParameters().Count -eq 1 -and -not $_.IsGenericMethod 
    })[0]
    $task = $asTaskAction.Invoke($null, @($winRtAction))
    $task.Wait()
}

[Windows.Data.Pdf.PdfDocument, Windows.Data.Pdf, ContentType = WindowsRuntime] | Out-Null
[Windows.Storage.StorageFile, Windows.Storage, ContentType = WindowsRuntime] | Out-Null
[Windows.Storage.StorageFolder, Windows.Storage, ContentType = WindowsRuntime] | Out-Null
[Windows.Storage.Streams.IRandomAccessStream, Windows.Storage.Streams, ContentType = WindowsRuntime] | Out-Null

if (-not (Test-Path $OutDir)) {
    New-Item -ItemType Directory -Path $OutDir -Force | Out-Null
}

$resolvedPdf = (Resolve-Path $PdfPath).Path
$opFile = [Windows.Storage.StorageFile]::GetFileFromPathAsync($resolvedPdf)
$file = Await $opFile ([Windows.Storage.StorageFile])

$opDoc = [Windows.Data.Pdf.PdfDocument]::LoadFromFileAsync($file)
$doc = Await $opDoc ([Windows.Data.Pdf.PdfDocument])
Write-Host "PDF Caricato: $resolvedPdf (Pagine totali: $($doc.PageCount))"

$resolvedOut = (Resolve-Path $OutDir).Path
$opFolder = [Windows.Storage.StorageFolder]::GetFolderFromPathAsync($resolvedOut)
$folder = Await $opFolder ([Windows.Storage.StorageFolder])

# Limite massimo di sicurezza per sessione (previene saturazione memoria e crash del contesto visivo)
$requestedCount = $EndPage - $StartPage + 1
if ($requestedCount -gt 30) {
    Write-Error "ERRORE DI SICUREZZA: Richiesta estrazione di $requestedCount pagine (da $StartPage a $EndPage). Il limite massimo consentito per sessione e' di 20-30 pagine per garantire massima precisione analitica e non saturare la memoria. Suddividere il PDF in blocchi/capitoli modulari (es. StartPage: $StartPage, EndPage: $($StartPage + 24))."
    exit 1
}

$firstIdx = [Math]::Max(0, $StartPage - 1)
$lastIdx = [Math]::Min($doc.PageCount - 1, $EndPage - 1)

for ($i = $firstIdx; $i -le $lastIdx; $i++) {
    $pageNum = $i + 1
    $page = $doc.GetPage($i)
    $renderOptions = [Windows.Data.Pdf.PdfPageRenderOptions]::new()
    $renderOptions.DestinationWidth = $DestinationWidth
    
    $fileName = "page_{0:D2}.png" -f $pageNum
    $opOut = $folder.CreateFileAsync($fileName, [Windows.Storage.CreationCollisionOption]::ReplaceExisting)
    $outFile = Await $opOut ([Windows.Storage.StorageFile])
    
    $opStream = $outFile.OpenAsync([Windows.Storage.FileAccessMode]::ReadWrite)
    $stream = Await $opStream ([Windows.Storage.Streams.IRandomAccessStream])
    
    $opRender = $page.RenderToStreamAsync($stream, $renderOptions)
    AwaitAction $opRender
    
    $stream.Dispose()
    $page.Dispose()
    Write-Host "Estratta pagina $pageNum -> $fileName"
}
exit 0
