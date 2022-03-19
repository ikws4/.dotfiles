local lsp_installer = require "nvim-lsp-installer"
local utils = require "ikws4.plugin.config.lsp.utils"

vim.lsp.util.open_floating_preview = utils.open_floating_preview
vim.lsp.buf.hover = utils.hover

--- Setup lsp servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities, { snippetSupport = false })

local needSnippetSupportServers = {
  "cssls",
}

lsp_installer.on_server_ready(function(server)
  if server.name == "jdtls" then
    return
  end

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

  server:setup(opts)
end)

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
