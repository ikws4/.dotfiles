return function()

  require("lualine").setup {
    options = {
      theme = "nord",
      section_separators = "",
      component_separators = "",
    },
    extensions = {
      {
        sections = {},
        filetypes = { "NvimTree" }
      }
    }
  }
end
