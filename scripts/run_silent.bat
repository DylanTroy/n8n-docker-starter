@echo off
cd /d "%~dp0.."
title Starting n8n workflow automation
setlocal enabledelayedexpansion

REM Import N8N_PORT from .env
for /f "usebackq tokens=1,* delims==" %%a in (`type .env ^| findstr /b "N8N_PORT="`) do set "N8N_PORT=%%b"

REM Check if Docker is running
docker info >nul 2>&1
if errorlevel 1 (
    echo Docker does not seem to be running. Please start Docker Desktop.
    exit /b 1
)

REM Start the container in detached mode
docker compose -f n8n-docker-compose.yaml --env-file .env up -d

REM Wait for container to be healthy
echo Waiting for n8n container to be healthy...

set /a RETRIES=0
set /a MAX_RETRIES=10

:check_health
set "HEALTH="
for /f "delims=" %%i in ('docker inspect --format "{{.State.Health.Status}}" n8n 2^>nul') do (
    set "HEALTH=%%i"
)

if "!HEALTH!"=="" (
    echo Container 'n8n' not found. Is it running?
    exit /b 1
)

if /i "!HEALTH!"=="healthy" (
    echo n8n is healthy!
    goto open_browser
) else (
    if !RETRIES! geq !MAX_RETRIES! (
        echo Timeout reached, container did not become healthy.
        exit /b 1
    )
    timeout /t 1 /nobreak >nul
    set /a RETRIES+=1
    goto check_health
)

:open_browser
REM Optionally open in default browser instead of Electron
REM start http://localhost:%N8N_PORT%

REM Open in Electron
pushd "%~dp0..\n8n-electron-wrapper"
start "" node_modules\.bin\electron.cmd .
popd

exit /b 0