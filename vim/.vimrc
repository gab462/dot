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

"autocmd Colorscheme quiet hi Normal ctermbg=NONE
			"\ | hi Comment ctermfg=lightgreen
			"\ | hi String ctermfg=lightblue
			"\ | hi Character ctermfg=lightblue
			"\ | hi PreProc ctermfg=lightred
"colorscheme quiet

set et sw=4 sts=4
set termguicolors
autocmd Colorscheme retrobox hi Normal guibg=NONE
colorscheme retrobox

set wildmenu
nnoremap <C-p> :e **/*
