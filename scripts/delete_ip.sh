#!/usr/bin/env sh

set -eu

if [ -z "$1" ]; then
    echo "Error: No IP provided."
    exit 1
fi

IP_DIR="./ip/$1/"

if [ -d "$IP_DIR" ]; then
    rm -rf "$IP_DIR"
fi

echo "Done."
