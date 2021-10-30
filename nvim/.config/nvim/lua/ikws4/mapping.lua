local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local vnoremap = vim.keymap.vnoremap

-- inoremap { "jk", "<esc>" }

-- Window navigation
nnoremap { "<leader>w", "<c-w>" }

-- 5 MUST HAVE VIM REMAPS
-- https://www.youtube.com/watch?v=hSHATqh8svM&t=475s
nnoremap { "Y", "yg_" }
nnoremap { "n", "nzzzv" }
nnoremap { "N", "Nzzzv" }
nnoremap { "J", "mzJ`z" }
inoremap { ",", ",<c-g>u" }
inoremap { ".", ".<c-g>u" }
vnoremap { "v", "J", "<cmd>m '>+1<CR>gv=gv" }
vnoremap { "v", "K", "<cmd>m '<-2<CR>gv=gv" }

-- Save buffer
nnoremap { "<m-s>", "<cmd>w<cr>" }
inoremap { "<m-s>", "<c-[><cmd>w<cr>a" }

-- Toggle folding
nnoremap { "<localleader><tab>", "za" }

-- Toggle spell
nnoremap { "<localleader>s", "<cmd>lua vim.o.spell = not vim.o.spell<cr>" }

-- Repeat last command
nnoremap { "<localleader>r", "@:" }
