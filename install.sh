#!/bin/bash
set -e

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if we're in a git repository
if [ -d "$SCRIPT_DIR/.git" ]; then
    cd "$SCRIPT_DIR"
else
    TMP_DIR="/tmp/omakub-topbar-ext-$$"
    git clone -q https://github.com/Kasui92/omakub-menu-topbar-extension.git "$TMP_DIR" 2>/dev/null
    cd "$TMP_DIR"
    CLEANUP=true
fi

# Install the extension
make install

# Cleanup if we cloned to temp
if [ "$CLEANUP" = true ]; then
    cd - >/dev/null
    rm -rf "$TMP_DIR"
fi

echo ""
echo "Restart GNOME Shell: Alt+F2 → r (Xorg) or logout (Wayland)"

