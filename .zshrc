PROMPT='%1~ %(?.%F{black}.%F{red})%#%f '

export LESS='-RFX'
export PATH=${PATH}:${HOME}/.cargo/bin
export PYTHONDONTWRITEBYTECODE=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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
