export EDITOR="$VISUAL"
export LESS="-RFX"
export LIBRARY_PATH=/usr/local/lib
export PATH="$PATH:$HOME/.cargo/bin"
export PROMPT='%1~ %(?.%F{black}.%F{red})%#%f '
export PYTHONDONTWRITEBYTECODE=1
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
