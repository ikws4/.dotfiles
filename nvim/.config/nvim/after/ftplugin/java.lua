-- Settings
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2

-- Lsp
local lsp_utils = require "ikws4.plugin.config.lsp.utils"
local lsp_installer = require "nvim-lsp-installer"
local ok, jdtls = lsp_installer.get_server "jdtls"

if ok == false then
  vim.notify("lsp_installer: jdtls not found, please install it first", vim.log.levels.ERROR)
  return
end

local config = {
  on_attach = function(client, bufnr)
    require("jdtls.setup").add_commands()
    lsp_utils.on_attach(client, bufnr)
  end,

  cmd = jdtls:get_default_options().cmd,
  root_dir = jdtls:get_default_options().root_dir,
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

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.java",
  callback = function()
    local params = vim.lsp.util.makerange_params()
    local bufnr = vim.api.nvim_get_current_buf()
    params.context = {
      diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr),
    }
    local result, err = vim.lsp.buf_request_sync(0, "java/organizeImports", params)

    if err then
      print("Error on organize imports: " .. err)
      return
    end

    if result and result[1].result then
      vim.lsp.util.apply_workspace_edit(result[1].result, "utf-16")
    end
  end,
})
