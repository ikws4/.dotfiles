local lsp_utils = require "ikws4.plugin.config.lsp.utils"
local lsp_installer = require "nvim-lsp-installer"
local ok, jdtls = lsp_installer.get_server "jdtls"

if ok == false then
  vim.notify("lsp_installer: jdtls not found, please install it first", vim.log.levels.ERROR)
  return
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  on_attach = function(client, bufnr)
    require('jdtls.setup').add_commands()
    lsp_utils.on_attach(client, bufnr)
  end,

  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = jdtls:get_default_options().cmd,

  root_dir = jdtls:get_default_options().root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
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

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {},
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)
