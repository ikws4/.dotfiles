local mason_lspconfig = require "mason-lspconfig"

local function get_server(name)
  local servers = mason_lspconfig.get_installed_servers()
  if vim.tbl_contains(servers, name) then
    return true, require("lspconfig")[name]
  end
  return false, nil
end

local ok, jdtls = get_server "jdtls"

if not ok then
  vim.notify("mason-lspconfig: jdtls not found, please install it first", vim.log.levels.ERROR)
  return
end

local default_config = jdtls.document_config.default_config

local config = {
  on_attach = function()
    require("jdtls.setup").add_commands()
  end,
  cmd = default_config.cmd,
  root_dir = default_config.root_dir(),
  settings = {
    java = {
      format = {
        comments = {
          enabled = false,
        },
        settings = {
          url = "https://gist.githubusercontent.com/ikws4/7880fdcb4e3bf4a38999a628d287b1ab/raw/9005c451ed1ff629679d6100e22d63acc805e170/jdtls-formatter-style.xml",
        },
      },
    },
  },
  init_options = {
    bundles = {},
  },
}
require("jdtls").start_or_attach(config)

-- Organize import on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.java",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    local bufnr = vim.api.nvim_get_current_buf()
    params.context = {
      diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr),
    }
    local result, err = vim.lsp.buf_request_sync(0, "java/organizeImports", params)

    if err then
      print("Error on organize imports: " .. err)
      return
    end

    result = vim.tbl_values(result)
    if result and result[1].result then
      vim.lsp.util.apply_workspace_edit(result[1].result, "utf-16")
    end
  end,
})
