syntax off
set nocompatible
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set autoindent
set ignorecase smartcase
set showmatch
set incsearch
highlight Search ctermbg=253 ctermfg=NONE term=underline
"-------------------------------------
" colors
"-------------------------------------
set t_Co=256
hi CursorLine   cterm=NONE ctermbg=255
set cursorline
"-------------------------------------
" Leader is ,
"-------------------------------------
let mapleader = ","
"-------------------------------------
" show trailing whitespace
"-------------------------------------
"set lcs=trail:-
"autocmd InsertLeave * set list
"autocmd InsertEnter * set nolist
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
map <Leader>S :%s/\<<C-r><C-w>\>/
map <Leader>vs :%s/
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
"-------------------------------------
" If writing c, use tabs
"-------------------------------------
autocmd FileType c setlocal tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab
autocmd BufRead,BufNewFile   *.c,*.h set noic cin softtabstop=8 tabstop=8 noexpandtab
