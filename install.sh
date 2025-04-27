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
REQUIREMENTS=(
    git
    curl
    wget
    unzip
    zsh
    locales
    sudo
    fontconfig
    vim 
)



# === Utility Functions ===
info()    { echo -e "\033[1;34m[INFO]\033[0m $*"; }
warn()    { echo -e "\033[1;33m[WARN]\033[0m $*"; }
error()   { echo -e "\033[1;31m[ERROR]\033[0m $*"; exit 1; }

# === 0. Check Requirements ===
check_requirements() {
    local missing=()
    for cmd in "${REQUIREMENTS[@]}"; do
        if ! command -v "$cmd" >/dev/null 2>&1; then
            missing+=("$cmd")
        fi
    done
    if [ "${#missing[@]}" -ne 0 ]; then
        echo "Error: Missing required commands: ${missing[*]}" >&2
        echo "Please install them and try again." >&2
        exit 1
    fi
}

# === 1. Package Installation ===
install_packages() {
    info "Installing required packages: ${REQUIREMENTS[*]}"
    sudo apt-get update
    sudo apt-get install -y "${REQUIREMENTS[@]}"
}

# === 2. Font Installation ===
install_fonts() {
    info "Installing Meslo Nerd Fonts..."
    mkdir -p "$MESLO_FONT_DIR"
    TMP_DIR=$(mktemp -d)
    FONT_ZIP="$TMP_DIR/Meslo.zip"
    wget -q -O "$FONT_ZIP" "$MESLO_FONT_URL"
    unzip -o "$FONT_ZIP" -d "$MESLO_FONT_DIR"
    fc-cache -fv
    rm -rf "$TMP_DIR"
    info "Meslo Nerd Fonts installed."
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


# === Main ===
main() {
    check_requirements
    install_packages
    install_fonts
    install_oh_my_zsh
    install_zsh_plugins
    install_powerlevel10k
    install_zoxide
    symlink_dotfiles

    info "Setup complete! Please restart your terminal or run 'exec zsh'."
}

main "$@"
