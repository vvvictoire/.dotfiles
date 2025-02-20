syntax on
filetype indent plugin on

set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4

autocmd BufWritePre * :%s/\s\+$//e
set langremap
set colorcolumn=80

"Add numbers to lines
set number
set cursorline
set cursorcolumn

set scrolloff=10

set incsearch
set hlsearch
set showmatch

set wildmenu
set wildmode=list:longest
