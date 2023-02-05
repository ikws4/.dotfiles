local o = vim.o
local bo = vim.bo
local wo = vim.wo

o.termguicolors = true

o.mouse = "a"

o.updatetime = 250
o.guicursor = "n-c-sm:block,i-ci-ve:ver25,v-r-cr-o:hor20"

o.fillchars = "eob: ,foldsep: ,foldclose: ,foldopen: "

-- tabline
o.showtabline = 0

-- buffer switch and back
o.hidden = true
bo.undofile = false
bo.swapfile = false

-- sign
wo.foldcolumn = "1"
wo.signcolumn = "yes:1"

-- sync with system clipboard
o.clipboard = "unnamedplus"

-- cmd
o.cmdheight = 1
o.showmode = false

-- number & cursor line
wo.number = true
wo.relativenumber = true
wo.cursorline = true
wo.cursorlineopt = "number"

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
-- wo.foldmethod = "marker"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true;

-- split
o.splitbelow = true
o.splitright = true

-- spell
bo.spelloptions = "camel"

o.cmdheight = 0
