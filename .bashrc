export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad

function status()
{
    if [ $? -ne 0 ]; then
        printf "\e[31m"
    fi
    echo -n "$"
    printf "\e[0m"
}
PS1='\u@\h:\W \[$(status)\] '

export CPLUS_INCLUDE_PATH=/usr/local/include
export LESS='-RFX'
export LIBRARY_PATH=/usr/local/lib
export PATH=${PATH}:${HOME}/.cargo/bin
export PYTHONDONTWRITEBYTECODE=1
export RUST_BACKTRACE=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='fd --type f -E '*.o' -E '*.bin' -E '*.d' -E target -E debug'

function ls()
{
    exa --color=never "$@"
}

function rman()
{
    "$@" --color=always --help | less
}

function rbuild()
{
    docker run -it --rm --privileged -v $(pwd):/wd linux-rust PATH=$PATH:$HOME/.cargo/bin /bin/bash
}

function fml()
{
    rm -i .*.sw*
}

function loctest()
{
    (set -e; for sha in $(git rev-list origin/master..HEAD); do git checkout $sha; ./runt ; done; git checkout master)
}

alias tq='cargo test --quiet'
alias cz='cargo check --quiet'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
