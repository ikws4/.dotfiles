local cmd = vim.cmd

cmd [[ runtime plugin/astronauta.vim ]]

require "ikws4.disable_builtin"
require "ikws4.setting"
require "ikws4.mapping"
require "ikws4.plugin"
