return {
  "numtostr/FTerm.nvim",
  keys = {
    {
      "<leader>m",
      function()
        require("FTerm").open()
      end,
      desc = "Open terminal",
    },
  },
  config = function()
    vim.keymap.set("t", "<esc>", function()
      require("FTerm").close()
    end)

    require("FTerm").setup {
      hl = "Normal",
      border = "rounded",
      dimensions = {
        height = 0.88,
        width = 0.78,
        x = 0.45,
        y = 0.3,
      },
    }
  end,
}
