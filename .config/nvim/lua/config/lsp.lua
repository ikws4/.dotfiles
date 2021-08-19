local lspconfig = require "lspconfig"
local lspinstall = require "lspinstall"
local lspstatus = require "lsp-status"
local flutter_tools = require "flutter-tools"
local null_ls = require "null-ls"

local wk = require "which-key"

local lsp_diagnostic_signs = {
  Error = { text = "", hl = "LspDiagnosticsSignError" },
  Warning = { text = "", hl = "LspDiagnosticsSignWarning" },
  Information = { text = "", hl = "LspDiagnosticsSignInformation" },
  Hint = { text = "", hl = "LspDiagnosticsSignHint" },
}

local on_attach = function(client, bufnr)
  lspstatus.on_attach(client)

  wk.register {
    gD = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "LSP Declaration", buffer = bufnr },
    gd = { "<cmd>Telescope lsp_definitions<CR>", "LSP Definitions", buffer = bufnr },
    gr = { "<cmd>Telescope lsp_references<CR>", "LSP References", buffer = bufnr },
    gi = { "<cmd>Telescope lsp_implementations<CR>", "LSP Implementations", buffer = bufnr },
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP Hover", buffer = bufnr },
    ["<leader>l"] = { name = "+lsp" },
    ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "LSP Rename", buffer = bufnr },
    ["<leader>la"] = { "<cmd>Telescope lsp_code_actions<CR>", "LSP Code Actions", buffer = bufnr },
    ["<leader>ld"] = { "<cmd>Telescope lsp_workspace_diagnostics<CR>", "LSP Diagnostics", buffer = bufnr },
    ["<leader>lf"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "LSP Code Formatting", buffer = bufnr },
  }
end

--- Setup lsp servers
local capabilities = lspstatus.capabilities

-- specific servers
flutter_tools.setup {
  lsp = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint
  },
  on_attach = on_attach
}

-- general servers
lspinstall.setup()
for _, server in pairs(lspinstall.installed_servers()) do
  local config = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server == "lua" then
    local res = require("lua-dev").setup {
      library = {
        vimruntime = true,
        types = true,
        plugins = true,
      },
    }
    config = vim.tbl_deep_extend("force", res, config)
  end

  lspconfig[server].setup(config)
end

--- Define diagnostic signs
for k, v in pairs(lsp_diagnostic_signs) do
  vim.fn.sign_define("LspDiagnosticsSign" .. k, {
    text = v.text,
    texhl = v.hl,
    numhl = v.hl,
  })
end