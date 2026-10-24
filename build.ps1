param([switch]$All, [ValidateSet('MM5020','MM7030','MM8036','MM7033')][string]$Course, [switch]$StudyMap)
$ErrorActionPreference = 'Stop'
$projectRoot = $PSScriptRoot
$typstExe = Join-Path $projectRoot '.tools\typst\typst-x86_64-pc-windows-msvc\typst.exe'
if (-not (Test-Path -LiteralPath $typstExe)) { throw 'Portable Typst is missing. Run scripts\setup-tools.ps1.' }
if (-not $All -and -not $Course -and -not $StudyMap) { throw 'Use -All, -Course MM5020, or -StudyMap.' }
if ($All -or $StudyMap) {
  & $typstExe compile --root $projectRoot --ignore-system-fonts (Join-Path $projectRoot 'STUDY-MAP.typ') (Join-Path $projectRoot 'STUDY-MAP.pdf')
  if ($LASTEXITCODE -ne 0) { throw 'Study-map compilation failed.' }
}
$selectedCourses = Get-ChildItem -LiteralPath $projectRoot -Directory | Where-Object { $_.Name -match '^MM\d{4} - ' -and ($All -or ($Course -and $_.Name.StartsWith($Course))) }
foreach ($courseDir in $selectedCourses) {
  foreach ($relative in @('1. Lectures\lectures.typ','2. Learning Material\handbook.typ','3. Exercises\exercises.typ','3. Exercises\hints.typ','3. Exercises\solutions.typ')) {
    $sourceFile = Join-Path $courseDir.FullName $relative
    $pdfFile = [IO.Path]::ChangeExtension($sourceFile, '.pdf')
    & $typstExe compile --root $projectRoot --ignore-system-fonts $sourceFile $pdfFile
    if ($LASTEXITCODE -ne 0) { throw "Compilation failed: $sourceFile" }
    Write-Output "Built $($courseDir.Name) / $relative"
  }
}
