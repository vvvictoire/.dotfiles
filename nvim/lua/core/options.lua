local opt = vim.opt -- shortcut

-- line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true -- highlight active line
opt.colorcolumn = "80"

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
-- opt.expandtab = true
opt.autoindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.iskeyword:append("-")

opt.signcolumn = "yes" -- displays one more column for signs

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line and start

opt.clipboard = "unnamedplus" -- system clipboard

-- splitting
opt.splitright = true
opt.splitbelow = true

opt.undofile = true

-- special characters
opt.list = true
opt.listchars:append({ nbsp = "␣", trail = "•", precedes = "«", extends = "»", tab = "> " })
