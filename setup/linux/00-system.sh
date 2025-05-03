#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
NC='\033[0m'

log() { echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] $*${NC}"; }

# List of required packages
APT_PACKAGES=(
    git
    curl
    wget
    unzip
    python3-venv
    zsh
    make
    gcc
    npm
    gzip
    locales
    sudo
    fontconfig
    vim
)

log "Updating package lists..."
sudo apt-get update

log "Installing required system packages: ${APT_PACKAGES[*]}"
sudo apt-get install -y "${APT_PACKAGES[@]}"

log "System package installation complete."
