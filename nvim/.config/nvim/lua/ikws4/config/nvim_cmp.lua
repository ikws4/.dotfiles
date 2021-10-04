local cmp = require "cmp"
local lspkind = require "lspkind"

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

cmp.setup {
  experimental = {
    cusom_menu = true,
    ghost_text = true,
  },
  completion = {
    completeopt = "menu,menuone,noselect",
  },
  mapping = {
    ["<M-l>"] = cmp.mapping(function(fallback)
      if vim.fn["vsnip#available"](1) == 1 then
        vim.fn.feedkeys(t "<Plug>(vsnip-expand-or-jump)", "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<M-L>"] = cmp.mapping(function(fallback)
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        vim.fn.feedkeys(t "<Plug>(vsnip-jump-prev)", "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif check_back_space() then
        vim.fn.feedkeys(t "<tab>", "n")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = lspkind.presets.codicons[vim_item.kind]
      return vim_item
    end,
  },
  sources = {
    { name = "vsnip" },
    { name = "nvim_lsp" },
    { name = "neorg" },
    { name = "path" },
    { name = "spell" },
    { name = "buffer" },
  },
}
