#!/usr/bin/env bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'
log() { echo -e "${GREEN}[$(date '+%Y-%m-%d %H:%M:%S')] $*${NC}"; }
warn() { echo -e "${YELLOW}[$(date '+%Y-%m-%d %H:%M:%S')] $*${NC}"; }

ensure_dir() {
    local target="$1"
    local dir
    dir="$(dirname "$target")"
    if [ ! -d "$dir" ]; then
        log "Creating directory $dir"
        mkdir -p "$dir"
    fi
}

# Main dotfiles to $HOME
declare -A SYMLINKS=(
    ["$PWD/dotfiles/nvim/"]="$HOME/.config/nvim"
    ["$PWD/dotfiles/wezterm/wezterm.lua"]="$HOME/.config/wezterm/wezterm.lua"
    ["$PWD/dotfiles/zsh/zshrc"]="$HOME/.zshrc"
    ["$PWD/dotfiles/zsh/p10k.zsh"]="$HOME/.p10k.zsh"
    ["$PWD/dotfiles/stylua/stylua.toml"]="$HOME/.config/stylua/stylua.toml"
)

log "Symlinking main dotfiles..."

for src in "${!SYMLINKS[@]}"; do
    tgt="${SYMLINKS[$src]}"
    ensure_dir "$tgt"
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

log "Dotfile symlinking complete."
