local nnoremap = vim.keymap.nnoremap
local snoremap = vim.keymap.snoremap
local inoremap = vim.keymap.inoremap
local vnoremap = vim.keymap.vnoremap
local xnoremap = vim.keymap.xnoremap
local onoremap = vim.keymap.onoremap

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
xnoremap { "J", ":move '>+1<CR>gv" }
xnoremap { "K", ":move '<-2<CR>gv" }

-- Save buffer
nnoremap { "<m-s>", "<cmd>w<cr>" }
inoremap { "<m-s>", "<c-[><cmd>w<cr>a" }

-- Toggle folding
nnoremap { "<localleader><tab>", "za" }

-- Toggle spell
nnoremap { "<localleader>s", "<cmd>lua vim.o.spell = not vim.o.spell<cr>" }

-- Repeat last command
nnoremap { "<localleader>r", "@:" }

-- Move cursor to the right
inoremap { "<M-l>", "<Right>" }
-- inoremap { "<Home>", "<C-o>I" }
-- inoremap { "<M-;>", "<End>" }
-- nnoremap { "<M-;>", "<End>" }
-- snoremap { "<M-;>", "<End>" }

-- Create text objects using [z and ]z
-- https://superuser.com/questions/578432/can-vim-treat-a-folded-section-as-a-motion
vnoremap { "iz", ":<C-U>silent!normal![zjV]zk<CR>" }
onoremap { "iz", ":normal Viz<CR>" }
vnoremap { "az", ":<C-U>silent!normal![zV]z<CR>" }
onoremap { "az", ":normal Vaz<CR>" }

nnoremap { "zz", "zt10<C-y>" }

-- Newline without comments
inoremap { "<M-CR>", "<End><Enter><C-[>cc" }

-- Window resize
nnoremap { "<Left>", "<cmd>vertical resize -1<CR>" }
nnoremap { "<Right>", "<cmd>vertical resize +1<CR>" }
nnoremap { "<Down>", "<cmd>resize +1<CR>" }
nnoremap { "<Up>", "<cmd>resize -1<CR>" }
