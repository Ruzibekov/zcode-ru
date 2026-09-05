# ZCode RU - Windows installer. Installs Russian localization on any ZCode version.
# Usage (PowerShell): powershell -ExecutionPolicy Bypass -File install.ps1
# Rollback:          powershell -ExecutionPolicy Bypass -File install.ps1 -Restore
param([switch]$Restore)

$ErrorActionPreference = "Stop"
$Repo = "warment/zcode-ru"
$Version = "v2.0.3"
$Candidates = @(
  "$env:LOCALAPPDATA\Programs\zcode\resources",
  "$env:ProgramFiles\ZCode\resources",
  "${env:ProgramFiles(x86)}\ZCode\resources"
)
$Res = $Candidates | Where-Object { Test-Path (Join-Path $_ "app.asar") } | Select-Object -First 1
if (-not $Res) { Write-Host "ERROR: ZCode app.asar not found. Install ZCode Desktop first." -ForegroundColor Red; exit 1 }
$Asar = Join-Path $Res "app.asar"
$Backup = Join-Path $env:USERPROFILE ".zcode-ru-backup"
Write-Host "==> ZCode found: $Res"

if ($Restore) {
  $Stock = Join-Path $Backup "app.asar.stock"
  if (-not (Test-Path $Stock)) { Write-Host "ERROR: backup not found at $Stock" -ForegroundColor Red; exit 1 }
  $p = Get-Process -Name "ZCode" -ErrorAction SilentlyContinue
  if ($p) { Write-Host "==> Closing ZCode..."; $p | Stop-Process -Force; Start-Sleep -Seconds 3 }
  Copy-Item -Force $Stock $Asar
  Write-Host "==> Original restored. Starting ZCode..."
  Start-Process $Asar.Replace("\resources\app.asar", "\ZCode.exe").Replace("resources\ZCode.exe", "ZCode.exe") -ErrorAction SilentlyContinue
  exit 0
}

# download app-ru-win.asar from release
$tmp = Join-Path $env:TEMP "zcode-ru-asar"
New-Item -ItemType Directory -Force -Path $tmp, $Backup | Out-Null
$Url = "https://github.com/$Repo/releases/download/$Version/app-ru-win.asar"
Write-Host "==> Downloading $Url ..."
$Dest = Join-Path $tmp "app-ru-win.asar"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $Url -OutFile $Dest -UseBasicParsing
if ((Get-Item $Dest).Length -lt 100MB) { Write-Host "ERROR: download looks wrong ($((Get-Item $Dest).Length) bytes)" -ForegroundColor Red; exit 1 }

# close ZCode
$p = Get-Process -Name "ZCode" -ErrorAction SilentlyContinue
if ($p) { Write-Host "==> Closing ZCode..."; $p | Stop-Process -Force; Start-Sleep -Seconds 3 }

# backup + swap
if (-not (Test-Path (Join-Path $Backup "app.asar.stock"))) {
  Copy-Item $Asar (Join-Path $Backup "app.asar.stock")
  Write-Host "==> Backup saved to $Backup"
}
Copy-Item -Force $Dest $Asar
Write-Host "==> Russian asar installed."

# relaunch
$Exe = Get-ChildItem (Split-Path $Res -Parent) -Filter "ZCode.exe" -Recurse -Depth 1 | Select-Object -First 1
if ($Exe) { Start-Process $Exe.FullName; Write-Host "==> Done - ZCode restarted in Russian." }
else { Write-Host "==> Done. Start ZCode manually." }
