@echo off
setlocal

if "%~1"=="" (
    echo Error: No IP provided.
    exit /b 1
)

set "IP_DIR=.\ip\%~1"

if exist "%IP_DIR%" (
    rmdir /s /q "%IP_DIR%"
)

echo Done.
