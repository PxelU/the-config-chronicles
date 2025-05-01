#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
NC='\033[0m'

log() { echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] $*${NC}"; }

MESLO_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Meslo.zip"
MESLO_FONT_DIR="$HOME/.local/share/fonts"

# Check if Meslo Nerd Fonts are already installed
if ls "$MESLO_FONT_DIR"/MesloLGS*.ttf 1> /dev/null 2>&1; then
    log "Meslo Nerd Fonts already installed, skipping download."
    exit 0
fi

log "Installing Meslo Nerd Fonts..."
mkdir -p "$MESLO_FONT_DIR"
TMP_DIR=$(mktemp -d)
FONT_ZIP="$TMP_DIR/Meslo.zip"

curl -L -o "$FONT_ZIP" "$MESLO_FONT_URL"
unzip -o "$FONT_ZIP" -d "$MESLO_FONT_DIR"
fc-cache -fv
rm -rf "$TMP_DIR"

log "Meslo Nerd Fonts installed."
