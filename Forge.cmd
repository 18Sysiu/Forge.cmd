@echo off
setlocal enabledelayedexpansion
title DevForge Cleaner
color 0D

:: === Animacja startowa ===
set "dots=."
for /L %%i in (1,1,5) do (
    cls
    echo.
    echo    Uruchamianie DevForge Cleaner!dots!
    echo.
    set "dots=!dots!."
    ping -n 2 127.0.0.1 >nul
)

:: === Menu główne ===
:menu
cls
echo =======================================================
echo                       T V R A S
echo =======================================================
echo               Witaj w Forge Cleaner
echo.
echo  [1] Clean Windows Temp       [2] Clean C:\Windows\Temp
echo  [3] Clear Cookies            [4] Clean CrashDumps
echo  [5] Clean Recent             [6] Clear Event Logs
echo  [7] Clean ALL                [0] Wyjscie
echo.
set /p choice=Wybierz opcje: 

if "%choice%"=="1" (
  cls
  echo Czyszczenie Windows Temp...
  if exist "%temp%\*" del /q/f/s "%temp%\*" 2>nul
  echo Zrobione.
  pause
  goto menu
)

if "%choice%"=="2" (
  cls
  echo Czyszczenie C:\Windows\Temp...
  if exist "%windir%\Temp\*" del /q/f/s "%windir%\Temp\*" 2>nul
  echo Zrobione.
  pause
  goto menu
)

if "%choice%"=="3" (
  cls
  echo Czyszczenie Cookies...
  if exist "%LOCALAPPDATA%\Microsoft\Windows\INetCookies\*" del /q/f/s "%LOCALAPPDATA%\Microsoft\Windows\INetCookies\*" 2>nul
  echo Zrobione.
  pause
  goto menu
)

if "%choice%"=="4" (
  cls
  echo Czyszczenie CrashDumps...
  if exist "%LOCALAPPDATA%\CrashDumps\*" del /q/f/s "%LOCALAPPDATA%\CrashDumps\*" 2>nul
  echo Zrobione.
  pause
  goto menu
)

if "%choice%"=="5" (
  cls
  echo Czyszczenie „Ostatnio używane”...
  if exist "%APPDATA%\Microsoft\Windows\Recent\*" del /q/f/s "%APPDATA%\Microsoft\Windows\Recent\*" 2>nul
  echo Zrobione.
  pause
  goto menu
)

if "%choice%"=="6" (
  cls
  echo Czyszczenie logów zdarzeń...
  wevtutil cl Application >nul 2>&1
  wevtutil cl System >nul 2>&1
  echo Zrobione.
  pause
  goto menu
)

if "%choice%"=="7" (
  cls
  echo Wykonywanie Clean ALL...
  
  echo Czyszczenie Windows Temp...
  if exist "%temp%\*" del /q/f/s "%temp%\*" 2>nul

  echo Czyszczenie C:\Windows\Temp...
  if exist "%windir%\Temp\*" del /q/f/s "%windir%\Temp\*" 2>nul

  echo Czyszczenie Cookies...
  if exist "%LOCALAPPDATA%\Microsoft\Windows\INetCookies\*" del /q/f/s "%LOCALAPPDATA%\Microsoft\Windows\INetCookies\*" 2>nul

  echo Czyszczenie CrashDumps...
  if exist "%LOCALAPPDATA%\CrashDumps\*" del /q/f/s "%LOCALAPPDATA%\CrashDumps\*" 2>nul

  echo Czyszczenie „Ostatnio używane”...
  if exist "%APPDATA%\Microsoft\Windows\Recent\*" del /q/f/s "%APPDATA%\Microsoft\Windows\Recent\*" 2>nul

  echo Czyszczenie logów zdarzeń...
  wevtutil cl Application >nul 2>&1
  wevtutil cl System >nul 2>&1

  echo.
  echo Clean ALL zakonczony.
  pause
  goto menu
)

if "%choice%"=="0" (
  echo Do widzenia.
  pause
  exit /b
)

echo Nieznana opcja.
pause
goto menu
