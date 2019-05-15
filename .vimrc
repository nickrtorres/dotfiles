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

" Leader is ,
let mapleader = ","

"show trailing whitespace
set lcs=tab:>-,trail:-
autocmd InsertLeave * set list
autocmd InsertEnter * set nolist
set runtimepath^=~/.vim/bundle/ctrlp.vim

cnoremap <expr> %% expand('%:h').'/'

" Buffer Nav
map <Leader>r :%s/
map <Leader>l :ls <cr>
map <Leader>g :buf
map <Leader>` :b# <cr>
map <Leader>w :bd <cr>
map <Leader>e :e %%

" fold function
map <Leader>f V%zf

"fuzzy finder
set rtp+=~/.fzf
map <Leader>s :FZF<cr>
