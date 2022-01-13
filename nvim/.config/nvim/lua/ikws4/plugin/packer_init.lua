local cmd = vim.cmd

cmd [[ packadd packer.nvim ]]

local present, packer = pcall(require, "packer")

if not present then
  local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

  print "Cloning packer.."
  -- remove the dir before cloning
  vim.fn.delete(packer_path, "rf")
  vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path }

  cmd [[ packadd packer.nvim ]]
  present, packer = pcall(require, "packer")

  if present then
    print "Packer cloned successfully."
  else
    error("Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer)
  end
end

packer.init {
  display = {
    open_fn = function()
      local cl = vim.o.columns
      local ln = vim.o.lines
      local width = math.ceil(cl * 0.78)
      local height = math.ceil(ln * 0.88 - 4)
      local col = math.ceil((cl - width) * 0.43)
      local row = math.ceil((ln - height) * 0.3 - 1)

      return require("packer.util").float {
        border = "rounded",
        height = height,
        width = width,
        col = col,
        row = row,
      }
    end,
    prompt_border = "rounded",
    keybindings = {
      quit = "<Esc>",
    },
  },
  clone_timeout = 30,
  auto_clean = true,
  compile_on_sync = true,
}

-- cmd [[
--   augroup PackerCompileAutoGroup
--     autocmd!
--     autocmd BufWritePost */nvim/lua/ikws4/*.lua source <afile> | PackerCompile
--   augroup END
-- ]]

return packer
