# Disable command echoing (optional, for clarity during execution)
$ProgressPreference = 'SilentlyContinue'

# Whoami equivalent

Write-Host "==========================" -ForegroundColor Yellow
Write-Host "Whoami:" -ForegroundColor Red
Write-Host "==========================" -ForegroundColor Yellow
whoami | Write-Host -ForegroundColor White
Write-Host ""

# Privileges (using Whoami /priv)
Write-Host "==========================" -ForegroundColor Yellow
Write-Host "Privileges:" -ForegroundColor Red
Write-Host "==========================" -ForegroundColor Yellow
whoami /priv | Write-Host -ForegroundColor White
Write-Host ""

# User Information
Write-Host "==========================" -ForegroundColor Yellow
Write-Host "User Information:" -ForegroundColor Red
Write-Host "==========================" -ForegroundColor Yellow
net user $env:USERNAME | Write-Host -ForegroundColor White
Write-Host ""

# Domain User Information
Write-Host "==========================" -ForegroundColor Yellow
Write-Host "Domain User Information:" -ForegroundColor Red
Write-Host "==========================" -ForegroundColor Yellow
net user /domain | Write-Host -ForegroundColor White
Write-Host ""

# System Information
Write-Host "==========================" -ForegroundColor Yellow
Write-Host "System Information:" -ForegroundColor Red
Write-Host "==========================" -ForegroundColor Yellow
systeminfo | Write-Host -ForegroundColor White
Write-Host ""

# Network Configuration (IPConfig)
Write-Host "==========================" -ForegroundColor Yellow
Write-Host "Network Configuration:" -ForegroundColor Red
Write-Host "==========================" -ForegroundColor Yellow
ipconfig | Write-Host -ForegroundColor White
Write-Host ""

# Directory Listing
Write-Host "==========================" -ForegroundColor Yellow
Write-Host "Directory Listing of C:\" -ForegroundColor Red
Write-Host "==========================" -ForegroundColor Yellow
Get-ChildItem C:\ | Write-Host -ForegroundColor White
Write-Host ""

# Installed Programs from Wow6432Node (32-bit applications)
Write-Host "==========================" -ForegroundColor Yellow
Write-Host "Installed Programs (32 Bit):" -ForegroundColor Red
Write-Host "==========================" -ForegroundColor Yellow
Get-ItemProperty 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object DisplayName | Write-Host -ForegroundColor White
Write-Host ""

# Installed Programs from HKLM (64-bit applications)
Write-Host "==========================" -ForegroundColor Yellow
Write-Host "Installed Programs (64 Bit):" -ForegroundColor Red
Write-Host "==========================" -ForegroundColor Yellow
Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object DisplayName | Write-Host -ForegroundColor White
Write-Host ""

# Running Processes
Write-Host "==========================" -ForegroundColor Yellow
Write-Host "Running Processes:" -ForegroundColor Red | Write-Host -ForegroundColor White
Write-Host "==========================" -ForegroundColor Yellow
Get-Process
Write-Host ""

# PowerShell History
Write-Host "==========================" -ForegroundColor Yellow
Write-Host "PowerShell ConsoleHost History:" -ForegroundColor Red
Write-Host "==========================" -ForegroundColor Yellow
Get-Content "$HOME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" | Write-Host -ForegroundColor White
Write-Host ""
