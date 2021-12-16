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
local lsp_float_border = {
  { "", "LspFloatingPreviewBorder" },
  { "", "LspFloatingPreviewBorder" },
  { "", "LspFloatingPreviewBorder" },
  { " ", "LspFloatingPreviewBorder" },
  { "", "LspFloatingPreviewBorder" },
  { "", "LspFloatingPreviewBorder" },
  { "", "LspFloatingPreviewBorder" },
  { " ", "LspFloatingPreviewBorder" },
}
local vim_lsp_util_open_floating_preview = vim.lsp.util.open_floating_preview
local open_floating_preview = function(contents, syntax, opts)
  opts.border = opts.border or lsp_float_border
  local floating_bufnr, floating_winnr = vim_lsp_util_open_floating_preview(contents, syntax, opts)

  -- stylua: ignore
  vim.api.nvim_buf_set_keymap(floating_bufnr, "n", "<Esc>", "<cmd>bdelete<cr>", { silent = true, noremap = true, nowait = true })

  if floating_winnr == vim.api.nvim_get_current_win() then
    vim.cmd "hi! link LspFloatingPreviewBorder FocusedWindow"
  else
    vim.cmd "hi! link LspFloatingPreviewBorder UnfocusedWindow"
  end

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

  local nnoremap = vim.keymap.nnoremap

  nnoremap { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", buffer = bufnr }
  nnoremap { "gd", "<cmd>Telescope lsp_definitions<cr>", buffer = bufnr }
  nnoremap { "gr", "<cmd>Telescope lsp_references<cr>", buffer = bufnr }
  nnoremap { "gi", "<cmd>Telescope lsp_implementations<cr>", buffer = bufnr }
  nnoremap { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", buffer = bufnr }
  nnoremap { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", buffer = bufnr }
  nnoremap { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", buffer = bufnr }
  nnoremap { "<leader>ld", "<cmd>Telescope lsp_workspace_diagnostics<cr>", buffer = bufnr }
  nnoremap { "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<cr>", buffer = bufnr }

  vim.keymap.vnoremap { "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<cr><esc>", buffer = bufnr }
  vim.keymap.vnoremap { "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<cr><esc>", buffer = bufnr }
end

return {
  hover = hover,
  open_floating_preview = open_floating_preview,
  on_attach = on_attach,
}