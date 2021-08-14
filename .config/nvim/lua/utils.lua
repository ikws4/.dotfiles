local M = {}
local cmd = vim.cmd

---Helper function for create autogroup.
---@param autocmds table
---@param name string
function M.create_augroup(autocmds, name)
  cmd("augroup " .. name)
  cmd "autocmd!"
  for _, autocmd in ipairs(autocmds) do
    cmd("autocmd " .. table.concat(autocmd, " "))
  end
  cmd "augroup END"
end

---Deep coyp a table
---@param tbl table
function M.table_copy(tbl)
  local function copy(obj, visited)
    if type(obj) ~= "table" then
      return obj
    end
    if visited[obj] then
      return obj
    end

    local res = {}
    visited[obj] = res

    for k, v in pairs(obj) do
      res[copy(k, visited)] = copy(v, visited)
    end

    return setmetatable(res, getmetatable(obj))
  end

  return copy(tbl, {})
end

return M
