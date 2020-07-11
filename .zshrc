# LVL 0 env vars --- no depedencies
export LESS="-RFX"
export PROMPT='%(1j.* .)%1~ %(?.%F{black}.%F{red})%#%f '
export PYENV_ROOT="$HOME/.pyenv"
export PYTHONDONTWRITEBYTECODE=1
export RUST_BACKTRACE=1
export VISUAL=vim

# LVL 1 env vars --- 1 dependency
export EDITOR="$VISUAL"
export PATH="$PATH:$HOME/.cargo/bin"

# LVL 2 env vars --- 2 depedencies
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

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

revt()
{
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

st()
{
  (cd $1 && $SHELL;)
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
