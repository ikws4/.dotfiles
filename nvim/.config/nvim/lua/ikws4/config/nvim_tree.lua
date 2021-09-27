local tree_cb = require("nvim-tree.config").nvim_tree_callback
local wk = require "which-key"

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_width = 30
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_ignore = { ".DS_Store", ".git", "node_modules" }

require("nvim-tree").setup {
  hijack_cursor = true,
  update_cwd = true,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {},
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = "",
    -- the command arguments as a list
    args = {},
  },

  view = {
    mappings = {
      custom_only = true,
      -- list of mappings to set on the tree manually
      list = {

        { key = "q", cb = tree_cb "close" },

        { key = "<Tab>", cb = tree_cb "edit" },

        { key = "a", cb = tree_cb "create" },
        { key = "d", cb = tree_cb "remove" },
        { key = "r", cb = tree_cb "rename" },
        { key = "x", cb = tree_cb "cut" },
        { key = "c", cb = tree_cb "copy" },
        { key = "p", cb = tree_cb "paste" },

        { key = "y", cb = tree_cb "copy_name" },
        { key = "Y", cb = tree_cb "copy_path" },

        { key = "v", cb = tree_cb "vsplit" },
        { key = "s", cb = tree_cb "split" },

        { key = "R", cb = tree_cb "refresh" },

        { key = "-", cb = tree_cb "dir_up" },
        { key = "+", cb = tree_cb "cd" },
        { key = ".", cb = tree_cb "toggle_dotfiles" },
        { key = "?", cb = tree_cb "toggle_help" },
      },
    },
  },
}

wk.register {
  ["<leader>n"] = { "<Cmd>NvimTreeToggle<CR>", "Open file explore" },
}
