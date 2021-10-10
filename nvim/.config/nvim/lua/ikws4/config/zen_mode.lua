-- local shade = require "shade"
local wk = require "which-key"

require("zen-mode").setup {
  window = {
    backdrop = 0.92,
    width = 0.78,
    height = 0.88,
    options = {
      signcolumn = "yes:1",
      number = true,
      relativenumber = true,
      cursorline = false,
      cursorcolumn = false,
      foldcolumn = "0",
      list = false,
    },
  },
  plugins = {
    gitsigns = { enabled = true },
    tmux = { enabled = true },
  },
  -- on_open = function(_)
  --   shade.toggle()
  -- end,
  -- on_close = function()
  --   shade.toggle()
  -- end,
}

wk.register {
  ["<leader>z"] = { "<Cmd>ZenMode<CR>", "Toggle zen mode" },
}
