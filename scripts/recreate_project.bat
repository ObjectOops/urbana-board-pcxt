@echo off
setlocal

cd /d ".\xilinx" || (
    echo Error: Failed to change directory to: .\xilinx
    exit /b 1
)

set "PROJECT_DIR=.\urbana_board_pcxt"
set "PROJECT_TCL=..\tcl\urbana_board_pcxt.tcl"

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
    choice /c YN /m "Project directory exists. Delete and recreate?"

    if errorlevel 2 (
        echo Cancelled.
        exit /b 0
    )

    rmdir /s /q "%PROJECT_DIR%"

    if exist "%PROJECT_DIR%" (
        echo Error: Failed to delete project directory.
        exit /b 1
    )
)

vivado -mode batch -source "%PROJECT_TCL%" -tclargs --origin_dir "..\tcl"

exit /b %ERRORLEVEL%
