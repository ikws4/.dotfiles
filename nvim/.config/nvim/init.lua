if not vim.g.vscode then
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)
  vim.g.mapleader = " "
  vim.g.maplocalleader = ";"

  require("lazy").setup "ikws4.plugins"
  require "ikws4.configs"

  -- require "ikws4.disable_builtin"
  -- require "ikws4.setting"
  -- require "ikws4.mapping"
  -- require "ikws4.plugin"
else
  require "ikws4.vscode"
end
