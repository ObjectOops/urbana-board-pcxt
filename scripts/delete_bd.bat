@echo off
setlocal

if "%~1"=="" (
    echo Error: No block design provided.
    exit /b 1
)

set "BD_DIR=.\bd\%~1"

if exist "%BD_DIR%" (
    rmdir /s /q "%BD_DIR%"
)

echo Done.
