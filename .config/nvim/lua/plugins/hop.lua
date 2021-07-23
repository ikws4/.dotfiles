return function()
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  require("hop").setup()

  map("n", "ff", [[<cmd>HopChar2<CR>]], opts)
end
