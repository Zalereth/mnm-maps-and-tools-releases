# Installs M&M Cartographer: downloads the newest version from this page, checks it, and runs it.
# Run it with:   irm https://raw.githubusercontent.com/Zalereth/mnm-overlay-releases/main/install.ps1 | iex
param([switch]$NoRun)
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$repo = 'Zalereth/mnm-overlay-releases'
Write-Host 'Looking for the newest version...'
$rel = Invoke-RestMethod "https://api.github.com/repos/$repo/releases/latest" -Headers @{ 'User-Agent' = 'mnm-install' }
$exe = $rel.assets | Where-Object name -eq 'MnM-Overlay-Beta.exe' | Select-Object -First 1
$sum = $rel.assets | Where-Object name -eq 'SHA256SUMS.txt' | Select-Object -First 1
if (-not $exe -or -not $sum) { throw 'The newest release has no installer on it yet.' }
$dir = Join-Path $env:TEMP 'MnM-Overlay-Install'
New-Item -ItemType Directory -Force $dir | Out-Null
$file = Join-Path $dir 'MnM-Overlay-Beta.exe'
Write-Host "Downloading $($rel.tag_name) (about 130 MB)..."
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest $exe.browser_download_url -OutFile $file -UseBasicParsing
$sumText = (Invoke-WebRequest $sum.browser_download_url -UseBasicParsing).Content
if ($sumText -is [byte[]]) { $sumText = [Text.Encoding]::UTF8.GetString($sumText) }
$want = ($sumText -split "`n" | Where-Object { $_ -match 'MnM-Overlay-Beta.exe' } | Select-Object -First 1).Trim().Split(' ')[0].ToLower()
$have = (Get-FileHash $file -Algorithm SHA256).Hash.ToLower()
if ($want -ne $have) { Remove-Item $file -Force; throw 'The download does not match its checksum, so it was deleted. Try again.' }
Unblock-File $file
Write-Host 'Checked. Starting the setup window...'
if (-not $NoRun) { Start-Process $file }

