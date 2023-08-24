set nocompatible

let g:netrw_dirhistmax=0
set viminfofile=NONE

filetype plugin indent on

syntax on
set bg=dark

set timeout
set ttimeoutlen=0
set noswapfile nowritebackup nobackup

set ai si
set incsearch ignorecase smartcase

"autocmd Colorscheme zaibatsu hi Normal ctermbg=NONE
"			\ | hi EndOfBuffer ctermbg=NONE
"colorscheme zaibatsu
"let g:loaded_matchparen = 1

set wildmenu
set wildignore=*.o
set path=**
nnoremap <C-p> :find *
