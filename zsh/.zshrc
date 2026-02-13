if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git aliases docker zsh-syntax-highlighting zsh-vi-mode)
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export EDITOR=nvim

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$HOME/bin:$HOME/.local/bin:/opt/nvim-linux-x86_64/bin:$PATH"

if command -v zoxide >/dev/null 2>&1; then
  export _ZO_RESOLVE_SYMLINKS=1
  eval "$(zoxide init zsh)"
fi

zstyle -d ':completion:*:*:*:*:*' menu
zstyle ':completion:*' menu no

[[ -f ~/.config/zsh/search.zsh ]] && source ~/.config/zsh/search.zsh
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
