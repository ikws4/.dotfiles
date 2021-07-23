return function()
  local lspconfig = require "lspconfig"
  local lspinstall = require "lspinstall"

  local map = vim.api.nvim_set_keymap
  local bmap = vim.api.nvim_buf_set_keymap

  local on_attach = function(_, bufnr)
    -- vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    local opts = { noremap = true, silent = true }
    bmap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    bmap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    bmap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    bmap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    bmap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    bmap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    bmap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    bmap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    bmap(bufnr, "n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    bmap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    bmap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    bmap(bufnr, "n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
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

      lspconfig[server].setup(config)
    end
  end
  setup_servers()

  -- flutter-tools
  require("flutter-tools").setup {
    lsp = {
      on_attach = on_attach,
    },
  }

  -- Compe
  vim.o.completeopt = "menuone,noselect"

  require("compe").setup {
    source = {
      nvim_lsp = { priority = 100 },
      path = { priority = 99 },
    },
  }

  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
    local col = vim.fn.col "." - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
      return true
    else
      return false
    end
  end

  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  -- local luasnip = require "luasnip"

  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
      --[[ elseif luasnip.expand_or_jumpable() then
      return t "<Plug>luasnip-expand-or-jump" ]]
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn["compe#complete"]()
    end
  end

  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
      --[[ elseif luasnip.jumpable(-1) then
      return t "<Plug>luasnip-jump-prev" ]]
    else
      return t "<S-Tab>"
    end
  end

  -- Map tab to the above tab complete functiones
  local opts = { expr = true }
  map("i", "<Tab>", "v:lua.tab_complete()", opts)
  map("s", "<Tab>", "v:lua.tab_complete()", opts)
  map("i", "<S-Tab>", "v:lua.s_tab_complete()", opts)
  map("s", "<S-Tab>", "v:lua.s_tab_complete()", opts)
end
