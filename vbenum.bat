@echo off
echo ===========================
echo Whoami:
echo ===========================
whoami
echo.

echo ===========================
echo Privileges:
echo ===========================
whoami /priv
echo.

echo ===========================
echo User Information:
echo ===========================
net user
echo.

echo ===========================
echo Domain User Information:
echo ===========================
net user /domain
echo.

echo ===========================
echo System Information:
echo ===========================
systeminfo
echo.

echo ===========================
echo Network Configuration:
echo ===========================
ipconfig
echo.

echo ===========================
echo C Drive:
echo ===========================
dir C:\
echo.

echo ===========================
echo Installed 32 bit:
echo ===========================
powershell -Command "Get-ItemProperty 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | select displayname"
echo.

echo ===========================
echo Installed 64 bit:
echo ===========================
powershell -Command "Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*' | Select-Object displayname"
echo.

echo ===========================
echo Running Processes:
echo ===========================
powershell -Command "Get-Process"
echo.

echo ===========================
echo History:
echo ===========================
more C:\Users\user\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt
echo.


























