require("hop").setup()

vim.api.nvim_set_keymap("n", "f", [[<cmd>HopChar2<CR>]], { noremap = true, silent = true })
