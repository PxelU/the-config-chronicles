#!/bin/sh

set -e

echo "[setup] Installing fzf"	
# Clone fzf if not already present
if [ ! -d "$HOME/.fzf" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi

# Install fzf, answering "yes" to all prompts, and do NOT update shell rc files
yes | ~/.fzf/install --all --no-update-rc

echo "[setup] Installing fzf, fd-find, bat, ripgrep..."
sudo apt install -y fd-find bat ripgrep

# Symlink fd-find to fd
echo "[setup] Symlinking fd"
if ! command -v fd &> /dev/null && command -v fd-find &> /dev/null; then
  sudo ln -sf $(which fdfind) /usr/local/bin/fd
fi

# Symlink batcat to bat
echo "[setup] Symlinking bat"
if ! command -v bat &> /dev/null && command -v batcat &> /dev/null; then
  sudo ln -sf $(which batcat) /usr/local/bin/bat
fi


