# Move files from model.2048\android\ to model.2048\ and remove empty android folder
# Move files from model.2048\android\ to model.1024mo\ and remove empty android folder  

$basePath = "src\nerco"

Get-ChildItem -Path $basePath -Directory | ForEach-Object {
    $subDir = $_.FullName
    $androidDir = Join-Path $subDir "model.1024\android"

    if (Test-Path $androidDir) {
        Write-Host "Processing: $subDir"

        # Move files from android\ to model.2048\
        Get-ChildItem -Path $androidDir -File | ForEach-Object {
            $destPath = Join-Path (Split-Path $androidDir -Parent) $_.Name
            Move-Item -Path $_.FullName -Destination $destPath -Force
            Write-Host "  Moved: $($_.Name)"
        }

        # Remove empty android folder
        Remove-Item -Path $androidDir -Force
        Write-Host "  Removed: android"
    }
}

Write-Host "Done!"
