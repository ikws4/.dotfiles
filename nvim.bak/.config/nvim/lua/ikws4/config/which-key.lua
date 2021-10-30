local wk = require "which-key"

wk.setup {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = false,
      nav = true,
      z = true,
      g = true,
    },
  },
}

wk.register {
  ["<leader>"] = {
    f = { name = "+file" },
    b = { name = "+buffer" },
    g = { name = "+git" },
    s = { name = "+search" },
    w = {
      name = "+window",
      s = "Split window",
      v = "Split window vertically",
      w = "Switch windows",
      q = "Quit a window",
      T = "Break out into a new tab",
      x = "Swap current with next",
      ["-"] = "Decrease height",
      ["+"] = "Increase height",
      ["<lt>"] = "Decrease width",
      [">"] = "Increase width",
      ["|"] = "Max out the width",
      ["="] = "Equally high and wide",
      h = "Go to the left window",
      l = "Go to the right window",
      k = "Go to the up window",
      j = "Go to the down window",
    },
    q = {
      name = "+quickfix",
      o = { "<cmd>copen<CR>", "Open quickfix" },
      c = { "<cmd>cclose<CR>", "Close quickfix" },
      n = { "<cmd>cnext<CR>", "Cycle next quickfix" },
      p = { "<cmd>cprev<CR>", "Cycle prev quickfix" },
    },
  },
}
