#!/usr/bin/env sh

set -eu

cd "./tcl"

PROJECT_DIR="../xilinx/urbana_board_pcxt"
PROJECT_TCL="urbana_board_pcxt.tcl"

if ! command -v vivado >/dev/null 2>&1; then
    echo "Error: vivado not found in PATH."
    exit 1
fi

if [ ! -f "$PROJECT_TCL" ]; then
    echo "Error: Tcl script not found."
    exit 1
fi

if [ -d "$PROJECT_DIR" ]; then
    printf "Project directory exists:\n  %s\nDelete and recreate? [y/N] " "$PROJECT_DIR"
    read -r REPLY

    case "$REPLY" in
        y|Y|yes|YES)
            rm -rf "$PROJECT_DIR"
            ;;
        *)
            echo "Cancelled."
            exit 0
            ;;
    esac
fi

vivado -mode batch -source "$PROJECT_TCL"
