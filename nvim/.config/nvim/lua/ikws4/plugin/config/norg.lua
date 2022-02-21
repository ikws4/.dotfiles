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
        hook = function(keybinds)
          local leader = keybinds.leader

          -- Map all the below keybinds only when the "norg" mode is active
          keybinds.map_event_to_mode("norg", {
            n = {
              -- Keys for managing GTD
              { leader .. "gc", "core.gtd.base.capture" },
              { leader .. "gv", "core.gtd.base.views" },
              { leader .. "ge", "core.gtd.base.edit" },
            },
            o = {
              { "ah", "core.norg.manoeuvre.textobject.around-heading" },
              { "ih", "core.norg.manoeuvre.textobject.inner-heading" },
              { "at", "core.norg.manoeuvre.textobject.around-tag" },
              { "it", "core.norg.manoeuvre.textobject.inner-tag" },
              { "al", "core.norg.manoeuvre.textobject.around-whole-list" },
            },
          }, {
            silent = true,
            noremap = true,
          })

          -- Map the below keys only when traverse-heading mode is active
          keybinds.map_event_to_mode("traverse-heading", {
            n = {
              -- Rebind j and k to move between headings in traverse-heading mode
              { "j", "core.integrations.treesitter.next.heading" },
              { "k", "core.integrations.treesitter.previous.heading" },
            },
          }, {
            silent = true,
            noremap = true,
          })

          keybinds.map_event_to_mode("toc-split", {
            n = {
              { "<CR>", "core.norg.qol.toc.hop-toc-link" },

              -- Keys for closing the current display
              { "q", "core.norg.qol.toc.close" },
              { "<Esc>", "core.norg.qol.toc.close" },
            },
          }, {
            silent = true,
            noremap = true,
            nowait = true,
          })

          -- Map the below keys on gtd displays
          keybinds.map_event_to_mode("gtd-displays", {
            n = {
              { "<CR>", "core.gtd.ui.goto_task" },

              -- Keys for closing the current display
              { "q", "core.gtd.ui.close" },
              { "<Esc>", "core.gtd.ui.close" },

              { "<Tab>", "core.gtd.ui.details" },
            },
          }, {
            silent = true,
            noremap = true,
            nowait = true,
          })

          -- Map the below keys on presenter mode
          keybinds.map_event_to_mode("presenter", {
            n = {
              { "<CR>", "core.presenter.next_page" },
              { "l", "core.presenter.next_page" },
              { "h", "core.presenter.previous_page" },

              -- Keys for closing the current display
              { "q", "core.presenter.close" },
              { "<Esc>", "core.presenter.close" },
            },
          }, {
            silent = true,
            noremap = true,
            nowait = true,
          })
          -- Apply the below keys to all modes
          keybinds.map_to_mode("all", {
            n = {
              { leader .. "mn", ":Neorg mode norg<CR>" },
              { leader .. "mh", ":Neorg mode traverse-heading<CR>" },
            },
          }, {
            silent = true,
            noremap = true,
          })
        end,
      },
    },
    ["core.norg.qol.toc"] = {},
    -- ["core.norg.manoeuvre"] = {},
    -- ["core.presenter"] = {},
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
