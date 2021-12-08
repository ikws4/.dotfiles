local lspconfig = require "lspconfig"
local lsp_installer = require "nvim-lsp-installer"

local on_attach = function(client, bufnr)
  -- Disable builtin formating
  -- client.resolved_capabilities.document_formatting = false
  -- client.resolved_capabilities.document_range_formatting = false

  local nnoremap = vim.keymap.nnoremap

  nnoremap { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", buffer = bufnr }
  nnoremap { "gd", "<cmd>Telescope lsp_definitions<cr>", buffer = bufnr }
  nnoremap { "gr", "<cmd>Telescope lsp_references<cr>", buffer = bufnr }
  nnoremap { "gi", "<cmd>Telescope lsp_implementations<cr>", buffer = bufnr }
  nnoremap { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", buffer = bufnr }
  nnoremap { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", buffer = bufnr }
  nnoremap { "<leader>la", "<cmd>Telescope lsp_code_actions<cr>", buffer = bufnr }
  nnoremap { "<leader>ld", "<cmd>Telescope lsp_workspace_diagnostics<cr>", buffer = bufnr }
  nnoremap { "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", buffer = bufnr }

  vim.keymap.vnoremap { "<leader>la", "<cmd>Telescope lsp_range_code_actions<cr>", buffer = bufnr }
  vim.keymap.vnoremap { "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", buffer = bufnr }
end

--- Setup lsp servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities, { snippetSupport = false })

-- null-ls
lspconfig["null-ls"].setup {
  on_attach = on_attach,
}

-- lsp installer
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server.name == "sumneko_lua" then
    opts = require("lua-dev").setup {
      lspconfig = opts
    }
  end

  server:setup(opts)
end)

vim.diagnostic.config {
  underline = true,
  signs = false,
}

-- replace the default lsp diagnostic symbols
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
--   local hl = "DiagnosticSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "LineNr" })
-- end
