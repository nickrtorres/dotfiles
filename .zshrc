# LVL 0 env vars --- no depedencies
export FZF_DEFAULT_COMMAND='fd --type f --color=never'
export LESS="-RFX"
export PROMPT='%(1j.* .)%1~ %(?.%F{black}.%F{red})%#%f '
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VERSION='3.10-dev'
export PYTHONDONTWRITEBYTECODE=1
export RUST_BACKTRACE=1
export VISUAL=vim
export ZOOM_ROOMS='/Users/nick/Desktop/zoom.json'

# LVL 1 env vars --- 1 dependency
export EDITOR="$VISUAL"

# emacs
bindkey -e
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey '^U' backward-kill-line

appendpath()
{
    export PATH="$PATH:$1"
}

appendpath "$HOME/.cargo/bin"
appendpath "$PYENV_ROOT/bin"
appendpath "/usr/local/smlnj/bin"
appendpath "$HOME/bin"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# copped from https://unix.stackexchange.com/a/250700
sane-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N sane-backward-delete-word
bindkey '^W' sane-backward-delete-word

# copped from https://unix.stackexchange.com/a/273863
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY 
setopt HIST_IGNORE_SPACE

tmp() {
  (t=$(mktemp -d) && cd "$t" && "$SHELL")
}

o() {
  open "$@"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
