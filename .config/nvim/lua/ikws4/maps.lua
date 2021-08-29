local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
-- map("i", "jk", "<Esc>", opts)

-- window navigation
map("n", "<leader>w", "<C-w>", opts)

-- 5 MUST HAVE VIM REMAPS
-- https://www.youtube.com/watch?v=hSHATqh8svM&t=475s
map("n", "Y", "yg_", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)
map("i", ",", ",<c-g>u", opts)
map("i", ".", ".<c-g>u", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Save buffer
map("n", "<M-s>", ":w<CR>", opts)
map("i", "<M-s>", "<C-[>:w<CR>a", opts)
