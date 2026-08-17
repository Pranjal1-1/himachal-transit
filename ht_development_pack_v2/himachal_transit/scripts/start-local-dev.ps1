param(
  [string]$AvdName = "pixel7",
  [string]$BackendPort = "3000",
  [switch]$Profile
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$backendDir = Join-Path $repoRoot "backend"
$mobileDir = Join-Path $repoRoot "mobile"

$env:JAVA_HOME = [Environment]::GetEnvironmentVariable("JAVA_HOME", "User")
$machinePath = [Environment]::GetEnvironmentVariable("Path", "Machine")
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
$env:Path = "$machinePath;$userPath"

$sdkRoot = Join-Path $env:LOCALAPPDATA "Android\sdk"
$adb = Join-Path $sdkRoot "platform-tools\adb.exe"
$emulator = Join-Path $sdkRoot "emulator\emulator.exe"

if (-not (Test-Path $adb)) { throw "adb not found at $adb" }
if (-not (Test-Path $emulator)) { throw "emulator not found at $emulator" }
if (-not (Test-Path $backendDir)) { throw "backend folder not found: $backendDir" }
if (-not (Test-Path $mobileDir)) { throw "mobile folder not found: $mobileDir" }

Write-Host "Using repo root: $repoRoot"
Write-Host "Using JAVA_HOME: $env:JAVA_HOME"

# Ensure adb is up.
& $adb start-server | Out-Null

$existingEmu = (& $adb devices | Select-String "^emulator-\d+\s+device" | ForEach-Object { ($_ -split "\s+")[0] } | Select-Object -First 1)
if (-not $existingEmu) {
  Write-Host "Starting emulator: $AvdName"
  Start-Process -FilePath $emulator -ArgumentList "-avd", $AvdName | Out-Null

  # Wait for a device to appear and complete boot.
  Write-Host "Waiting for emulator to boot..."
  $deadline = (Get-Date).AddMinutes(3)
  do {
    $existingEmu = (& $adb devices | Select-String "^emulator-\d+\s+device" | ForEach-Object { ($_ -split "\s+")[0] } | Select-Object -First 1)
    if ($existingEmu) {
      $boot = (& $adb -s $existingEmu shell getprop sys.boot_completed).Trim()
      if ($boot -eq "1") { break }
    }
  } while ((Get-Date) -lt $deadline)

  if (-not $existingEmu) { throw "Emulator did not appear in adb within timeout" }
  $bootNow = (& $adb -s $existingEmu shell getprop sys.boot_completed).Trim()
  if ($bootNow -ne "1") { throw "Emulator found ($existingEmu) but boot did not complete in time" }
}

Write-Host "Using emulator device: $existingEmu"

$backendCmd = "Set-Location '$backendDir'; `$env:PORT='$BackendPort'; `$env:JWT_SECRET='dev_jwt_secret_for_local_testing'; npm run dev"
Start-Process -FilePath "powershell" -ArgumentList "-NoExit", "-Command", $backendCmd | Out-Null
Write-Host "Backend launched in new PowerShell window on port $BackendPort"

$flutterModeArg = if ($Profile.IsPresent) { "--profile" } else { "" }
$flutterCmd = "Set-Location '$mobileDir'; flutter run $flutterModeArg -d $existingEmu"
Start-Process -FilePath "powershell" -ArgumentList "-NoExit", "-Command", $flutterCmd | Out-Null
Write-Host "Flutter launched in new PowerShell window on $existingEmu"

Write-Host "Done."
