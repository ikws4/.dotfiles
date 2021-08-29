local wk = require "which-key"

wk.register {
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files hidden=true<CR>", "Find File" },
      r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
    },
    b = {
      name = "+buffer",
      b = { "<cmd>Telescope buffers<CR>", "Switch buffer" },
    },
    g = {
      name = "+git",
      g = { "<cmd>Neogit kind=split_above<CR>", "Neogit status" },
      b = { "<cmd>Neogit branch<CR>", "Neogit branch" },
      ["["] = { "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", "Jump to previous hunk", expr = true },
      ["]"] = { "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", "Jump to next hunk", expr = true },
      s = { "<cmd>Gitsigns stage_hunk<CR>", "Git stage hunk" },
      u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Git unstage hunk" },
      r = { "<cmd>Gitsigns reset_stage_hunk<CR>", "Revert hunk" },
      R = { "<cmd>Gitsigns reset_buffer<CR>", "Revert file" },
    },
    s = {
      name = "+search",
      h = { "<cmd>Telescope help_tags<CR>", "Search help" },
      b = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search buffer" },
      B = { "<cmd>lua require('telescope.builtin').live_grep({ grep_open_files = true })<CR>", "Search all open buffers" },
      p = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Search project" },
    },
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
    z = { "<cmd>ZenMode<CR>", "Toggle zen mode" },
    -- n = { "<cmd>Telescope file_browser<CR>", "Open file browser"}
  },
}

wk.setup {
  plugins = {
    marks = true,
    registers = true,
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
