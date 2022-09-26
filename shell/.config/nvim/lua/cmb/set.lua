local o = vim.opt
local g = vim.g

o.nu = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.smartindent = true

o.hlsearch = true
o.incsearch = true

o.syntax = "ON"
o.termguicolors = true

o.swapfile = false
o.backup = false
-- o.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- o.undofile = true

g.mapleader = ' '
