local aucmd = vim.api.nvim_create_autocmd

aucmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank {
      higroup = "Visual",
      timeout = 350,
    }
  end,
})

aucmd("BufEnter", {
  callback = function()
    vim.cmd "set formatoptions-=ro"
  end,
})

aucmd("LspAttach", {
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

aucmd("LspAttach", {
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end
    local bufnr = args.buf

    local builtin = require "telescope.builtin"
    local function keymap(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
    end

    -- stylua: ignore start
    keymap("n", "gD", vim.lsp.buf.declaration)
    keymap("n", "gd", builtin.lsp_definitions)
    keymap("n", "gr", builtin.lsp_references)
    keymap("n", "gi", builtin.lsp_implementations)
    keymap("n", "K", vim.lsp.buf.hover)
    keymap("i", "<C-K>", vim.lsp.buf.signature_help)
    keymap("n", "<leader>lr", vim.lsp.buf.rename)
    keymap("n", "<leader>ld", function() builtin.diagnostics { no_sign = true } end)
    keymap("n", "<leader>lD", function() vim.diagnostic.goto_next { severity = vim.diagnostic.severity.E } end)
    keymap("n", "<leader>ls", builtin.lsp_document_symbols)

    keymap("n", "<leader>la", vim.lsp.buf.code_action)
    keymap("v", "<leader>la", "<Cmd>lua vim.lsp.buf.range_code_action()<CR><ESC>")

    keymap("n", "<leader>lf", function() vim.lsp.buf.format { async = true } end)
    keymap("v", "<leader>lf", "<Cmd>lua vim.lsp.buf.range_formatting()<CR><ESC>")

    keymap("n", "<leader>li", require('lsp-inlayhints').toggle)
    -- stylua: ignore end
  end,
})
