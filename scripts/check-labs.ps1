param([string]$LabDirectory)
$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
$agdaExe = Join-Path $projectRoot '.tools\agda\agda.exe'
if (-not $LabDirectory) { $LabDirectory = Join-Path $projectRoot 'MM8036 - Type Theory\2. Learning Material\labs\solutions' }
$labDirectory = (Resolve-Path -LiteralPath $LabDirectory).Path
$env:AGDA_DIR = Join-Path $projectRoot '.tools\agda\data'
New-Item -ItemType Directory -Path $env:AGDA_DIR -Force | Out-Null
$env:Agda_datadir = $env:AGDA_DIR
$env:GHC_CHARENC = 'UTF-8'
$labFiles = @(Get-ChildItem -LiteralPath $labDirectory -Filter 'Lab*.agda' | Sort-Object Name)
if ($labFiles.Count -eq 0) { throw 'No Lab*.agda files found in the selected directory.' }
foreach ($labFile in $labFiles) {
  & $agdaExe --safe --without-K --no-libraries -i $labDirectory $labFile.FullName
  if ($LASTEXITCODE -ne 0) { throw "Agda verification failed: $($labFile.Name)" }
  Write-Output "Verified $($labFile.Name)"
}
