#!/usr/bin/env sh

set -eu

if [ -z "$1" ]; then
    echo "Error: No block design provided."
    exit 1
fi

BD_DIR="./bd/$1/"

if [ -d "$BD_DIR" ]; then
    rm -rf "$BD_DIR"
fi

echo "Done."
