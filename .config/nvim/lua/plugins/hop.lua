return function()
  local map = vim.api.nvim_set_keymap
  local opts = {noremap = true, silent = true}

  require("hop").setup()

  map("n", "fw", [[<cmd>HopWord<CR>]], opts)
  map("n", "fl", [[<cmd>HopLine<CR>]], opts)
end
