syntax on
set nocompatible
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set ignorecase smartcase
set showmatch
set incsearch
highlight Search ctermbg=black ctermfg=yellow term=underline

set background=dark

"show trailing whitespace
set lcs=tab:>-,trail:-
autocmd InsertLeave * set list
autocmd InsertEnter * set nolist
