#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
NC='\033[0m'
log() { echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] $*${NC}"; }

if command -v zoxide &>/dev/null; then
    log "zoxide already installed."
else
    log "Installing zoxide..."
    sudo apt-get install -y zoxide
    log "zoxide installation complete."
fi
