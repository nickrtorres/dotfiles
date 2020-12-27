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

ls() {
  exa --color=never "$@"
}

rman() {
  "$@" --color=always --help | less
}

rbuild() {
  docker run -it --rm --privileged -v $(pwd):/wd linux-rust PATH=$PATH:$HOME/.cargo/bin /bin/bash
}

fml() {
  rm -i .*.sw*
}

tmp() {
  (t=$(mktemp -d) && cd "$t" && "$SHELL")
}

tq() {
  cargo test --quiet
}

cz() {
  cargo check --quiet
}

revt() {
  if [ -z "$TST_RUNNER" ]; then
    echo "FATAL: TST_RUNNER env variable not set!"
    return;
  fi

  (
    set -e;
    for sha in $(git rev-list --reverse origin/master..HEAD); do
      git checkout $sha
      eval "$TST_RUNNER"
    done

    git checkout master
  )
}

st() {
  (cd $1 && $SHELL;)
}

o() {
  open "$@"
}

tex() {
  (
    set -eu

    CMD="make"

    if ! test -f "Makefile"; then
      echo "Error: no Makefile found" >&2
      return 1
    fi

    if [ $# = 1 ]; then
      if [ "$1" = "clean" ]; then
        CMD="make clean"
      elif [ "$1" = "shell" ]; then
        CMD="/bin/bash"
      fi
    fi


    docker run --interactive        \
               --tty                \
               --rm                 \
               --volume "$PWD":/wd  \
               --workdir /wd        \
               tex:latest           \
               /bin/bash -c "$CMD"
  )
}

gradle() {
  if [ $# = 1 ] && [ "$1" = "shell" ]; then
    CMD="/bin/bash"
  else
    CMD="gradle $*"
  fi

  docker run --interactive \
             --rm \
             --tty \
             --volume "$PWD":/wd \
             --workdir /wd \
             antlr4:latest \
             /bin/bash -c "$CMD"
}

ccd() {
  mkdir "$1" && cd "$1"
}

sch() {
  cd ~/school/F20
}

pro() {
  cd ~/projects
}

scheme() {
  docker run --rm -it mit-scheme
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# opam configuration
test -r /Users/nick/.opam/opam-init/init.zsh && . /Users/nick/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
