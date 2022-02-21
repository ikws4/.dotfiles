require("neorg").setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          gtd = "~/dev/github/notes/gtd/",
          article = "~/dev/github/notes/",
        },
        autochdir = true,
      },
    },
    ["core.norg.concealer"] = {
      config = {
        icons = {
          quote = {
            enabled = false,
          },
          heading = {
            enabled = false,
          },
          marker = {
            enabled = false,
          },
          definition = {
            enabled = false,
          },
          footnote = {
            enabled = false,
          },
        },
      },
    },
    ["core.keybinds"] = {
      config = {
        default_keybinds = false,
      },
    },
    ["core.norg.qol.toc"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.gtd.base"] = {
      config = {
        workspace = "gtd",
      },
    },
  },
}
