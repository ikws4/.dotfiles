local keymap = vim.keymap.set

-- Window navigation
keymap("n", "<leader>w", "<C-w>")

-- 5 MUST HAVE VIM REMAPS
-- https://www.youtube.com/watch?v=hSHATqh8svM&t=475s
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "J", "mzJ`z")
keymap("i", ",", ",<C-g>u")
keymap("i", ".", ".<C-g>u")
keymap("n", "<M-s>", "<Cmd>w<CR>")
-- map("x", "K", ":move '<-2<CR>gv")
-- map("x", "J", ":move '>+1<CR>gv")

-- Save buffer
keymap("i", "<M-s>", "<C-[><Cmd>w<CR>a")

-- Toggle folding
-- nnoremap { "<localleader><tab>", "za" }
keymap("n", "<localleader><TAB>", "za")

-- Repeat last command
-- nnoremap { "<localleader>r", "@:" }
keymap("n", "<localleader>r", "@:")

-- Move cursor to the right
keymap("i", "<M-l>", "<Right>")

-- Create text objects using [z and ]z
-- https://superuser.com/questions/578432/can-vim-treat-a-folded-section-as-a-motion
keymap("v", "iz", ":<C-u>silent!normal![zjV]zk<CR>")
keymap("o", "iz", ":normal Viz<CR>")
keymap("v", "az", ":<C-u>silent!normal![zV]z<CR>")
keymap("o", "az", ":normal Vaz<CR>")

-- Window resize
keymap("n", "<Left>", "<Cmd>vertical resize -1<CR>")
keymap("n", "<Right>", "<Cmd>vertical resize +1<CR>")
keymap("n", "<Down>", "<Cmd>resize +1<CR>")
keymap("n", "<Up>", "<Cmd>resize -1<CR>")

-- center cursor
keymap("n", "zz", "zt10<C-y>")

-- Newline
keymap("i", "<M-CR>", "<End><Enter>")

-- Big cursor move
keymap("n", "<M-j>", "5j")
keymap("n", "<M-k>", "5k")

-- move to head
-- map("n", "0", "^")
-- map("v", "0", "^")

keymap("i", "<M-CR>", function()
  if vim.tbl_contains({ "java", "rust", "cs" }, vim.bo.filetype) then
    local line = vim.api.nvim_get_current_line()
    local last_char = line:sub(#line, #line)
    return last_char == ")" and "<End>;<Enter>" or "<End><Enter>"
  end
  return "<End><Enter>"
end, { expr = true })

keymap("i", ";", function()
  if vim.tbl_contains({ "java", "rust", "cs", "vhdl" }, vim.bo.filetype) then
    local line = vim.api.nvim_get_current_line()
    local _, col = unpack(vim.api.nvim_win_get_cursor(0))
    local last_char = line:sub(#line, #line)

    if last_char ~= ";" then
      if col + 1 == #line and last_char == ")" then
        return "<End>;"
      end
    end
  end
  return ";"
end, { expr = true })

keymap("v", "<leader>l", "<Cmd>'<,'>!cat -n<CR>gv<gv<gv<")
