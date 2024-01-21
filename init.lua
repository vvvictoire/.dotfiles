-- Enable syntax highlighting
vim.cmd("syntax on")
vim.cmd("filetype indent plugin on")

-- Indentation shenanigans
vim.opt.tabstop=8
vim.opt.expandtab=true
vim.opt.shiftwidth=4
vim.opt.softtabstop=4

-- ???
vim.cmd([[autocmd BufWritePre * :%s/\s\+$//e]])
vim.opt.langremap=true
-- 80 column marker
vim.opt.colorcolumn={80,120}

-- Line numbers, highlight current line and column
vim.opt.number=true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- Always display at least this much lines around the cursor
vim.opt.scrolloff=10


-- Highlighting during a search
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.hlsearch = true

-- Autocompletion menu
vim.opt.wildmenu = true
vim.opt.wildmode="list:longest"

-- fuck qwerty supremacy
-- rebinds

vim.keymap.set('i','tt','<Esc>')

-- Dank plugins
require "paq" {
    "savq/paq-nvim",
    "lervag/vimtex",
    "folke/tokyonight.nvim",
}


-- vimtex config
vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_compiler_latexmk_engines = {
   _  = '-xelatex'
}
vim.cmd("source ~/.config/nvim/vimtex.vim")

-- colortheme
--vim.cmd("colorscheme tokyonight")
