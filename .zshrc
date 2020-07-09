if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export EDITOR="$VISUAL"
export LESS="-RFX"
export LIBRARY_PATH=/usr/local/lib
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PYENV_ROOT/bin:$PATH"
export PROMPT='%1~ %(?.%F{black}.%F{red})%#%f '
export PYENV_ROOT="$HOME/.pyenv"
export PYTHONDONTWRITEBYTECODE=1
export RUST_BACKTRACE=1
export VISUAL=vim

# can't kick old habits
bindkey -e
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

ls()
{
  exa --color=never "$@"
}

rman()
{
  "$@" --color=always --help | less
}

rbuild()
{
  docker run -it --rm --privileged -v $(pwd):/wd linux-rust PATH=$PATH:$HOME/.cargo/bin /bin/bash
}

fml()
{
  rm -i .*.sw*
}

tmp()
{
  (t=$(mktemp -d) && cd "$t" && "$SHELL")
}

tq()
{
  cargo test --quiet
}

cz()
{
  cargo check --quiet
}

loctest()
{
  (set -e; for sha in $(git rev-list origin/master..HEAD); do git checkout $sha; ./runt; done; git checkout master; )
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
