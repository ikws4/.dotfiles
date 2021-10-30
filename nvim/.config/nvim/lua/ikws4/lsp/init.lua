local lspconfig = require "lspconfig"
local lsp_installer = require "nvim-lsp-installer"
-- local lsp_status = require "lsp-status"
local null_ls = require "null-ls"
local wk = require "which-key"

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
  vim.fn.sign_define("LspDiagnosticsSign" .. name, { text = icon, numhl = "LspDiagnosticsDefault" .. name })
end

lspSymbol("Error", "E")
lspSymbol("Information", "I")
lspSymbol("Hint", "H")
lspSymbol("Warning", "W")

local on_attach = function(client, bufnr)
  -- Disable builtin formating
  -- TODO: should add more formatter in null_ls
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  -- lsp_status.on_attach(client)

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

  wk.register {
    ["<leader>la"] = { "<cmd>Telescope lsp_range_code_actions<CR>", "LSP Range Code Actions", buffer = bufnr, mode = "v" },
  }
end

--- Setup lsp servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities, { snippetSupport = false })

-- specific servers
null_ls.config {
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.autopep8,
  },
}

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

  if server.name == "lua" then
    local res = require("lua-dev").setup {
      library = {
        vimruntime = true,
        types = true,
        plugins = true,
      },
    }
    opts = vim.tbl_deep_extend("force", res, opts)
  end

  server:setup(opts)
  vim.cmd [[ do User LspAttachBuffers ]]
end)
