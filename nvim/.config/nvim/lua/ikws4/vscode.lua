-- settings
local g = vim.g
local o = vim.o

g.mapleader = " "
g.maplocalleader = ";"

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true

o.clipboard = "unnamedplus"

-- keymappings
local function k(...)
  local args = { ... }
  return function()
    for _, cmd in ipairs(args) do
      vim.cmd("call " .. "VSCodeNotify('" .. cmd .. "')")
    end
  end
end

vim.keymap.set("n", "gD", k "editor.action.goToTypeDeclaration")
vim.keymap.set("n", "gd", k "editor.action.goToDeclaration")
vim.keymap.set("n", "gr", k "editor.action.goToReferences")
vim.keymap.set("n", "gi", k "editor.action.goToImplementation")
vim.keymap.set("i", "<C-K>", k "editor.action.triggerSuggest")
vim.keymap.set("n", "<leader>lr", k "editor.action.rename")
vim.keymap.set("n", "<leader>la", k "editor.action.quickFix")
vim.keymap.set("n", "<leader>lf", k "editor.action.format")

vim.keymap.set("n", "<leader>m", k "workbench.action.terminal.focus")
vim.keymap.set(
  "n",
  "<leader>n",
  k("workbench.files.action.focusFilesExplorer", "workbench.files.action.showActiveFileInExplorer")
)

vim.keymap.set("n", "<leader>ff", k "workbench.action.quickOpen")
