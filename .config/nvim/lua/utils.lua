local M = {}
local cmd = vim.cmd

---Helper function for create autogroup.
---@param autocmds table
---@param name string
function M.create_augroup(autocmds, name)
  cmd("augroup " .. name)
  cmd("autocmd!")
  for _, autocmd in ipairs(autocmds) do
    cmd("autocmd " .. table.concat(autocmd, " "))
  end
  cmd("augroup END")
end

return M
