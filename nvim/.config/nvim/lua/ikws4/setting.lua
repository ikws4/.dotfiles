local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo

g.mapleader = " "
g.maplocalleader = ";"

o.termguicolors = true

o.mouse = "a"

o.updatetime = 250

-- tabline
o.showtabline = 0

-- buffer switch and back
o.hidden = true
bo.undofile = true
bo.swapfile = false

-- sign
wo.signcolumn = "yes:2"

-- sync with system clipboard
o.clipboard = "unnamedplus"

-- cmd
o.cmdheight = 1
o.showmode = false

-- number line
wo.number = true
wo.relativenumber = true

-- indent and wrap
o.breakindent = true
o.wrap = false

-- search
o.hlsearch = false
o.ignorecase = true
o.smartcase = true

-- wild
o.wildignorecase = true

-- tab
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true

-- folding
-- wo.foldexpr = "nvim_treesitter#foldexpr()"
-- wo.foldmethod = "expr"
wo.foldmethod = "marker"

-- split
o.splitbelow = true
o.splitright = true

-- spell
bo.spelloptions = "camel"
