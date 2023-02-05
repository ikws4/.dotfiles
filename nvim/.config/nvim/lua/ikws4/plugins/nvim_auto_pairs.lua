return {
  "windwp/nvim-autopairs",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp = require "cmp"
    local npairs = require "nvim-autopairs"
    local Rule = require "nvim-autopairs.rule"
    local cond = require "nvim-autopairs.conds"
    npairs.setup()

    npairs.add_rules(require "nvim-autopairs.rules.endwise-lua")
    npairs.add_rule(
      Rule("<", ">", { "rust", "java" })
        :with_pair(cond.not_before_regex " ")
        :with_pair(cond.not_after_regex [=[[%w%%%'%[%"%.%`%$]]=])
        :with_move(function(opts)
          if opts.char == opts.next_char then
            return
          end
          return false
        end)
    )
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
  end,
}
