vim.g.dotfiles = vim.fn.expand "~/.dotfiles"
vim.g.vim_dir = vim.g.dotfiles .. "/.config/nvim"

------------------------------------------------------------------------
-- Leader bindings
------------------------------------------------------------------------
vim.g.mapleader = "'" -- Remap leader key

------------------------------------------------------------------------
-- Plugin Configurations
------------------------------------------------------------------------
require "as.globals"
require "as.settings"
require "as.highlights"
require "as.plugins"

------------------------------------------------------------------------
-- Keymapping
------------------------------------------------------------------------
as.inoremap('jk', '<esc>')
