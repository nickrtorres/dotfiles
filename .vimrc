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
set wildmenu
highlight Search ctermbg=black ctermfg=yellow term=underline
set statusline=%f\ %m
set laststatus=2
set nowrap
highlight ColorColumn ctermbg=253
set colorcolumn=80
set encoding=utf-8
set fileencoding=utf-8
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set hidden
map <C-c> <ESC>
"-------------------------------------
" Add a underline in '=' to the current line
"-------------------------------------
map <Leader>= yypv$r=
"-------------------------------------
" Add a underline in '-' to the current line
"-------------------------------------
map <Leader>- yypv$r-
"-------------------------------------
" colorscheme
"-------------------------------------
set nocursorline
set t_Co=256
hi CursorLine   cterm=NONE ctermbg=235
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
map <Leader>w :bd<CR>
map <Leader>e :e %%
map <Leader>` <C-w>o
map <Leader>o :only<CR>
"-------------------------------------
" fuzzy finder
"-------------------------------------
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
set rtp+=~/.fzf
map <C-p> :Files<CR>
map <C-f> :Rg 
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
map <Leader><SPACE> :!./x.sh<CR>
"-------------------------------------
" S P L I T S
"-------------------------------------
set splitright
set splitbelow
"-------------------------------------
" From vim help "insert.txt"
" For example, the following will map <Tab> to either actually insert a <Tab> if
" the current line is currently only whitespace, or start/continue a CTRL-N
" completion operation:
"-------------------------------------
function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
      return "\<Tab>"
   else
      return "\<C-N>"
   endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>
"-------------------------------------
" If writing real words
"-------------------------------------
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us tw=79
autocmd BufRead,BufNewFile gitcommit setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us tw=79
"-------------------------------------
" If writing Makefile(s), use tabs
"-------------------------------------
autocmd BufRead,BufNewFile Makefile set softtabstop=8 tabstop=8 noexpandtab
"-------------------------------------
" If writing SML use 2 space indents
"-------------------------------------
autocmd BufRead,BufNewFile *.sml set sts=2 sw=2 et
"-------------------------------------
" run cargo fmt after saving
"-------------------------------------
filetype plugin on
let g:rustfmt_autosave = 1
"-------------------------------------
" language specific run <Leader><space> commands
"-------------------------------------
autocmd FileType python nnoremap <Leader><SPACE> :!python3 %<CR>
autocmd FileType python nnoremap <Leader><a> :!cp % two.py<CR>
autocmd FileType rs nnoremap <Leader><SPACE> :!cargo build<CR>
"-------------------------------------
" engage RLS
"-------------------------------------
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif
let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_useVirtualText = 0
map <silent>gd :LspDefinition<CR>zz
set scl=no
"-------------------------------------
" Only highlight comments
"-------------------------------------
hi Todo           NONE
hi Constant       NONE
hi Special        NONE
hi Identifier     NONE
hi Statement      NONE
hi PreProc        NONE
hi Type           NONE
hi Underlined     NONE
hi Ignore         NONE
hi Title          NONE
hi Todo           NONE
hi SpecialComment term=bold ctermfg=236
hi Comment        term=bold ctermfg=236
