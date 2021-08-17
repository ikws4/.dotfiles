local lspconfig = require "lspconfig"
local lspinstall = require "lspinstall"
local lspstatus = require "lsp-status"

vim.fn.sign_define(
  "LspDiagnosticsSignError",
  { texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  { texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
)

vim.lsp.protocol.CompletionItemKind = {
  "   (Text) ",
  "   (Method)",
  "   (Function)",
  "   (Constructor)",
  " ﴲ  (Field)",
  "[] (Variable)",
  "   (Class)",
  " ﰮ  (Interface)",
  "   (Module)",
  " 襁 (Property)",
  "   (Unit)",
  "   (Value)",
  " 練 (Enum)",
  "   (Keyword)",
  "   (Snippet)",
  "   (Color)",
  "   (File)",
  "   (Reference)",
  "   (Folder)",
  "   (EnumMember)",
  " ﲀ  (Constant)",
  " ﳤ  (Struct)",
  "   (Event)",
  "   (Operator)",
  "   (TypeParameter)",
}

local on_attach = function(client, bufnr)
  lspstatus.on_attach(client)

  local bmap = vim.api.nvim_buf_set_keymap
  local opts = { noremap = true, silent = true }
  bmap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  bmap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
  bmap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  bmap(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  bmap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  bmap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  bmap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  bmap(bufnr, "n", "<leader>e", "<cmd>Telescope lsp_workspace_diagnostics<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- lsp-install
local function setup_servers()
  lspinstall.setup()
  local servers = lspinstall.installed_servers()
  for _, server in pairs(servers) do
    local config = {
      on_attach = on_attach,
    }

    if server == "lua" then
      config = require("lua-dev").setup {
        library = {
          vimruntime = true,
          types = true,
          plugins = true,
        },
        lspconfig = {
          on_attach = on_attach,
        },
      }
    end

    config.capabilities = vim.tbl_extend("keep", config.capabilities or {}, lspstatus.capabilities)
    lspconfig[server].setup(config)
  end
end
setup_servers()

-- flutter-tools
require("flutter-tools").setup {
  decorations = {
    statusline = {
      app_version = true,
      device = true,
    },
  },
  lsp = {
    on_attach = on_attach,
  },
}
