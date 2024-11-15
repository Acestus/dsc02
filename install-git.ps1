# Install Git
Write-Host "Installing Git..."
Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.1/Git-2.42.0-64-bit.exe" -OutFile "$env:TEMP\GitSetup.exe"
Start-Process -FilePath "$env:TEMP\GitSetup.exe" -ArgumentList "/VERYSILENT", "/NORESTART" -Wait
Remove-Item "$env:TEMP\GitSetup.exe"
