export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad

function status()
{
    if [ $? = 0 ]; then
        printf "\e[32m"
    else
        printf "\e[31m"
    fi
    echo -n ">"
    printf "\e[0m"
}
PS1='\u@\h:\W \[$(status)\] '

export CPLUS_INCLUDE_PATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib
export PYTHONDONTWRITEBYTECODE=1
export LESS='-R'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='fd -E '*.o' -E '*.bin' -E '*.d' -E target -E debug'

function ls()
{
    exa "$@"
}

function rman()
{
    "$@" --color=always --help | less
}
