return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "f3fora/cmp-spell",
    "L3MON4D3/LuaSnip",
    {
      "Exafunction/codeium.vim",
      config = function()
        vim.keymap.set("i", "<C-J>", "codeium#Accept()", { silent = true, expr = true, remap = true })
        vim.g.codeium_enabled = false
      end,
    },
  },
  config = function()
    local cmp = require "cmp"
    local api = require "cmp.utils.api"
    local luasnip = require "luasnip"
    local lspkind = require "lspkind"

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
    end

    local api_get_screen_cursor = api.get_screen_cursor
    api.get_screen_cursor = function()
      local cursor = api_get_screen_cursor()
      cursor[2] = math.max(1, cursor[2] - 1)
      return cursor
    end

    cmp.setup {
      -- experimental = { native_menu = false, ghost_text = false },
      window = {
        documentation = {
          border = "rounded",
          winhighlight = "FloatBorder:FloatBorder",
        },
        completion = {
          border = "rounded",
          winhighlight = "FloatBorder:FloatBorder",
        },
      },
      -- completion = {
      --   completeopt = "menu,menuone,noselect",
      -- },
      preselect = cmp.PreselectMode.None,
      mapping = {
        ["<M-l>"] = cmp.mapping(function(fallback)
          if luasnip.expandable() then
            luasnip.expand()
          else
            local codeium_accept_key = vim.fn["codeium#Accept"]()
            if codeium_accept_key ~= "" then
              vim.api.nvim_feedkeys(codeium_accept_key, "i", false)
            elseif cmp.visible() then
              cmp.confirm {
                select = true,
                behavior = cmp.ConfirmBehavior.Replace,
              }
            elseif luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end
        end, {
          "i",
          "s",
        }),
        ["<M-]>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.abort()
          else
            fallback()
          end
        end),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
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
        ["<C-d>"] = cmp.mapping.scroll_docs(1),
        ["<C-u>"] = cmp.mapping.scroll_docs(-1),
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
      },
      confirmation = {
        get_commit_characters = function(_)
          return {}
        end,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        format = lspkind.cmp_format {
          maxwidth = 50,
          preset = "codicons",
          menu = {},
          mode = "symbol",
        },
      },
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
      }, {
        { name = "path" },
      }, {
        { name = "buffer" },
        { name = "spell" },
      }),
    }
  end,
}
