@echo off
:: Set window title
title QR Guy Dev Server launcher

:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :run
) else (
    echo ========================================================
    echo [INFO] Requesting Administrator privileges...
    echo ========================================================
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:run
:: Change directory to the folder where this batch script resides
cd /d "%~dp0"

echo ========================================================
echo               QR Guy Project Setup (Windows)
echo ========================================================
echo.

:: Check if Node.js is installed
where node >nul 2>&1
if %errorLevel% equ 0 goto :run_project

echo [INFO] Node.js is not installed or not in your system's PATH.
echo [INFO] Attempting to install Node.js...
echo.

:: Check if winget is installed
where winget >nul 2>&1
if %errorLevel% neq 0 (
    echo [INFO] winget is not available. Using PowerShell download fallback...
    goto :download_msi
)

:: Install Node.js via winget
echo [INFO] Installing Node.js LTS via winget...
winget install OpenJS.NodeJS.LTS --accept-source-agreements --accept-package-agreements
if %errorLevel% neq 0 (
    echo [WARNING] winget failed to install Node.js. Trying PowerShell download fallback...
    goto :download_msi
)
goto :refresh_path

:download_msi
set "NODE_VERSION=v22.12.0"
set "MSI_URL=https://nodejs.org/dist/%NODE_VERSION%/node-%NODE_VERSION%-x64.msi"
set "MSI_PATH=%TEMP%\node-install.msi"

echo [INFO] Downloading Node.js %NODE_VERSION% MSI installer...
powershell -Command "Invoke-WebRequest -Uri '%MSI_URL%' -OutFile '%MSI_PATH%'"
if %errorLevel% neq 0 (
    echo [ERROR] Failed to download Node.js installer.
    echo Please download and install Node.js manually from: https://nodejs.org/
    pause
    exit /b
)

echo [INFO] Installing Node.js silently (this may take a minute, please wait)...
msiexec.exe /i "%MSI_PATH%" /qn /norestart
if %errorLevel% neq 0 (
    echo [ERROR] Silent installation failed.
    echo Please download and install Node.js manually from: https://nodejs.org/
    del /f /q "%MSI_PATH%" >nul 2>&1
    pause
    exit /b
)

:: Clean up MSI
del /f /q "%MSI_PATH%" >nul 2>&1

:refresh_path
echo.
echo [INFO] Node.js installation completed. Refreshing PATH...

:: Refresh PATH environment variable in the current CMD session
for /f "delims=" %%a in ('powershell -Command "[Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' + [Environment]::GetEnvironmentVariable('Path', 'User')"') do set "PATH=%%a"

:: Fallback: Explicitly add default Node.js path to environment if it wasn't captured
if exist "C:\Program Files\nodejs" (
    set "PATH=C:\Program Files\nodejs;%PATH%"
)

:: Check again if Node.js is available
where node >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] Node.js was installed but still cannot be found in your PATH.
    echo Please restart your command prompt or computer and try again.
    echo.
    pause
    exit /b
)

:run_project


:: Display Node.js & npm versions
echo [INFO] Node.js is installed:
call node -v
echo.

:: Install dependencies
echo [INFO] Installing project dependencies (npm install)...
echo.
call npm install
if %errorLevel% neq 0 (
    echo.
    echo [ERROR] npm install failed. Please check the error messages above.
    pause
    exit /b
)
echo.
echo [INFO] Dependencies installed successfully.
echo.

:: Open default browser to local Astro dev server
echo [INFO] Opening default browser to http://localhost:4321/qr-guy.com/ ...
start http://localhost:4321/qr-guy.com/

:: Launch the Astro dev server
echo [INFO] Starting the development server...
echo.
call npm run dev

pause
