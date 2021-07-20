local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

vim.g.mapleader = " "
map("i", "jk", "<esc>", opts)
