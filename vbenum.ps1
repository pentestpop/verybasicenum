# Disable command echoing (optional, for clarity during execution)
$ProgressPreference = 'SilentlyContinue'

# Whoami equivalent
Write-Host "=========================="
Write-Host "Whoami:"
Write-Host "=========================="
whoami
Write-Host ""

# Privileges (using Whoami /priv)
Write-Host "=========================="
Write-Host "Privileges:"
Write-Host "=========================="
whoami /priv
Write-Host ""

# User Information
Write-Host "=========================="
Write-Host "User Information:"
Write-Host "=========================="
net user
Write-Host ""

# Domain User Information
Write-Host "=========================="
Write-Host "Domain User Information:"
Write-Host "=========================="
net user /domain
Write-Host ""

# System Information
Write-Host "=========================="
Write-Host "System Information:"
Write-Host "=========================="
systeminfo
Write-Host ""

# Network Configuration (IPConfig)
Write-Host "=========================="
Write-Host "Network Configuration:"
Write-Host "=========================="
ipconfig
Write-Host ""

# Directory Listing
Write-Host "=========================="
Write-Host "Directory Listing of C:\"
Write-Host "=========================="
Get-ChildItem C:\
Write-Host ""

# Installed Programs from Wow6432Node (32-bit applications)
Write-Host "=========================="
Write-Host "Installed Programs (Wow6432Node):"
Write-Host "=========================="
Get-ItemProperty 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object DisplayName
Write-Host ""

# Installed Programs from HKLM (64-bit applications)
Write-Host "=========================="
Write-Host "Installed Programs (HKLM):"
Write-Host "=========================="
Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object DisplayName
Write-Host ""

# Running Processes
Write-Host "=========================="
Write-Host "Running Processes:"
Write-Host "=========================="
Get-Process
Write-Host ""

# PowerShell History
Write-Host "=========================="
Write-Host "PowerShell ConsoleHost History:"
Write-Host "=========================="
Get-Content "$HOME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
Write-Host ""
