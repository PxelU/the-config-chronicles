#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
NC='\033[0m'
log() { echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] $*${NC}"; }

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

log "Installing Powerlevel10k theme..."

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        "$ZSH_CUSTOM/themes/powerlevel10k"
else
    log "Powerlevel10k already installed."
fi

