param(
  [Parameter(Position=0)]
  [string]$Dir = "."
)

$targetDir = (Resolve-Path -LiteralPath $Dir).Path

Get-ChildItem -LiteralPath $targetDir -Directory | Sort-Object Name | ForEach-Object {
  $subdir = $_
  $zipPath = Join-Path $targetDir ($subdir.Name + ".zip")

  if (Test-Path -LiteralPath $zipPath) {
    Write-Host ("SKIP (exists): {0}" -f $zipPath)
    return
  }

  Write-Host ("ZIP  : {0} -> {1}" -f $subdir.FullName, $zipPath)
  Compress-Archive -LiteralPath $subdir.FullName -DestinationPath $zipPath -CompressionLevel Optimal
}