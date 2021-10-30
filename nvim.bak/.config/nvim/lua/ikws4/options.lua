local o = vim.o
local bo = vim.bo
local wo = vim.wo

vim.g.mapleader = " "

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

-- don't load the plugins below
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
-- vim.g.did_load_filetypes = 1
