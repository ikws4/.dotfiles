local telescope = require "telescope"
local actions = require "telescope.actions"
local themes = require "telescope.themes"
local wk = require "which-key"

local ivy_theme = themes.get_ivy {
  layout_config = {
    height = 0.55,
  },
}

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--hidden",
      "--smart-case",
    },
    file_ignore_patterns = {
      "node_modules",
      ".git",
    },
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.file_split,
      },
      n = {
        ["q"] = actions.close,
        ["<C-x>"] = false,
        ["<C-s>"] = actions.file_split,
      },
    },
    -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    -- borderchars = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙", },
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    prompt_prefix = " ",
    selection_caret = " ",
  },
  pickers = {
    lsp_references = ivy_theme,
    lsp_definitions = ivy_theme,
    lsp_implementations = ivy_theme,
    lsp_workspace_diagnostics = ivy_theme,
    lsp_code_actions = themes.get_cursor(),
    current_buffer_fuzzy_find = ivy_theme,
    file_browser = {
      sorting_strategy = "ascending",
      hidden = true,
      layout_config = {
        prompt_position = "top",
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

telescope.load_extension "fzf"

wk.register {
  ["<leader>ff"] = { "<Cmd>Telescope find_files hidden=true<CR>", "Find File" },
  ["<leader>fr"] = { "<Cmd>Telescope oldfiles<CR>", "Open Recent File" },
  ["<leader>bb"] = { "<Cmd>Telescope buffers<CR>", "Switch buffer" },
  ["<leader>sh"] = { "<Cmd>Telescope help_tags<CR>", "Search help" },
  ["<leader>sb"] = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "Search buffer" },
  ["/"] = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "Search buffer" },
  ["<leader>sB"] = { "<cmd>Telescope live_grep grep_open_files=true<CR>", "Search all open buffers" },
  ["<leader>sp"] = { "<Cmd>Telescope live_grep<CR>", "Search project" },
}
