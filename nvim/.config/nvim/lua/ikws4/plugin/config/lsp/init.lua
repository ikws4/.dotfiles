require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "rust_analyzer", "sumneko_lua", "jdtls", "tsserver" },
}

local lspconfig = require "lspconfig"
local utils = require "ikws4.plugin.config.lsp.utils"

--- Setup lsp servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities, {
  snippetSupport = false,
})
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

lspconfig.sumneko_lua.setup(require("neodev").setup {
  lspconfig = {
    on_attach = utils.on_attach,
    capabilities = capabilities,
  },
})

lspconfig.tsserver.setup {
  on_attach = utils.on_attach,
  capabilities = capabilities,
}

lspconfig.clangd.setup {
  on_attach = utils.on_attach,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = utils.on_attach,
  capabilities = capabilities,
}

lspconfig.texlab.setup {
  on_attach = utils.on_attach,
  capabilities = capabilities,
}

lspconfig.wgsl_analyzer.setup {
  on_attach = utils.on_attach,
  capabilities = capabilities,
}

lspconfig.omnisharp_mono.setup {
  on_attach = utils.on_attach,
  organize_imports_on_format = true,
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
  settings = {
    omnisharp = {
      useModernNet = false,
    },
  },
}

require("rust-tools").setup {
  tools = {
    inlay_hints = {
      only_current_line = true,
    },
  },
  server = {
    autostart = false,
    on_attach = utils.on_attach,
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
}

require("flutter-tools").setup {
  ui = {
    border = "rounded",
    notification_style = "plugin",
  },
  lsp = {
    on_attach = utils.on_attach,
    capabilities = capabilities,
    settings = {
      showTodos = false,
      completeFunctionCalls = true,
      enableSnippets = false,
    },
  },
}

-- local needSnippetSupportServers = {
--   "cssls",
-- }
--
-- lsp_installer.on_server_ready(function(server)
--   if server.name == "jdtls" then
--     return
--   end
--
--   local opts = {
--     on_attach = utils.on_attach,
--     capabilities = capabilities,
--   }
--
--   if vim.tbl_contains(needSnippetSupportServers, server.name) then
--     opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities, {})
--     opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
--   end
--
--   if server.name == "sumneko_lua" then
--     opts = require("lua-dev").setup {
--       lspconfig = opts,
--     }
--   end
--
--   if server.name == "rust_analyzer" then
--     require("rust-tools").setup {
--       server = vim.tbl_deep_extend("force", server:get_default_options(), opts, {
--         settings = {
--           ["rust-analyzer"] = {
--             completion = {
--               postfix = {
--                 enable = false,
--               },
--             },
--           },
--         },
--       }),
--     }
--     server:attach_buffers()
--     return
--   end
--
--   server:setup(opts)
-- end)

local null_ls = require "null-ls"

null_ls.setup {
  on_attach = utils.on_attach,
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.taplo,
  },
}

vim.lsp.util.open_floating_preview = utils.open_floating_preview
vim.lsp.buf.hover = utils.hover

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
