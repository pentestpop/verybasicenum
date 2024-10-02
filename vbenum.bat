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
