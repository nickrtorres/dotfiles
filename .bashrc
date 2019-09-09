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
    docker run -it --rm --privileged -v $(pwd):/wd linux-rust PATH=$PATH:$HOME/.cargo/bin /bin/bash
}
PATH=/Users/nick/.cargo/bin:/usr/local/scala/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/nick/Library/Python/2.7/bin:/Users/nick/.scripts:/usr/local/mysql-5.7.21-macos10.13-x86_64/bin:/Users/nick/.cargo/bin:/Library/TeX/texbin:/Applications/Wireshark.app/Contents/MacOS:/usr/local/scala/bin:/Users/nick/.fzf/bin:/Users/nick/.local/bin/
