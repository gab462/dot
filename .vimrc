set nocompatible

let g:netrw_dirhistmax=0
set viminfofile=NONE

filetype plugin indent on
syntax on

set timeout
set ttimeoutlen=0
set noswapfile nowritebackup nobackup

set ai si
set incsearch ignorecase smartcase

set bg=dark

set mouse=

set wildmenu
set wildignore=*.o
set path=**
nnoremap <C-p> :find *
nnoremap <C-x> un.
