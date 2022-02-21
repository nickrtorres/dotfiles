set autoindent
set colorcolumn=80
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set hidden
set ignorecase smartcase
set incsearch
set laststatus=2
set nocompatible
set nocursorline
set nowrap
set shiftwidth=2
set showmatch
set softtabstop=2
set splitbelow
set splitright
set statusline=%f\ %m
set tabstop=2
set tw=80
set undodir=$HOME/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set wildmenu

let mapleader = ","
map <C-c> <ESC>
map <Leader><Leader> :b# <CR>
map <Leader>o :only<CR>
map <Leader>r :%s/
map <Leader>w :bd<CR>
map <Leader>c :e %:r.cpp<CR>
map <Leader>h :e %:r.h<CR>

"-------------------------------------
" From vim help "insert.txt"
" > For example, the following will map <Tab> to either actually insert a <Tab>
"   if the current line is currently only whitespace, or start/continue a CTRL-N
"   completion operation:
"-------------------------------------
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us tw=79
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us tw=79
autocmd BufRead,BufNewFile Makefile set softtabstop=8 tabstop=8 noexpandtab
autocmd BufRead,BufNewFile gitcommit setlocal spell spelllang=en_us

syntax on
set t_Co=256
hi ColorColumn    ctermbg=253
hi Comment        term=bold ctermfg=236
hi Constant       NONE
hi CursorLine     cterm=NONE ctermbg=235
hi Identifier     NONE
hi Ignore         NONE
hi PreProc        NONE
hi Search         ctermbg=black ctermfg=yellow term=underline
hi Special        NONE
hi SpecialComment term=bold ctermfg=236
hi Statement      NONE
hi Title          NONE
hi Todo           NONE
hi Todo           NONE
hi Type           NONE
hi Underlined     NONE
