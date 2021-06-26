return function()
  local tree_cb = require'nvim-tree.config'.nvim_tree_callback

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
  vim.g.nvim_tree_disable_netrw = 0
  vim.g.nvim_tree_hijack_netrw = 0
  vim.g.nvim_tree_root_folder_modifier = ":t"
  vim.g.nvim_tree_ignore = { ".DS_Store", ".git", "node_modules" }
  vim.g.nvim_tree_highlight_opened_files = 1
  vim.g.nvim_tree_bindings = {
    ["<c-o>"] = "<Cmd>lua as.nvim_tree_os_open()<CR>",
    ["o"]              = tree_cb("edit"),
    ["q"]              = tree_cb("close"),
    ["-"]              = tree_cb("dir_up"),
    ["+"]              = tree_cb("cd"),
    ["."]              = tree_cb("toggle_dotfiles"),
  }
  vim.gnvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged= "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌"
    },
  }

  as.nnoremap("<c-n>", "<cmd>NvimTreeToggle<CR>")
end
