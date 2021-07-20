local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true}

vim.g.mapleader = ' '
map('i', 'jk', '<esc>', opts)

-- window navigation
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-l>', '<c-w>l', opts)
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-k>', '<c-w>k', opts)
