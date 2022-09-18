local luasnip = require "luasnip"

luasnip.setup {
  history = false,
  region_check_events = "InsertEnter",
  enable_autosnippets = true,
  snip_env = {
    s = require("luasnip.nodes.snippet").S,
    sn = require("luasnip.nodes.snippet").SN,
    sh = function(trig, body, opts)
      return luasnip.s({ trig = trig, hidden = true, regTrig = true }, body, opts)
    end,
    t = require("luasnip.nodes.textNode").T,
    f = require("luasnip.nodes.functionNode").F,
    i = require("luasnip.nodes.insertNode").I,
    c = require("luasnip.nodes.choiceNode").C,
    d = require("luasnip.nodes.dynamicNode").D,
    r = require("luasnip.nodes.restoreNode").R,
    l = require("luasnip.extras").lambda,
    rep = require("luasnip.extras").rep,
    p = require("luasnip.extras").partial,
    pfx = require "luasnip.extras.postfix",
    m = require("luasnip.extras").match,
    n = require("luasnip.extras").nonempty,
    cap = function(index, default)
      return luasnip.f(function(_, snip)
        local text = snip.captures[index]
        if text == "" then
          return default or ""
        end
        return text
      end, {})
    end,
    dl = require("luasnip.extras").dynamic_lambda,
    fmt = require("luasnip.extras.fmt").fmt,
    fmta = require("luasnip.extras.fmt").fmta,
    conds = require "luasnip.extras.expand_conditions",
    types = require "luasnip.util.types",
    events = require "luasnip.util.events",
    parse = require("luasnip.util.parser").parse_snippet,
    ai = require "luasnip.nodes.absolute_indexer",
  },
}

luasnip.filetype_extend("dart", { "flutter" })

require("luasnip.loaders.from_vscode").load {
  paths = { vim.fn.stdpath "data" .. "/site/pack/packer/opt/friendly-snippets" },
  include = { "gitcommit", "flutter", "tex", "rust" },
}

require("luasnip.loaders.from_lua").load { paths = "~/.config/nvim/lua/ikws4/snippets" }
