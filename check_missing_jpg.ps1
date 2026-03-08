$targetDir = "d:\workspace\ai\live2dstore\live2d-model-assets\moc"

if (-not (Test-Path $targetDir)) {
    Write-Host "Directory not found: $targetDir" -ForegroundColor Red
    exit
}

$zipFiles = Get-ChildItem -Path $targetDir -Filter "*.zip"
$missingJpg = @()

Write-Host "Scanning directory: $targetDir"
Write-Host "Found $($zipFiles.Count) zip files."
Write-Host ("-" * 30)

foreach ($zip in $zipFiles) {
    $baseName = $zip.BaseName
    # Replace - and . with _ according to user instruction
    $jpgBaseName = $baseName -replace '[-.]', '_'
    $jpgPath = Join-Path $targetDir "$jpgBaseName.jpg"
    
    if (-not (Test-Path $jpgPath)) {
        $missingJpg += @{ Zip = $zip.Name; ExpectedJpg = "$jpgBaseName.jpg" }
    }
}

if ($missingJpg.Count -gt 0) {
    Write-Host "Found $($missingJpg.Count) zip files without corresponding jpg:" -ForegroundColor Yellow
    foreach ($item in $missingJpg) {
        Write-Host "$($item.Zip) (Expected: $($item.ExpectedJpg))"
    }
} else {
    Write-Host "All zip files have corresponding jpg files." -ForegroundColor Green
}
