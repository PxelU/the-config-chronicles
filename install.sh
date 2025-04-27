#!/usr/bin/env bash
set -euo pipefail

# === Config ===
REPO_ROOT="$HOME/the-config-chronicles"         # Adjust if your repo is elsewhere
DOTFILES_DIR="$REPO_ROOT/dotfiles"
ZSH_DOTFILES=(.zshrc .p10k.zsh .aliases)
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$OH_MY_ZSH_DIR/custom"
MESLO_FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Meslo.zip"
MESLO_FONT_DIR="$HOME/.local/share/fonts"
MESLO_FONT_FILES=("MesloLGS NF Regular.ttf" "MesloLGS NF Bold.ttf" "MesloLGS NF Italic.ttf" "MesloLGS NF Bold Italic.ttf")

# === Utility Functions ===
info()    { echo -e "\033[1;34m[INFO]\033[0m $*"; }
warn()    { echo -e "\033[1;33m[WARN]\033[0m $*"; }
error()   { echo -e "\033[1;31m[ERROR]\033[0m $*"; exit 1; }

# === 1. Package Installation ===
install_packages() {
    info "Installing required packages..."
    if command -v apt &>/dev/null; then
        sudo apt update
        sudo apt install -y zsh git curl wget unzip
    elif command -v pacman &>/dev/null; then
        sudo pacman -Sy --noconfirm zsh git curl wget unzip
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y zsh git curl wget unzip
    else
        warn "Package manager not detected. Install zsh, git, curl, wget, and unzip manually."
    fi
}

# === 2. Font Installation ===
install_fonts() {
    info "Installing Meslo Nerd Font..."
    mkdir -p "$MESLO_FONT_DIR"
    tmpdir=$(mktemp -d)
    wget -qO "$tmpdir/meslo.zip" "$MESLO_FONT_URL"
    unzip -o "$tmpdir/meslo.zip" -d "$tmpdir"
    for font in "${MESLO_FONT_FILES[@]}"; do
        cp "$tmpdir/$font" "$MESLO_FONT_DIR/"
    done
    fc-cache -fv
    rm -rf "$tmpdir"
}

# === 3. Oh My Zsh Setup ===
install_oh_my_zsh() {
    if [ ! -d "$OH_MY_ZSH_DIR" ]; then
        info "Installing Oh My Zsh..."
        RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
        "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        info "Oh My Zsh already installed."
    fi
}

# === 4. Zsh Plugins ===
install_zsh_plugins() {
    info "Installing Zsh plugins..."
    mkdir -p "$ZSH_CUSTOM/plugins"
    # zsh-autosuggestions
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    fi
    # zsh-syntax-highlighting
    if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    fi
}

# === 5. Powerlevel10k Theme ===
install_powerlevel10k() {
    info "Installing Powerlevel10k theme..."
    if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
    fi
}

# === 6. Zoxide ===
install_zoxide() {
    info "Installing zoxide..."
    if command -v apt &>/dev/null; then
        sudo apt install -y zoxide
    elif command -v pacman &>/dev/null; then
        sudo pacman -Sy --noconfirm zoxide
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y zoxide
    else
        curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    fi
}

# === 7. Symlink Dotfiles ===
symlink_dotfiles() {
    info "Symlinking Zsh dotfiles..."
    for file in "${ZSH_DOTFILES[@]}"; do
        src="$DOTFILES_DIR/zsh/$file"
        dest="$HOME/$file"
        if [ -e "$src" ]; then
            ln -sf "$src" "$dest"
            info "Symlinked $file"
        else
            warn "File $src not found, skipping."
        fi
    done
}

# === 8. Change Default Shell to Zsh ===
set_default_shell() {
    if [ "$SHELL" != "$(command -v zsh)" ]; then
        info "Changing default shell to Zsh..."
        chsh -s "$(command -v zsh)"
    fi
}

# === Main ===
main() {
    install_packages
    install_fonts
    install_oh_my_zsh
    install_zsh_plugins
    install_powerlevel10k
    install_zoxide
    symlink_dotfiles
    set_default_shell

    info "Setup complete! Please restart your terminal or run 'exec zsh'."
}

main "$@"
