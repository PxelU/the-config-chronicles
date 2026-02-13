export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'

ff() {
  local file=$(fd --type f --hidden --exclude .git | fzf \
    --reverse \
    --preview 'bat --color=always --style=numbers --line-range :100 {}')

  [[ -n "$file" ]] && nvim "$file"
}

sf() {
  rm -f /tmp/fzf_relpath
  local file_line=$(
    rg --column --line-number --no-heading --color=always --smart-case --hidden --glob '!.git/*' "" | \
    fzf --ansi \
        --reverse \
        --delimiter : \
        --preview 'bat --color=always --highlight-line {2} {1}' \
        --preview-window 'right,60%,border-bottom,+{2}+3/3'
  )

  if [[ -n "$file_line" ]]; then
    local file=$(echo "$file_line" | cut -d: -f1)
    local line=$(echo "$file_line" | cut -d: -f2)
    nvim "$file" +"$line"
  fi
}
