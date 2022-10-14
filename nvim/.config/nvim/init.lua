if not vim.g.vscode then
  require "ikws4.disable_builtin"
  require "ikws4.setting"
  require "ikws4.mapping"
  require "ikws4.plugin"
else
  require "ikws4.vscode"
end
