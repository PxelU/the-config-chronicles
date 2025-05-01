#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m'

log() {
    echo -e "${GREEN}[$(date '+%H:%M:%S')] $*${NC}"
}

# Specify Neovim version
NVIM_VERSION="v0.11.1"
ARCH="linux64"
INSTALL_DIR="$HOME/.local/share/nvim-${ARCH}"
BIN_LINK="$HOME/.local/bin/nvim"

# Check existing installation
if command -v nvim &>/dev/null; then
    INSTALLED_VERSION=$(nvim --version | head -n1 | awk '{print $2}')
    if [[ "$INSTALLED_VERSION" == "${NVIM_VERSION#v}" ]]; then
        log "Neovim version $NVIM_VERSION already installed."
        exit 0
    else
        log "Different Neovim version detected ($INSTALLED_VERSION). Replacing with $NVIM_VERSION."
        rm -rf "$INSTALL_DIR"
        rm -f "$BIN_LINK"
    fi
else
    log "Neovim not found. Installing version $NVIM_VERSION..."
fi

# Download and install
log "Downloading Neovim $NVIM_VERSION..."
curl -L "https://github.com/neovim/neovim/releases/download/${NVIM_VERSION}/nvim-${ARCH}.tar.gz" -o /tmp/nvim.tar.gz

log "Extracting Neovim..."
mkdir -p "$INSTALL_DIR"
tar xzf /tmp/nvim.tar.gz -C "$INSTALL_DIR" --strip-components=1

log "Creating symlink..."
mkdir -p ~/.local/bin
ln -sf "${INSTALL_DIR}/bin/nvim" "$BIN_LINK"

log "Cleaning up..."
rm -f /tmp/nvim.tar.gz

log "Neovim $NVIM_VERSION installed: $(nvim --version | head -n1)"
