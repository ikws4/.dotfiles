-- Window navigation
vim.keymap.set("n", "<leader>w", "<C-w>")

-- 5 MUST HAVE VIM REMAPS
-- https://www.youtube.com/watch?v=hSHATqh8svM&t=475s
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("i", ",", ",<C-g>u")
vim.keymap.set("i", ".", ".<C-g>u")
vim.keymap.set("n", "<M-s>", "<Cmd>w<CR>")
-- vim.keymap.set("x", "K", ":move '<-2<CR>gv")
-- vim.keymap.set("x", "J", ":move '>+1<CR>gv")

-- Save buffer
vim.keymap.set("i", "<M-s>", "<C-[><Cmd>w<CR>a")

-- Toggle folding
-- nnoremap { "<localleader><tab>", "za" }
vim.keymap.set("n", "<localleader><TAB>", "za")

-- Toggle spell
vim.keymap.set("n", "<localleader>s", function()
  vim.o.spell = not vim.o.spell
end)

-- Repeat last command
-- nnoremap { "<localleader>r", "@:" }
vim.keymap.set("n", "<localleader>r", "@:")

-- Move cursor to the right
vim.keymap.set("i", "<M-l>", "<Right>")

-- Create text objects using [z and ]z
-- https://superuser.com/questions/578432/can-vim-treat-a-folded-section-as-a-motion
vim.keymap.set("v", "iz", ":<C-u>silent!normal![zjV]zk<CR>")
vim.keymap.set("o", "iz", ":normal Viz<CR>")
vim.keymap.set("v", "az", ":<C-u>silent!normal![zV]z<CR>")
vim.keymap.set("o", "az", ":normal Vaz<CR>")

-- Window resize
vim.keymap.set("n", "<Left>", "<Cmd>vertical resize -1<CR>")
vim.keymap.set("n", "<Right>", "<Cmd>vertical resize +1<CR>")
vim.keymap.set("n", "<Down>", "<Cmd>resize +1<CR>")
vim.keymap.set("n", "<Up>", "<Cmd>resize -1<CR>")

-- center cursor
vim.keymap.set("n", "zz", "zt10<C-y>")

-- Newline
vim.keymap.set("i", "<M-CR>", "<End><Enter>")

-- Big cursor move
vim.keymap.set("n", "<M-j>", "5j")
vim.keymap.set("n", "<M-k>", "5k")

-- move to head
-- vim.keymap.set("n", "0", "^")
-- vim.keymap.set("v", "0", "^")
