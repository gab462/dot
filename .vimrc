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
			\ | hi Constant ctermfg=darkblue
			\ | hi Comment ctermfg=darkgreen
			\ | hi PreProc ctermfg=darkred
colorscheme quiet

set et sts=2 sw=2

set wildmenu
set wildignore=*.o
set path=**
nnoremap <C-p> :find *
