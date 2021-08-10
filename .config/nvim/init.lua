if not vim.g.vscode then
  require "maps"
  require "options"
  require "plugins"
else
  require "vscode"
end
