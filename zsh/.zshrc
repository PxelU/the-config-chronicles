export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export PATH="$HOME/bin:$HOME/.local/bin:/opt/nvim-linux-x86_64/bin:$PATH"
export EDITOR=nvim

ZINIT_HOME="${XDG_DATA_HOME}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit light zsh-users/zsh-syntax-highlighting
zinit light jeffreytse/zsh-vi-mode

zstyle -d ':completion:*:*:*:*:*' menu
zstyle ':completion:*' menu no

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit ice as"command" from"gh-r" \
    atclone"./zoxide init zsh > init.zsh" \
    atpull"%atclone" src"init.zsh"
zinit light ajeetdsouza/zoxide

alias zz='__zoxide_zi'

[[ -f ~/.config/zsh/search.zsh ]] && source ~/.config/zsh/search.zsh
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
