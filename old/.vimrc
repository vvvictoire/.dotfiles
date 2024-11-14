" Enable syntax highlighting
syntax on
filetype indent plugin on

" Indentation shenanigans
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

" ???
autocmd BufWritePre * :%s/\s\+$//e

" 80 column marker
set colorcolumn=80

" Line numbers, highlight current line and column
set number
set cursorline
set cursorcolumn

" Always display at least this much lines around the cursor
set scrolloff=10


" Highlighting during a search
set hlsearch
set showmatch
set hlsearch

" Autocompletion menu
set wildmenu
set wildmode=list:longest
