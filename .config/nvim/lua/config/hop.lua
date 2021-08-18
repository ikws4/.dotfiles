require("hop").setup()

vim.api.nvim_set_keymap("n", "F", [[<cmd>HopChar2BC<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "f", [[<cmd>HopChar2AC<CR>]], { noremap = true, silent = true })
