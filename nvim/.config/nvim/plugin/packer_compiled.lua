-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/zhipingne/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/zhipingne/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/zhipingne/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/zhipingne/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/zhipingne/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nW\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\1\nextra\1\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/Comment.nvim"
  },
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\n§\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15dimensions\1\0\4\6x\4Õô≥Ê\fÃôÛ˛\3\6y\4≥ÊÃô\3≥ÊÃ˛\3\nwidth\4ˆ—˙\b¬Î£ˇ\3\vheight\4©∏Ωî\fı—∞ˇ\3\1\0\2\ahl\vNormal\vborder\nsolid\nsetup\nFTerm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/FTerm.nvim"
  },
  LuaSnip = {
    config = { "require('ikws4.plugin.config.luasnip')" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/LuaSnip",
    wants = { "friendly-snippets" }
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\nl\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fmapping\1\0\1\22clear_empty_lines\2\1\2\0\0\ajk\nsetup\18better_escape\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/better-escape.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "require('ikws4.plugin.config.dashboard')" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["focus.nvim"] = {
    commands = { "FocusSplitNicely", "FocusMaximise", "FocusEqualise" },
    config = { "\27LJ\2\n‘\1\0\0\3\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0'\1\a\0=\1\6\0K\0\1\0LNormal:FocusedWindow,NormalNC:UnfocusedWindow,SignColumn:NvimTreeNormal\17winhighlight\awo\bvim\1\0\4\15signcolumn\1\vbufnew\2\17winhighlight\2\15cursorline\1\nsetup\nfocus\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/focus.nvim"
  },
  ["friendly-snippets"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/friendly-snippets"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('ikws4.plugin.config.statusline')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/lualine.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\n–\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\nsigns\thunk\1\3\0\0\5\5\titem\1\3\0\0\bÔÑÅ\bÔÑÉ\fsection\1\0\0\1\3\0\0\bÔÑÖ\bÔÑá\1\0\2\"disable_builtin_notifications\2 disable_commit_confirmation\2\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  ["null-ls.nvim"] = {
    after = { "nvim-lsp-installer" },
    config = { "\27LJ\2\n™\1\0\0\6\0\n\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0004\4\4\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\4\0059\5\6\5>\5\2\0049\5\3\0009\5\4\0059\5\a\5>\5\3\4=\4\t\3B\1\2\1K\0\1\0\fsources\1\0\0\rautopep8\vstylua\rprettier\15formatting\rbuiltins\vconfig\fnull-ls\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÿ\1\0\0\n\0\f\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "nvim-autopairs" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nO\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\nnames\1\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    config = { "require('ikws4.plugin.config.lsp')" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "require('ikws4.plugin.config.nvim_tree')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "nvim-treesitter-refactor" },
    config = { "require('ikws4.plugin.config.nvim_treesitter')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["rose-pine"] = {
    after = { "lualine.nvim" },
    loaded = true,
    only_config = true
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "require('ikws4.plugin.config.telescope')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["winshift.nvim"] = {
    commands = { "WinShift" },
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\21focused_hl_group\vNormal\nsetup\rwinshift\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/winshift.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^FTerm"] = "FTerm.nvim",
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: FTerm.nvim
time([[Setup for FTerm.nvim]], true)
try_loadstring("\27LJ\2\n≥\1\0\0\3\0\6\0\v6\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\0016\0\0\0009\0\1\0009\0\4\0005\2\5\0B\0\2\1K\0\1\0\1\3\0\0\n<esc>*<cmd>lua require('FTerm').close()<cr>\rtnoremap\1\3\0\0\14<leader>m)<cmd>lua require('FTerm').open()<cr>\rnnoremap\vkeymap\bvim\0", "setup", "FTerm.nvim")
time([[Setup for FTerm.nvim]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\n¿\3\0\0\4\0\n\0\0256\0\0\0009\0\1\0009\0\2\0\18\1\0\0005\3\3\0B\1\2\1\18\1\0\0005\3\4\0B\1\2\1\18\1\0\0005\3\5\0B\1\2\1\18\1\0\0005\3\6\0B\1\2\1\18\1\0\0005\3\a\0B\1\2\1\18\1\0\0005\3\b\0B\1\2\1\18\1\0\0005\3\t\0B\1\2\1K\0\1\0\1\3\0\0\6/1<cmd>Telescope current_buffer_fuzzy_find<cr>\1\3\0\0\15<leader>sm\29<cmd>Telescope marks<cr>\1\3\0\0\15<leader>sp!<cmd>Telescope live_grep<cr>\1\3\0\0\15<leader>sh!<cmd>Telescope help_tags<cr>\1\3\0\0\15<leader>bb\31<cmd>Telescope buffers<cr>\1\3\0\0\15<leader>fr <cmd>Telescope oldfiles<cr>\1\3\0\0\15<leader>ff.<cmd>Telescope find_files hidden=true<cr>\rnnoremap\vkeymap\bvim\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: neogit
time([[Setup for neogit]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\3\0\0\15<leader>gg\20<cmd>Neogit<cr>\rnnoremap\vkeymap\bvim\0", "setup", "neogit")
time([[Setup for neogit]], false)
-- Setup for: focus.nvim
time([[Setup for focus.nvim]], true)
try_loadstring("\27LJ\2\n’\2\0\0\4\0\t\0\0176\0\0\0009\0\1\0009\0\2\0\18\1\0\0005\3\3\0B\1\2\1\18\1\0\0005\3\4\0B\1\2\1\18\1\0\0005\3\5\0B\1\2\0016\1\0\0009\1\6\1'\2\b\0=\2\a\1K\0\1\0LNormal:FocusedWindow,NormalNC:UnfocusedWindow,SignColumn:NvimTreeNormal\17winhighlight\awo\1\3\0\0\15<leader>w=\27<cmd>FocusEqualise<cr>\1\3\0\0\15<leader>wf\27<cmd>FocusMaximise<cr>\1\3\0\0\15<leader>wnG<cmd>FocusSplitNicely<cr><cmd>Telescope find_files hidden=true<cr>\rnnoremap\vkeymap\bvim\0", "setup", "focus.nvim")
time([[Setup for focus.nvim]], false)
-- Setup for: winshift.nvim
time([[Setup for winshift.nvim]], true)
try_loadstring("\27LJ\2\nT\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\3\0\0\15<leader>wm\22<cmd>WinShift<cr>\rnnoremap\vkeymap\bvim\0", "setup", "winshift.nvim")
time([[Setup for winshift.nvim]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nY\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\3\0\0\14<leader>n\28<cmd>NvimTreeToggle<cr>\rnnoremap\vkeymap\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
require('ikws4.plugin.config.dashboard')
time([[Config for dashboard-nvim]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
require('ikws4.plugin.config.theme')
time([[Config for rose-pine]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require('ikws4.plugin.config.luasnip')
time([[Config for LuaSnip]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\1\nextra\1\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('ikws4.plugin.config.nvim_cmp')
time([[Config for nvim-cmp]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\nÿ\1\0\0\n\0\f\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")

vim.cmd [[ packadd null-ls.nvim ]]

-- Config for: null-ls.nvim
try_loadstring("\27LJ\2\n™\1\0\0\6\0\n\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\b\0004\4\4\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\4\0059\5\6\5>\5\2\0049\5\3\0009\5\4\0059\5\a\5>\5\3\4=\4\t\3B\1\2\1K\0\1\0\fsources\1\0\0\rautopep8\vstylua\rprettier\15formatting\rbuiltins\vconfig\fnull-ls\frequire\0", "config", "null-ls.nvim")

vim.cmd [[ packadd nvim-lsp-installer ]]

-- Config for: nvim-lsp-installer
require('ikws4.plugin.config.lsp')

vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
require('ikws4.plugin.config.statusline')

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FocusMaximise lua require("packer.load")({'focus.nvim'}, { cmd = "FocusMaximise", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FocusEqualise lua require("packer.load")({'focus.nvim'}, { cmd = "FocusEqualise", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file WinShift lua require("packer.load")({'winshift.nvim'}, { cmd = "WinShift", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FocusSplitNicely lua require("packer.load")({'focus.nvim'}, { cmd = "FocusSplitNicely", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'friendly-snippets', 'better-escape.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-colorizer.lua', 'nvim-treesitter'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
