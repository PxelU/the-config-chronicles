#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
log() { echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] $*${NC}"; }
warn() { echo -e "${YELLOW}[$(date '+%Y-%m-%d %H:%M:%S')] $*${NC}"; }

# Main dotfiles to $HOME
declare -A SYMLINKS=(
    ["$PWD/dotfiles/wezterm/wezterm.lua"]="$HOME/.config/wezterm/wezterm.lua"
    ["$PWD/dotfiles/zsh/zshrc"]="$HOME/.zshrc"
    ["$PWD/dotfiles/zsh/p10k.zsh"]="$HOME/.p10k.zsh"
)

log "Symlinking main dotfiles..."

for src in "${!SYMLINKS[@]}"; do
    tgt="${SYMLINKS[$src]}"
    if [ -e "$tgt" ] && [ ! -L "$tgt" ]; then
        backup="${tgt}.backup.$(date +%s)"
        warn "Backing up existing $tgt to $backup"
        mv "$tgt" "$backup"
    fi
    ln -sf "$src" "$tgt"
    log "Symlinked $(basename "$src") to $tgt"
done

# Symlink all Zsh config scripts to ~/.config/zsh/
ZSH_CONFIG_SRC="$PWD/dotfiles/zsh/config"
ZSH_CONFIG_TGT="$HOME/.config/zsh"
mkdir -p "$ZSH_CONFIG_TGT"

log "Symlinking Zsh config scripts..."

for file in "$ZSH_CONFIG_SRC"/*.zsh; do
    tgt="$ZSH_CONFIG_TGT/$(basename "$file")"
    if [ -e "$tgt" ] && [ ! -L "$tgt" ]; then
        backup="${tgt}.backup.$(date +%s)"
        warn "Backing up existing $tgt to $backup"
        mv "$tgt" "$backup"
    fi
    ln -sf "$file" "$tgt"
    log "Symlinked $(basename "$file") to $tgt"
done

# Symlink Neovim config to ~/.config/nvim
NVIM_SRC="$PWD/dotfiles/nvim/.config/nvim"
NVIM_TGT="$HOME/.config/nvim"

if [ -e "$NVIM_TGT" ] && [ ! -L "$NVIM_TGT" ]; then
    backup="${NVIM_TGT}.backup.$(date +%s)"
    warn "Backing up existing $NVIM_TGT to $backup"
    mv "$NVIM_TGT" "$backup"
fi

ln -sfn "$NVIM_SRC" "$NVIM_TGT"
log "Symlinked Neovim config to $NVIM_TGT"



log "Dotfile symlinking complete."


