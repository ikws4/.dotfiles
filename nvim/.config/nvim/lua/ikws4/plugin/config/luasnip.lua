local ls = require "luasnip"
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

local function s(trig, body, opts)
  return ls.s({ trig = trig, hidden = true, regTrig = true }, body, opts)
end

local function capture(index, default)
  return f(function(_, snip)
    local text = snip.captures[index]
    if text == "" then
      return default or ""
    end
    return text
  end, {})
end

ls.config.set_config {
  region_check_events = "InsertEnter",
  enable_autosnippets = true,
}

ls.snippets = {
  java = {
    s(
      "print(%l*)",
      fmt(
        [[
          System.out.print{}({});
        ]],
        {
          capture(1),
          i(0),
        }
      )
    ),
    s(
      "while",
      fmt(
        [[
          while ({}) {{
            {}
          }}
        ]],
        {
          i(1),
          i(0),
        }
      )
    ),
    s(
      "if",
      fmt(
        [[
          if ({}) {{
            {}
          }}
        ]],
        {
          i(1),
          i(0),
        }
      )
    ),
    s(
      "foreach(%a+)",
      fmt(
        [[
          for (var {} : {}s) {{
            {}
          }}
        ]],
        {
          capture(1),
          capture(1),
          i(0),
        }
      )
    ),
    s(
      "for(%l)(%d*)",
      fmt(
        [[
          for (int {} = {}; {} < {}; {}++) {{
            {}
          }}
        ]],
        {
          capture(1),
          capture(2, "0"),
          capture(1),
          i(1, "n"),
          capture(1),
          i(0),
        }
      )
    ),
    s(
      "rfor(%l)",
      fmt(
        [[
          for (int {} = {}; {} >= 0; {}--) {{
            {}
          }} ]],
        {
          capture(1),
          i(1, "n - 1"),
          capture(1),
          capture(1),
          i(0),
        }
      )
    ),
  },
  javascript = {
    s(
      "foreach(%a+)",
      fmt(
        [[
          for (const {} of {}s) {{
            {}
          }}
        ]],
        {
          capture(1),
          capture(1),
          i(0),
        }
      )
    ),
    s(
      "for(%l)(%d*)",
      fmt(
        [[
          for (let {} = {}; {} < {}; {}++) {{
            {}
          }}
        ]],
        {
          capture(1),
          capture(2, "0"),
          capture(1),
          i(1, "n"),
          capture(1),
          i(0),
        }
      )
    ),
    s(
      "rfor(%l)",
      fmt(
        [[
          for (let {} = {}; {} >= 0; {}--) {{
            {}
          }}
        ]],
        {
          capture(1),
          i(1, "n - 1"),
          capture(1),
          capture(1),
          i(0),
        }
      )
    ),
  },
}

require("luasnip.loaders.from_vscode").load {
  paths = { vim.fn.stdpath "data" .. "/site/pack/packer/opt/friendly-snippets" },
  include = { "NeogitCommitMessage" },
}
