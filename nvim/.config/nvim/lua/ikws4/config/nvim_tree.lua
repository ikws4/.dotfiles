local tree_cb = require("nvim-tree.config").nvim_tree_callback
local lib = require "nvim-tree.lib"
local wk = require "which-key"

-- Override winhl
require("nvim-tree.view").View.winopts.winhl = "Normal:FocusedWindow,NormalNC:UnfocusedWindow,EndOfBuffer:NvimTreeEndOfBuffer,CursorLine:NvimTreeCursorLine,VertSplit:NvimTreeVertSplit,SignColumn:NvimTreeNormal"

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

function _G.system_open()
  local node = lib.get_node_at_cursor()
  vim.fn.system { "qlmanage", "-p", node.link_to or node.absolute_path }
end

require("nvim-tree").setup {
  hijack_cursor = true,
  update_cwd = true,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable = true,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd = true,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {},
  },

  view = {
    mappings = {
      custom_only = true,
      -- list of mappings to set on the tree manually
      list = {

        { key = "q", cb = tree_cb "close" },

        { key = "<Tab>", cb = tree_cb "edit" },

        {
          key = "o",
          cb = "<Cmd>lua system_open()<CR>",
        },
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
