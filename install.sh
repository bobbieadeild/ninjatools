#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

BIN_DIR="$HOME/.local/bin"
DATA_DIR="$HOME/.local/share"
BASHRC="$HOME/.bashrc"

mkdir -p "$BIN_DIR" "$DATA_DIR"

cp "$SCRIPT_DIR/ninjabackup" "$BIN_DIR/ninjabackup"
cp "$SCRIPT_DIR/ninjarestore" "$BIN_DIR/ninjarestore"
cp "$SCRIPT_DIR/termtheme" "$HOME/termtheme"
cp "$SCRIPT_DIR/ninja-cheatsheet.txt" "$DATA_DIR/ninja-cheatsheet.txt"

chmod +x "$BIN_DIR/ninjabackup"
chmod +x "$BIN_DIR/ninjarestore"
chmod +x "$HOME/termtheme"

MARKER="# >>> NINJA >>>"

if ! grep -qF "$MARKER" "$BASHRC" 2>/dev/null; then
    {
        echo
        echo "$MARKER"
        cat "$SCRIPT_DIR/bash-integration.sh"
        echo "# <<< NINJA <<<"
    } >> "$BASHRC"
fi

echo
echo "NINJA installed successfully."
echo
echo "Run:"
echo "  source ~/.bashrc"
echo
echo "Then try:"
echo "  ninja"
echo "  ninjareadme"
echo "  ninjatheme"
echo "  ninjabackup"
echo "  ninjarestore"
