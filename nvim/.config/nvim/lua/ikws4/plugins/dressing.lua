return {
  "stevearc/dressing.nvim",
  config = function()
    require("dressing").setup {
      input = {
        enabled = true,
        anchor = "NW",
        win_options = {
          winblend = 0,
        },
      },
      select = {
        enabled = true,
        backend = { "telescope" },
        telescope = require("telescope.themes").get_cursor {
          scroll_strategy = "limit",
          layout_config = {
            width = function(self, _, _)
              local max_len = 0
              for _, entry in ipairs(self.finder.results) do
                -- https://github.com/stevearc/dressing.nvim/commit/e3b31d45bc65d1b1c48615110373e7e375104d6f
                entry.display = entry.ordinal
                max_len = math.max(max_len, #entry.display)
              end
              return math.max(35, max_len + 6)
            end,
            height = function(self, _, _)
              return math.min(9, #self.finder.results + 4)
            end,
          },
        },
      },
    }
  end,
}
