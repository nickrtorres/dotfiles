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
export LESS='-R'
export LIBRARY_PATH=/usr/local/lib
export PATH=${PATH}:${HOME}/.cargo/bin
export PYTHONDONTWRITEBYTECODE=1

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

