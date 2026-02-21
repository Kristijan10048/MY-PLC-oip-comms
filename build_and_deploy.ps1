$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$Src = "$ScriptDir\demo\bin\windows"
$Dst = "$ScriptDir\..\MY-PLC-Open-Industry-Project\addons\oip_comms\bin\windows"

Write-Host "Building..."
Set-Location $ScriptDir
scons platform=windows debug_symbols=yes

if ($LASTEXITCODE -ne 0) {
    Write-Host "Build failed. Aborting." -ForegroundColor Red
    exit 1
}

Write-Host "Build successful. Copying DLL..."
New-Item -ItemType Directory -Force -Path $Dst | Out-Null
Copy-Item "$Src\*.dll" -Destination $Dst
Write-Host "Done. Files copied to $Dst" -ForegroundColor Green
