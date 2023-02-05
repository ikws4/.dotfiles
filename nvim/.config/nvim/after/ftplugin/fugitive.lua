local vim = vim

vim.keymap.set("n", "<esc>", "<cmd>q<cr>", { buffer = true })
vim.keymap.set("n", "<tab>", "=", { buffer = true, remap = true })
vim.keymap.set("n", "o", "gO", { buffer = true, remap = true })

vim.wo.number = false
vim.wo.relativenumber = false
