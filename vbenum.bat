@echo off
color 0E
echo ===========================
color 0C
echo Whoami:
color 0E
echo ===========================
color 0F
whoami
echo.

color 0E
echo ===========================
color 0C
echo Privileges:
color 0E
echo ===========================
color 0F
whoami /priv
echo.

color 0E
echo ===========================
color 0C
echo User Information:
color 0E
echo ===========================
color 0F
net user
echo.

color 0E
echo ===========================
color 0C
echo Domain User Information:
color 0E
echo ===========================
color 0F
net user /domain
echo.

color 0E
echo ===========================
color 0C
echo System Information:
color 0E
echo ===========================
color 0F
systeminfo
echo.

color 0E
echo ===========================
color 0C
echo Network Configuration:
color 0E
echo ===========================
color 0F
ipconfig
echo.

color 0E
echo ===========================
color 0C
echo C Drive:
color 0E
echo ===========================
color 0F
dir C:\
echo.

color 0E
echo ===========================
color 0C
echo Installed 32 bit:
color 0E
echo ===========================
color 0F
powershell -Command "Get
