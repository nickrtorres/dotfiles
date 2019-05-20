export CLICOLOR=1
export LSCOLORS=GxFxBxDxCxegedabagacad

PS1='\u@\h:\W \$ ';

export CPLUS_INCLUDE_PATH=/usr/local/include
export LIBRARY_PATH=/usr/local/lib
export PYTHONDONTWRITEBYTECODE=1
export LESS='-R'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
FZF_DEFAULT_COMMAND='fd --type f'

function ls()
{
    exa "$@"
}
