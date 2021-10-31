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

  -- if server.name == "lua" then
  --   local res = require("lua-dev").setup {
  --     library = {
  --       vimruntime = true,
  --       types = true,
  --       plugins = true,
  --     },
  --   }
  --   opts = vim.tbl_deep_extend("force", res, opts)
  -- end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)

-- replace the default lsp diagnostic symbols
local lsp_symbol = function(name, icon)
  vim.fn.sign_define("LspDiagnosticsSign" .. name, { text = icon, numhl = "LspDiagnosticsDefault" .. name })
end

lsp_symbol("Error", "E")
lsp_symbol("Information", "I")
lsp_symbol("Hint", "H")
lsp_symbol("Warning", "W")
