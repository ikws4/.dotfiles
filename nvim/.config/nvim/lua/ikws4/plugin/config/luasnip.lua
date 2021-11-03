---@diagnostic disable: unused-local
local ls = require "luasnip"
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require "luasnip.util.types"
local conds = require "luasnip.extras.expand_conditions"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "choiceNode", "Comment" } },
      },
    },
  },
  ext_base_prio = 300,
  ext_prio_increase = 1,
  enable_autosnippets = true,
}

ls.snippets = {
  java = {
    s(
      { trig = "rfor(%l)(%d*)", hidden = true, regTrig = true },
      fmt(
        [[
          for (int {a} = {1}; {c} >= {b}; {d}--) {{
            {2}
          }}
        ]],
        {
          a = f(function(_, snip)
            return snip.captures[1]
          end, {}),
          b = f(function(_, snip)
            local val = snip.captures[2]

            if val == "" then
              val = "0"
            end

            return val
          end, {}),
          c = f(function(_, snip)
            return snip.captures[1]
          end, {}),
          i(1, "n - 1"),
          d = f(function(_, snip)
            return snip.captures[1]
          end, {}),
          i(2),
        }
      )
    ),
    s(
      { trig = "for(%l)(%d*)", hidden = true, regTrig = true },
      fmt(
        [[
          for (int {a} = {b}; {c} < {1}; {d}++) {{
            {2}
          }}
        ]],
        {
          a = f(function(_, snip)
            return snip.captures[1]
          end, {}),
          b = f(function(_, snip)
            local val = snip.captures[2]

            if val == "" then
              val = "0"
            end

            return val
          end, {}),
          c = f(function(_, snip)
            return snip.captures[1]
          end, {}),
          i(1, "n"),
          d = f(function(_, snip)
            return snip.captures[1]
          end, {}),
          i(2),
        }
      )
    ),
    s(
      { trig = "foreach(%l+)", hidden = true, regTrig = true },
      fmt(
        [[
          for (var {a} : {b}) {{
            {1}
          }}
        ]],
        {
          a = f(function(_, snip)
            return snip.captures[1]
          end, {}),
          b = f(function(_, snip)
            return snip.captures[1] .. "s"
          end, {}),
          i(1),
        }
      )
    )
  },
}

-- autotriggered snippets have to be defined in a separate table, luasnip.autosnippets.
ls.autosnippets = {
  java = {},
}

require("luasnip.loaders.from_vscode").lazy_load {
  paths = { vim.fn.stdpath "data" .. "/site/pack/packer/opt/friendly-snippets" },
}
