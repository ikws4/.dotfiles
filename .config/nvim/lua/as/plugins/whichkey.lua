return function()
  local wk = require "which-key"
  wk.setup {
    plugins = {
      spelling = {
        enabled = true,
      },
    },
  }

  wk.register {
  }
end
