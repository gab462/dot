set nocompatible

let g:netrw_dirhistmax=0
set viminfofile=NONE

filetype plugin indent on
syntax off

set timeout
set ttimeoutlen=0
set noswapfile nowritebackup nobackup

set ai si
set incsearch ignorecase smartcase

set bg=light
set termguicolors
hi Normal guibg=#ffffea guifg=#000000
hi EndOfBuffer guifg=NONE

set et sts=2 sw=2

set wildmenu
set wildignore=*.o
set path=**
nnoremap <C-p> :find *
