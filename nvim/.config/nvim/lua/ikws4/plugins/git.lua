return {
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
    keys = {
      { "<leader>gg", "<cmd>tab Git<cr>", desc = "Open git" },
    },
    dependencies = {
      "tpope/vim-rhubarb",
    },
  },

  -- {
  --   "rhysd/conflict-marker.vim",
  --   config = function()
  --     vim.g.conflict_marker_begin = "^<<<<<<< .*$"
  --     vim.g.conflict_marker_common_ancestors = '^||||||| .*$'
  --     vim.g.conflict_marker_end = "^>>>>>>> .*$"
  --   end,
  -- },
  {
    "akinsho/git-conflict.nvim",
    version = "v1.0.0",
    opts = {
      -- highlights = {
      --   current = "ConflictMarkerCurrent",
      --   ancestor = "ConflictMarkerAncestor",
      --   incoming = "ConflictMarkerIncoming",
      -- },
    },
  },
}
