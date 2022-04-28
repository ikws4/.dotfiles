local vim = vim

vim.keymap.set("n", "<Esc>", "<Cmd>q<CR>", { buffer = true })
vim.keymap.set("n", "<Tab>", "=", { buffer = true, remap = true })

vim.wo.number = false
vim.wo.relativenumber = false
