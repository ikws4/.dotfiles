local shade = require "shade"
local wk = require "which-key"

require("zen-mode").setup {
  window = {
    backdrop = 1,
    width = 0.7,
    options = {
      signcolumn = "no",
      number = true,
      relativenumber = true,
      cursorline = false,
      cursorcolumn = false,
      foldcolumn = "0",
      list = false,
    },
  },
  plugins = {
    gitsigns = { enabled = false },
    tmux = { enabled = true },
  },
  on_open = function(_)
    shade.toggle()
  end,
  on_close = function()
    shade.toggle()
  end,
}

wk.register {
  ["<leader>z"] = { "<Cmd>ZenMode<CR>", "Toggle zen mode" },
}
