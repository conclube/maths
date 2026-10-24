$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path $PSScriptRoot -Parent
$toolRoot = Join-Path $projectRoot '.tools'
New-Item -ItemType Directory -Path $toolRoot -Force | Out-Null
$toolsToInstall = @(
  @{name='typst'; version='0.15.1'; url='https://github.com/typst/typst/releases/download/v0.15.1/typst-x86_64-pc-windows-msvc.zip'; sha='19CE3551153C2FE7EE9FA2F95208310C8F4D3209FEDB699E0333FAF8913F6736'},
  @{name='agda'; version='2.8.0.2'; url='https://github.com/agda/agda/releases/download/v2.8.0.2/Agda-v2.8.0.2-win64.zip'; sha='755E19A9244019A3B08A67104DC5A93BD662A7634C4F02A1F34E06B59251B7FC'}
)
foreach ($tool in $toolsToInstall) {
  $archivePath = Join-Path $toolRoot ($tool.name + '.zip')
  if (-not (Test-Path -LiteralPath $archivePath)) { Invoke-WebRequest -Uri $tool.url -OutFile $archivePath }
  if ((Get-FileHash -LiteralPath $archivePath -Algorithm SHA256).Hash -ne $tool.sha) { throw "Checksum mismatch for $($tool.name)" }
  Expand-Archive -LiteralPath $archivePath -DestinationPath (Join-Path $toolRoot $tool.name) -Force
  Write-Output "$($tool.name) $($tool.version) ready"
}
