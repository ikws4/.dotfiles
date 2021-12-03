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
      return require("packer.util").float {
        border = "solid",
      }
    end,
    prompt_border = "solid",
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
