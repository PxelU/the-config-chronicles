#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[$(date '+%H:%M:%S')] $*${NC}"
}

# Install Neovim from official PPA
if ! command -v nvim &>/dev/null; then
    log "Installing Neovim..."
    sudo apt install -y neovim

    log "Neovim installed: $(nvim --version | head -n1)"
else
    log "Neovim already installed: $(nvim --version | head -n1)"
fi

