---@diagnostic disable: redundant-parameter
local telescope = require "telescope"
local actions = require "telescope.actions"
local themes = require "telescope.themes"

local ivy_theme = themes.get_ivy {
  layout_config = {
    height = 0.55,
    preview_width = 0.4
  },
}

-- local ivy_theme_normal = themes.get_ivy {
--   initial_mode = "normal",
--   layout_config = {
--     height = 0.55,
--   },
-- }

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
      "^node_modules/",
      "^vendor/",
      "^.git/",
      ".DS_Store",
    },
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.file_split,
        ["<Esc>"] = actions.close,
      },
      n = {
        ["q"] = actions.close,
        ["<C-x>"] = false,
        ["<C-s>"] = actions.file_split,
      },
    },
    -- borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    -- borderchars = { "▀", "▐", "▄", "▌", "▛", "▜", "▟", "▙", },
    -- borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    layout_config = {
      preview_width = 0.6,
    },
  },
  pickers = {
    lsp_references = ivy_theme,
    lsp_definitions = ivy_theme,
    lsp_implementations = ivy_theme,
    diagnostics = ivy_theme,
    -- lsp_workspace_diagnostics = ivy_theme,
    -- lsp_code_actions = themes.get_cursor(),
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
    ["ui-select"] = {
      themes.get_cursor {
        -- initial_mode = "normal",
        scroll_strategy = "limit",
        layout_config = {
          width = function(self, _, _)
            local max_len = 0
            for _, entry in ipairs(self.finder.results) do
              max_len = math.max(max_len, #entry.display)
            end
            return math.min(40, max_len + 6)
          end,
          height = function(self, _, _)
            return math.min(9, #self.finder.results + 4)
          end,
        },
      },
    },
  },
}

telescope.load_extension "fzf"
telescope.load_extension "ui-select"
