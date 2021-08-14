local tree_cb = require("nvim-tree.config").nvim_tree_callback

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_lsp_diagnostics = 0
vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_width = 30
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_ignore = { ".DS_Store", ".git", "node_modules" }
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_disable_default_keybindings = 1
vim.g.nvim_tree_bindings = {
  { key = "q", cb = tree_cb "close" },

  { key = "<Tab>", cb = tree_cb "preview" },

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

  { key = "o", cb = tree_cb "edit" },
  { key = "-", cb = tree_cb "dir_up" },
  { key = "+", cb = tree_cb "cd" },
  { key = ".", cb = tree_cb "toggle_dotfiles" },
  { key = "?", cb = tree_cb "toggle_help" },
}
vim.gnvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌",
  },
}

vim.api.nvim_set_keymap("n", "<leader>n", [[<cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })
