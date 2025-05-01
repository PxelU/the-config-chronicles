#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
NC='\033[0m'
log() { echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] $*${NC}"; }

# Install fzf
if [ ! -d "$HOME/.fzf" ]; then
    log "Cloning fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
    log "Installing fzf..."
    "$HOME/.fzf/install" --all --no-update-rc
else
    log "fzf already installed."
fi

# Install related utilities
log "Installing fd-find, bat, ripgrep..."
sudo apt-get install -y fd-find bat ripgrep

# Symlink fd-find to fd
if ! command -v fd &>/dev/null && command -v fdfind &>/dev/null; then
    log "Symlinking fdfind to fd..."
    sudo ln -sf "$(which fdfind)" /usr/local/bin/fd
else
    log "fd symlink already exists or not needed."
fi

# Symlink batcat to bat
if ! command -v bat &>/dev/null && command -v batcat &>/dev/null; then
    log "Symlinking batcat to bat..."
    sudo ln -sf "$(which batcat)" /usr/local/bin/bat
else
    log "bat symlink already exists or not needed."
fi

log "fzf and related utilities installation complete."
