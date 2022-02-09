local vim = vim

vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
vim.g.nvim_tree_icons = {
  default = "",
}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_git_hl = 1

local action = require("nvim-tree.config").nvim_tree_callback
local lib = require "nvim-tree.lib"

-- Override winhl
-- require("nvim-tree.view").View.winopts.winhl =
--   "Normal:FocusedWindow,NormalNC:UnfocusedWindow,EndOfBuffer:NvimTreeEndOfBuffer,CursorLine:NvimTreeCursorLine,VertSplit:NvimTreeVertSplit,SignColumn:NvimTreeNormal"
require("nvim-tree.view").View.winopts.cursorline = false

function _G.system_open()
  local node = lib.get_node_at_cursor()
  vim.fn.system { "qlmanage", "-p", node.link_to or node.absolute_path }
end

require("nvim-tree").setup {
  hijack_cursor = true,
  update_cwd = false,
  update_focused_file = {
    enable = true,
    update_cwd = false,
    ignore_list = {},
  },
  view = {
    mappings = {
      custom_only = true,
      list = {
        { key = "q", cb = action "close" },

        { key = "<tab>", cb = action "edit" },

        { key = "o", cb = "<cmd>lua system_open()<cr>" },
        { key = "a", cb = action "create" },
        { key = "d", cb = action "trash" },
        { key = "D", cb = action "remove" },
        { key = "r", cb = action "rename" },
        { key = "<c-r>", cb = action "full_rename" },
        { key = "x", cb = action "cut" },
        { key = "y", cb = action "copy" },
        { key = "p", cb = action "paste" },

        { key = "v", cb = action "vsplit" },
        { key = "s", cb = action "split" },

        { key = "R", cb = action "refresh" },

        { key = "-", cb = action "dir_up" },
        { key = "+", cb = action "cd" },
        { key = ".", cb = action "toggle_dotfiles" },
        { key = "?", cb = action "toggle_help" },
      },
    },
  },
  trash = {
    cmd = "trash -F",
    require_confirm = true,
  },
}
