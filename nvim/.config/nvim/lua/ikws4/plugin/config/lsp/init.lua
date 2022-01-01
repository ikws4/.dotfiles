local lsp_installer = require "nvim-lsp-installer"
local utils = require "ikws4.plugin.config.lsp.utils"

vim.lsp.util.open_floating_preview = utils.open_floating_preview
vim.lsp.buf.hover = utils.hover

--- Setup lsp servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities, { snippetSupport = false })

local needSnippetSupportServers = {
  "cssls"
}

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = utils.on_attach,
    capabilities = capabilities,
  }

  if vim.tbl_contains(needSnippetSupportServers, server.name) then
    opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities, {})
    opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
  end

  if server.name == "sumneko_lua" then
    opts = require("lua-dev").setup {
      lspconfig = opts,
    }
  end

  if server.name == "jdtls" then
    opts = vim.tbl_deep_extend("keep", opts, {
      settings = {
        java = {
          format = {
            comments = {
              enabled = false,
            },
            settings = {
              url = "https://gist.githubusercontent.com/ikws4/7880fdcb4e3bf4a38999a628d287b1ab/raw/8e7f86e5ece156345628382cfa5c124322b38b5b/jdtls-formatter-style.xml",
            },
          },
        },
      },
    })
  end

  server:setup(opts)
end)

vim.diagnostic.config {
  underline = true,
  signs = false,
}
