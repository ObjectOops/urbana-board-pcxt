@echo off
setlocal

cd "\tcl"

set PROJECT_DIR=..\xilinx\urbana_board_pcxt
set PROJECT_TCL=urbana_board_pcxt.tcl

where vivado >nul 2>nul
if errorlevel 1 (
    echo Error: vivado not found in PATH.
    exit /b 1
)

if not exist "%PROJECT_TCL%" (
    echo Error: Tcl script not found.
    exit /b 1
)

if exist "%PROJECT_DIR%" (
    choice /c yn /m "Project directory exists. Delete and recreate? [y/N]"
    if errorlevel 2 goto :no
    if errorlevel 1 goto :yes

    :yes
    rmdir /s /q "%PROJECT_DIR%"
    goto :end

    :no
    echo Cancelled.
    goto :end

    :end
)

vivado -mode batch -source "%PROJECT_TCL%"
