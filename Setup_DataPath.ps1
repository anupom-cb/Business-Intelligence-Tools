# Points the Power BI project at the Data folder next to this script.
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$data = Join-Path $root 'Data'
if (-not $data.EndsWith('\')) { $data += '\' }
$f = Join-Path $root 'Experiment6.SemanticModel\definition\expressions.tmdl'
$c = Get-Content -Raw -Encoding UTF8 $f
$c = [regex]::Replace($c, '(expression DataFolderPath = ")[^"]*(")', { param($m) $m.Groups[1].Value + $data + $m.Groups[2].Value })
[IO.File]::WriteAllText($f, $c, (New-Object System.Text.UTF8Encoding $false))
Write-Host "Data folder set to: $data"
Write-Host "Now double-click Experiment6.pbip to open it in Power BI Desktop."
