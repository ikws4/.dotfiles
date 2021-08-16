local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"

map("n", "<leader>m", "<Cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>", opts)
map("n", "<leader>n", "<Cmd>call VSCodeNotify('workbench.files.action.focusFilesExplorer')<CR>", opts)

-- list
map("n", "<leader>bb", "<Cmd>call VSCodeNotify('workbench.action.showAllEditors')<CR>", opts)
map("n", "<leader>ff", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>", opts)

--
map("n", "<leader>wh", "<Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>", opts)
map("n", "<leader>wj", "<Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>", opts)
map("n", "<leader>wk", "<Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>", opts)
map("n", "<leader>wl", "<Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>", opts)

-- lsp
map("n", "gD", "<Cmd>call VSCodeNotify('editor.action.goToDeclaration')<CR>", opts)
map("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>", opts)
map("n", "gr", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>", opts)
map("n", "gi", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>", opts)
map("n", "<leader>D", "<Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>", opts)
map("n", "<leader>rn", "<cmd>call VSCodeNotify('editor.action.rename')<CR>", opts)
map("n", "<leader>ca", "<Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>", opts)

-- Highlight on yank
vim.cmd "autocmd TextYankPost * lua vim.highlight.on_yank { timeout = 200 }"

local function plugins(use)
  -- Packer can manage itself as an optional plugin
  use "wbthomason/packer.nvim"

  use {
    "phaazon/hop.nvim",
    config = function()
      require "config.hop"
    end,
  }
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require("surround").setup {
        mappings_style = "surround",
      }
    end,
  }
end

local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local compile_path = fn.stdpath "config" .. "/packer/vscode_packer_compiled.lua"
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify "Downloading packer..."
  vim.notify(fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd [[packadd packer.nvim]]
end

require("packer").startup {
  plugins,
  config = {
    compile_path = compile_path,
  },
}

if not vim.g.compile_path_loaded and not vim.g.vscode then
  vim.cmd("source " .. compile_path)
  vim.g.compile_path_loaded = true
end
