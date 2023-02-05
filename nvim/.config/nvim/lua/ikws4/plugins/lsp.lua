local capabilities = {
  textDocument = {
    completion = {
      dynamicRegistration = false,
      completionItem = {
        snippetSupport = false,
        commitCharactersSupport = true,
        deprecatedSupport = true,
        preselectSupport = true,
        tagSupport = {
          valueSet = {
            1, -- Deprecated
          },
        },
        insertReplaceSupport = true,
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
        insertTextModeSupport = {
          valueSet = {
            1, -- asIs
            2, -- adjustIndentation
          },
          labelDetailsSupport = true,
        },
        contextSupport = true,
        insertTextMode = 1,
        completionList = {
          itemDefaults = {
            "commitCharacters",
            "editRange",
            "insertTextFormat",
            "insertTextMode",
            "data",
          },
        },
      },
    },
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    },
  },
}

return {
  "mfussenegger/nvim-jdtls",

  {
    "simrat39/rust-tools.nvim",
    opts = {
      tools = {
        inlay_hints = {
          auto = false,
        },
      },
      server = {
        autostart = false,
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            completion = {
              postfix = {
                enable = false,
              },
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require "null-ls"
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.taplo,
        },
      }
    end,
  },

  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup {}
    end,
  },

  {
    "lvimuser/lsp-inlayhints.nvim",
    config = function()
      require("lsp-inlayhints").setup {
        inlay_hints = {
          highlight = "Comment",
          enabled_at_startup = false,
        },
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = {
            "rust_analyzer",
            "sumneko_lua",
            "jdtls",
            "tsserver",
          },
        },
      },
      "folke/neodev.nvim", -- should load before lspconfig
    "kevinhwang91/nvim-ufo",
    },
    config = function()
      require("mason").setup()

      local lspconfig = require "lspconfig"
      local special_servers = {
        "jdtls",
        "rust_analyzer",
      }
      for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
        if not vim.tbl_contains(special_servers, server) then
          lspconfig[server].setup {
            capabilities = capabilities,
          }
        end
      end

      local vim_lsp_util_open_floating_preview = vim.lsp.util.open_floating_preview
      vim.lsp.util.open_floating_preview = function(contents, syntax, opts)
        opts.border = opts.border or "rounded"
        local floating_bufnr, floating_winnr = vim_lsp_util_open_floating_preview(contents, syntax, opts)
        vim.keymap.set("n", "<esc>", "<cmd>bdelete<cr>", { buffer = floating_bufnr })
        return floating_bufnr, floating_winnr
      end

      local vim_lsp_buf_hover = vim.lsp.buf.hover
      vim.lsp.buf.hover = function()
        if not vim.diagnostic.open_float(nil, { scope = "cursor" }) then
          vim_lsp_buf_hover()
        end
      end

      vim.diagnostic.config {
        underline = true,
        signs = true,
        virtual_text = false,
        severity_sort = true,
      }

      vim.cmd [[
        sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=
        sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=
        sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=
        sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=
      ]]
    end,
  },
}
