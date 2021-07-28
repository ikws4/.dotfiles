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
local map = vim.api.nvim_set_keymap
local opts = { expr = true }
map("i", "<Tab>", "v:lua.tab_complete()", opts)
map("s", "<Tab>", "v:lua.tab_complete()", opts)
map("i", "<S-Tab>", "v:lua.s_tab_complete()", opts)
