return function()
  require("FTerm").setup()
  vim.api.nvim_set_keymap("n", "<leader>t", [[<cmd>lua require("FTerm").open()<CR>]], {noremap = true, silent = true})
  vim.api.nvim_set_keymap("t", "<esc>", [[<cmd>lua require("FTerm").close()<CR>]], {noremap = true, silent = true})
end
