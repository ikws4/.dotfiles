local vim = vim

-- override hover
-- if current line have diagnostics message,
-- show diagnostics message float window, otherwise
-- use the normal hover.
local vim_lsp_buf_hover = vim.lsp.buf.hover
local hover = function()
  if not vim.diagnostic.open_float(nil, { scope = "cursor" }) then
    vim_lsp_buf_hover()
  end
end

-- Override open_floating_preview
local vim_lsp_util_open_floating_preview = vim.lsp.util.open_floating_preview
local open_floating_preview = function(contents, syntax, opts)
  opts.border = opts.border or "rounded"
  local floating_bufnr, floating_winnr = vim_lsp_util_open_floating_preview(contents, syntax, opts)
  vim.keymap.set("n", "<Esc>", "<Cmd>bdelete<CR>", { buffer = floating_bufnr })
  return floating_bufnr, floating_winnr
end

local disable_formatting = {
  "tsserver",
}
local on_attach = function(client, bufnr)
  -- Disable builtin formating
  if vim.tbl_contains(disable_formatting, client.name) then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  local builtin = require "telescope.builtin"

  -- stylua: ignore start
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
  vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = bufnr })
  vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = bufnr })
  vim.keymap.set("n", "gi", builtin.lsp_implementations, { buffer = bufnr })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
  vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr })
  vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr })
  vim.keymap.set("n", "<leader>ld", function() builtin.diagnostics { no_sign = true } end, { buffer = bufnr })
  vim.keymap.set("n", "<leader>lD", vim.diagnostic.goto_next, { buffer = bufnr })
  vim.keymap.set("n", "<leader>lf", vim.lsp.buf.formatting, { buffer = bufnr })

  vim.keymap.set("v", "<leader>la", "<Cmd>lua vim.lsp.buf.range_code_action()<CR><ESC>", { buffer = bufnr })
  vim.keymap.set("v", "<leader>lf", "<Cmd>lua vim.lsp.buf.range_formatting()<CR><ESC>", { buffer = bufnr })
  -- stylua: ignore end
end

return {
  hover = hover,
  open_floating_preview = open_floating_preview,
  on_attach = on_attach,
}
