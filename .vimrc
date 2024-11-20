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

autocmd Colorscheme quiet hi Normal ctermbg=NONE
			\ | hi String ctermfg=lightblue
			\ | hi Character ctermfg=lightblue
			\ | hi Comment ctermfg=lightgreen
			\ | hi PreProc ctermfg=lightred
colorscheme quiet

set wildmenu
set wildignore=*.o
set path=**
nnoremap <C-p> :find *
