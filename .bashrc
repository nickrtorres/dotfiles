export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad

PS1='[\u@\h:\W $] '

export CPLUS_INCLUDE_PATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib
export PYTHONDONTWRITEBYTECODE=1
export LESS='-R'

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
    docker run -it --rm --privileged -v $(pwd):/wd linux-rust PATH=$PATH:${HOME}/.cargo/bin /bin/bash
}

function scheme()
{
    docker run -it --rm mit-scheme:10.1.10
}

PATH=$PATH:${HOME}/.cargo/bin/
