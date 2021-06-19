require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    custom_captures = {
      ["operator"] = "Operator",
      ["variable.builtin"] = "Operator",
      ["constant.builtin"] = "Operator",
      ["attribute"] = "typescriptDecorator",
      ["annotation"] = "typescriptDecorator",
      ["method"] = "Function",
      ["type"] = "asciidocListingBlock",
      ["variable"] = "Identifier",
      ["comment"] = "Comment",
      ["text.emphasis"] = "rustMacro",
    },
  },
  indent = {
    enable = false,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = {"BufWrite", "CursorHold"},
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false
  },
  refactor = {
    smart_rename = {
      enable = false,
      keymaps = {
        smart_rename = "grn",
      },
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = false,
      goto_next_start = {
        ["f"] = "@function.inner",
      },
      goto_previous_start = {
        ["F"] = "@function.inner",
      },
    },
  },
}
