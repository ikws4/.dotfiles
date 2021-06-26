as.lsp = {}
-----------------------------------------------------------------------------//
-- Autocommands
-----------------------------------------------------------------------------//
local function setup_autocommands(client, _)
  -- if client and client.resolved_capabilities.code_lens then
  --   as.augroup("LspCodeLens", {
  --     {
  --       events = { "BufEnter", "CursorHold", "InsertLeave" },
  --       targets = { "<buffer>" },
  --       command = vim.lsp.codelens.refresh,
  --     },
  --   })
  -- end
  if client and client.resolved_capabilities.document_highlight then
    as.augroup("LspCursorCommands", {
      {
        events = { "CursorHold" },
        targets = { "<buffer>" },
        command = vim.lsp.buf.document_highlight,
      },
      {
        events = { "CursorHoldI" },
        targets = { "<buffer>" },
        command = vim.lsp.buf.document_highlight,
      },
      {
        events = { "CursorMoved" },
        targets = { "<buffer>" },
        command = vim.lsp.buf.clear_references,
      },
    })
  end
  -- if client and client.resolved_capabilities.document_formatting then
  --   -- format on save
  --   as.augroup("LspFormat", {
  --     {
  --       events = { "BufWritePre" },
  --       targets = { "<buffer>" },
  --       command = "lua vim.lsp.buf.formatting_sync(nil, 5000)",
  --     },
  --   })
  -- end
end


-----------------------------------------------------------------------------//
-- Mappings
-----------------------------------------------------------------------------/

---Setup mapping when an lsp attaches to a buffer
---@param client table lsp client
---@param bufnr integer?
local function setup_mappings(client, bufnr)
  -- check that there are no existing mappings before assigning these
  local nnoremap, vnoremap, opts =
    as.nnoremap, as.vnoremap, { buffer = bufnr, check_existing = true }

  nnoremap("gd", vim.lsp.buf.definition, opts)
  if client.resolved_capabilities.implementation then
    nnoremap("gi", vim.lsp.buf.implementation, opts)
  end

  if client.resolved_capabilities.type_definition then
    nnoremap("<leader>gd", vim.lsp.buf.type_definition, opts)
  end

  nnoremap("<leader>ca", vim.lsp.buf.code_action, opts)
  vnoremap("<leader>ca", vim.lsp.buf.range_code_action, opts)

  nnoremap("]c", function()
    vim.lsp.diagnostic.goto_prev {
      popup_opts = { border = "rounded", focusable = false },
    }
  end, opts)

  nnoremap("[c", function()
    vim.lsp.diagnostic.goto_next {
      popup_opts = { border = "rounded", focusable = false },
    }
  end, opts)

  nnoremap("K", vim.lsp.buf.hover, opts)
  nnoremap("gI", vim.lsp.buf.incoming_calls, opts)
  nnoremap("gr", vim.lsp.buf.references, opts)

  if client.supports_method "textDocument/rename" then
    nnoremap("<leader>rn", vim.lsp.buf.rename, opts)
  end

  nnoremap("<leader>cs", vim.lsp.buf.document_symbol, opts)
  nnoremap("<leader>cw", vim.lsp.buf.workspace_symbol, opts)
  nnoremap("<leader>rf", vim.lsp.buf.formatting, opts)
  require("which-key").register {
    ["<leader>rf"] = "lsp: format buffer",
    ["<leader>ca"] = "lsp: code action",
    ["<leader>gd"] = "lsp: go to type definition",
    ["gr"] = "lsp: references",
    ["gi"] = "lsp: implementation",
    ["gI"] = "lsp: incoming calls",
  }
end

as.lsp.servers = {
  lua = function()
    --- NOTE: This is the secret sauce that allows reading requires and variables
    --- between different modules in the nvim lua context
    --- @see https://gist.github.com/folke/fe5d28423ea5380929c3f7ce674c41d8
    --- if I ever decide to move away from lua dev then use the above
    return require("lua-dev").setup {
      lspconfig = {
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim",
              },
            },
            completion = { keywordSnippet = "Replace", callSnippet = "Replace" },
          },
        },
      },
    }
  end
}

