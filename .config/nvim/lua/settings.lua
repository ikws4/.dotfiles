local o = vim.o
local bo = vim.bo

o.termguicolors = true
o.showmode = false
o.hidden = true
bo.swapfile = false

-- cmd
o.cmdheight = 2

-- number line
o.number = true
o.relativenumber = true

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
