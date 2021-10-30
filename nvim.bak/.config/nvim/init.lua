if not vim.g.vscode then
  require "ikws4.maps"
  require "ikws4.options"
  require "ikws4.plugins"
  require "ikws4.theme"
  require "ikws4.lsp"
else
  require "ikws4.vscode"
end
