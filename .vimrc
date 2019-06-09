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
set cursorline
set t_Co=256
hi CursorLine   cterm=NONE ctermbg=235
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
map <Leader>` <C-w>o
"-------------------------------------
" fuzzy finder
"-------------------------------------
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
set rtp+=~/.fzf
map <C-p> :Files<CR>
map <C-g> :Rg
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
"-------------------------------------
" S P L I T S
"-------------------------------------
set splitright
set splitbelow
map <Leader>h :hide
"-------------------------------------
" GRB.:
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
"-------------------------------------
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