require("vim.lsp.protocol").CompletionItemKind = {
  " Text", -- Text
  " Method", -- Method
  "ƒ Function", -- Function
  " Constructor", -- Constructor
  "識 Field", -- Field
  " Variable", -- Variable
  " Class", -- Class
  "ﰮ Interface", -- Interface
  " Module", -- Module
  " Property", -- Property
  " Unit", -- Unit
  " Value", -- Value
  "了 Enum", -- Enum
  " Keyword", -- Keyword
  " Snippet", -- Snippet
  " Color", -- Color
  " File", -- File
  "渚 Reference", -- Reference
  " Folder", -- Folder
  " Enum", -- Enum
  " Constant", -- Constant
  " Struct", -- Struct
  "鬒 Event", -- Event
  "\u{03a8} Operator", -- Operator
  " Type Parameter", -- TypeParameter
}

function as.lsp.on_attach(client, bufnr)
  setup_autocommands(client, bufnr)
  setup_mappings(client, bufnr)
end

-----------------------------------------------------------------------------//
-- Language servers
-----------------------------------------------------------------------------//
--- LSP server configs are setup dynamically as they need to be generated during
--- startup so things like runtimepath for lua is correctly populated
as.lsp.servers = {
  lua = function()
    --- NOTE: This is the secret sauce that allows reading requires and variables
    --- between different modules in the nvim lua context
    --- @see https://gist.github.com/folke/fe5d28423ea5380929c3f7ce674c41d8
    --- if I ever decide to move away from lua dev then use the above
    return require("lua-dev").setup {
      lspconfig = {
        settings = {
          Lua = {
            diagnostics = {
              globals = {
                "vim",
                "describe",
                "it",
                "before_each",
                "after_each",
                "pending",
                "teardown",
              },
            },
            completion = { keywordSnippet = "Replace", callSnippet = "Replace" },
          },
        },
      },
    }
  end,
}

-----------------------------------------------------------------------------//
-- Commands
-----------------------------------------------------------------------------//
local command = as.command

command {
  "LspLog",
  function()
    local path = vim.lsp.get_log_path()
    vim.cmd("edit " .. path)
  end,
}

command {
  "Format",
  function()
    vim.lsp.buf.formatting_sync({
			insertSpaces = true,
		}, 1000)
  end,
}

return function()
  if vim.g.lspconfig_has_setup then
    return
  end
  vim.g.lspconfig_has_setup = true

  -----------------------------------------------------------------------------//
  -- Handler overrides
  -----------------------------------------------------------------------------//
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      underline = true,
      virtual_text = false,
      signs = true,
      update_in_insert = false,
    }
  )

  local max_width = math.max(math.floor(vim.o.columns * 0.7), 100)
  local max_height = math.max(math.floor(vim.o.lines * 0.3), 30)

  -- NOTE: the hover handler returns the bufnr,winnr so can be used for mappings
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = "rounded", max_width = max_width, max_height = max_height }
  )

  local lspinstall = require "lspinstall"
  local lspconfig = require "lspconfig"

  lspinstall.setup()
  local installed = lspinstall.installed_servers()
  for _, server in pairs(installed) do
    local mk_config = as.lsp.servers[server]
    local config = mk_config and mk_config() or {}
    config.flags = config.flags or {}
    config.flags.debounce_text_changes = 150
    config.on_attach = as.lsp.on_attach
    if not config.capabilities then
      config.capabilities = vim.lsp.protocol.make_client_capabilities()
    end
    config.capabilities.textDocument.completion.completionItem.snippetSupport = true
    config.capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    }
    lspconfig[server].setup(config)
  end
end
