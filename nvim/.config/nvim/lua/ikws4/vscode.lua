-- settings
local g = vim.g
local o = vim.o

g.mapleader = " "
g.maplocalleader = ";"

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true

-- keymappings
local function k(a)
  return function()
    vim.cmd("call " .. "VSCodeNotify('" .. a .. "')")
  end
end

vim.keymap.set("n", "gD", k "editor.action.goToDeclaration")
vim.keymap.set("n", "gd", k "editor.action.goToDefinition")
vim.keymap.set("n", "gr", k "editor.action.goToReferences")
vim.keymap.set("n", "gi", k "editor.action.goToImplementation")
vim.keymap.set("i", "<C-K>", k "editor.action.triggerSuggest")
vim.keymap.set("n", "<leader>lr", k "editor.action.rename")
vim.keymap.set("n", "<leader>la", k "editor.action.quickFix")
vim.keymap.set("n", "<leader>lf", k "editor.action.format")
