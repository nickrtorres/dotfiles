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
"-------------------------------------
" colorscheme
"-------------------------------------
colorscheme iceberg
"-------------------------------------
" Leader is ,
"-------------------------------------
let mapleader = ","
"-------------------------------------
" show trailing whitespace
"-------------------------------------
set lcs=tab:>-,trail:-
autocmd InsertLeave * set list
autocmd InsertEnter * set nolist
"-------------------------------------
" Buffer Nav
"-------------------------------------
map <Leader>l :Buffers<CR>
map <Leader>r :%s/
map <Leader>g :buf
map <Leader><Leader> :b# <CR>
map <Leader>w :bd <CR>
map <Leader>e :e %%
"-------------------------------------
" fuzzy finder
"-------------------------------------
set rtp+=~/.fzf
map <Leader>f :Files<CR>
"-------------------------------------
" C++ source and header navigation
"-------------------------------------
map <Leader>c :e %:r.cpp<CR>
map <Leader>h :e %:r.h<CR>
"-------------------------------------
" Search and replace
"-------------------------------------
map <Leader>s :%s/
"-------------------------------------
" Generic 'run' command to execute
" ./run.sh in the dir vim was launched
"-------------------------------------
map <Leader><SPACE> :!./run.sh<CR>
