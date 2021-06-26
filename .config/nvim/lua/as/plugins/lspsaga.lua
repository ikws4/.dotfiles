return function()
  local saga = require "lspsaga"

  saga.init_lsp_saga {
    error_sign = ' ' .. as.style.icons.error,
    warn_sign = ' ' .. as.style.icons.warning,
    hint_sign = ' ' .. as.style.icons.hint,
    infor_sign =  ' ' .. as.style.icons.info,
    finder_action_keys = {
      vsplit = "v",
      split = "s",
      quit = "<esc>",
    },
    code_action_keys = {
      quit = '<esc>',
      exec = '<cr>',
    },
    rename_action_keys = {
      quit = '<esc>',
      exec = '<cr>',
    },
    code_action_prompt = {
      enable = false,
      sign = false,
      virtual_text = false,
    },
  }

  as.vnoremap("<leader>ca", ":<c-u>lua require('lspsaga.codeaction').range_code_action()<cr>")
  as.inoremap("<c-k>", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>")
  as.nnoremap("K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<cr>")
  -- scroll down hover doc
  as.nnoremap("<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
  -- scroll up hover doc
  as.nnoremap("<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")

  require("which-key").register {
    ["<leader>rn"] = { require("lspsaga.rename").rename, "lsp: rename" },
    ["<leader>ca"] = { require("lspsaga.codeaction").code_action, "lsp: code action" },
    ["gh"] = { require("lspsaga.provider").preview_definition, "lsp: preview definition" },
    ["gd"] = { require("lspsaga.provider").lsp_finder, "lsp: finder" },
    -- jump diagnostic
    ["]e"] = { require("lspsaga.diagnostic").lsp_jump_diagnostic_prev, "lsp: previous diagnostic" },
    ["[e"] = { require("lspsaga.diagnostic").lsp_jump_diagnostic_next, "lsp: next diagnostic" },
  }

  as.augroup("LspSagaCursorCommands", {
    {
      events = { "CursorHold" },
      targets = { "*" },
      command = "lua require('lspsaga.diagnostic').show_cursor_diagnostics()",
    },
  })
end
