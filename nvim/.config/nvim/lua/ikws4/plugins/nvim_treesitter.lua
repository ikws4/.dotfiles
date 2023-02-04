return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "java",
        "json",
        "javascript",
        "typescript",
        "bash",
        "toml",
        "lua",
        "rust",
        "c_sharp",
        "markdown",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { "python", "java", "dart" },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    }
  end,
}
