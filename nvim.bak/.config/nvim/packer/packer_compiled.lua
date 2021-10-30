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
    config = { "\27LJ\2\n˙\2\0\0\4\0\r\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\0029\0\a\0005\2\t\0005\3\b\0=\3\n\0025\3\v\0=\3\f\2B\0\2\1K\0\1\0\n<Esc>\1\3\1\0*<cmd>lua require('FTerm').close()<CR>\27Open floating terminal\tmode\6t\14<leader>m\1\0\0\1\3\0\0)<Cmd>lua require('FTerm').open()<CR>\27Open floating terminal\rregister\14which-key\15dimensions\1\0\4\nwidth\4ˆ—˙\b¬Î£ˇ\3\vheight\4©∏Ωî\fı—∞ˇ\3\6y\4≥ÊÃô\3≥ÊÃ˛\3\6x\4Õô≥Ê\fÃôÛ˛\3\1\0\2\vborder\nsolid\ahl\vNormal\nsetup\nFTerm\frequire\0" },
    keys = { { "", "<leader>m" } },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/FTerm.nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\2\nl\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fmapping\1\0\1\22clear_empty_lines\2\1\2\0\0\ajk\nsetup\18better_escape\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/better-escape.nvim"
  },
  ["cmp-buffer"] = {
    after = { "cmp-nvim-lsp" },
    after_files = { "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after = { "cmp-path" },
    after_files = { "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after = { "cmp-spell" },
    after_files = { "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  ["cmp-spell"] = {
    after_files = { "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/cmp-spell"
  },
  ["cmp-vsnip"] = {
    after = { "cmp-buffer" },
    after_files = { "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.vim" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/cmp-vsnip"
  },
  ["codicons.nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/codicons.nvim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27ikws4.config.dashboard\frequire\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["focus.nvim"] = {
    config = { "\27LJ\2\nÊ\3\0\0\4\0\17\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\0025\3\t\0=\3\n\0025\3\v\0=\3\f\2B\0\2\0016\0\r\0009\0\14\0'\1\16\0=\1\15\0K\0\1\0LNormal:FocusedWindow,NormalNC:UnfocusedWindow,SignColumn:NvimTreeNormal\17winhighlight\awo\bvim\15<leader>w=\1\3\0\0\27<Cmd>FocusEqualise<CR>\26Equally high and wide\15<leader>wf\1\3\0\0\27<Cmd>FocusMaximise<CR>\15Fullscreen\15<leader>wn\1\0\0\1\3\0\0G<Cmd>FocusSplitNicely<CR><Cmd>Telescope find_files hidden=true<CR>\17Split nicely\rregister\14which-key\1\0\4\15signcolumn\1\17winhighlight\2\vbufnew\2\15cursorline\1\nsetup\nfocus\frequire\0" },
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
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25ikws4.config.lualine\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/lualine.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n’\2\0\0\5\0\19\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\3=\3\v\2B\0\2\0016\0\0\0'\2\f\0B\0\2\0029\0\r\0005\2\17\0005\3\15\0005\4\14\0=\4\16\3=\3\18\2B\0\2\1K\0\1\0\14<leader>g\1\0\0\6g\1\0\0\1\3\0\0*<Cmd>lua require('neogit').open()<CR>\18Neogit status\rregister\14which-key\nsigns\thunk\1\3\0\0\5\5\titem\1\3\0\0\bÔÑÅ\bÔÑÉ\fsection\1\0\0\1\3\0\0\bÔÑÖ\bÔÑá\1\0\2\"disable_builtin_notifications\2 disable_commit_confirmation\2\nsetup\vneogit\frequire\0" },
    keys = { { "", "<leader>gg" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  neorg = {
    config = { "\27LJ\2\n∂\4\0\0\t\0#\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2!\0005\3\3\0004\4\0\0=\4\4\0035\4\21\0005\5\15\0005\6\b\0005\a\6\0005\b\5\0=\b\a\a=\a\t\0065\a\v\0005\b\n\0=\b\a\a=\a\f\0065\a\r\0=\a\14\6=\6\16\0055\6\18\0005\a\17\0=\a\19\6=\6\20\5=\5\22\4=\4\23\0034\4\0\0=\4\24\0035\4\28\0005\5\26\0005\6\25\0=\6\27\5=\5\22\4=\4\29\0035\4\31\0005\5\30\0=\5\22\4=\4 \3=\3\"\2B\0\2\1K\0\1\0\tload\1\0\0\25core.norg.completion\1\0\0\1\0\1\vengine\rnvim-cmp\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\fdefault\23~/Dev/GitHub/notes\24core.norg.concealer!core.integrations.treesitter\vconfig\1\0\0\bdim\14CodeBlock\1\0\0\1\0\2\15percentage\3\0\14reference\20UnfocusedWindow\15highlights\1\0\0\vMarker\1\0\1\nTitle\r+TSLabel\17CarryoverTag\1\0\0\1\0\1\5\r+TSLabel\bTag\1\0\0\tName\1\0\1\fContent\15guibg=NONE\1\0\1\5\15+TSKeyword\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/neorg"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÿ\1\0\0\n\0\f\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\4\0B\1\2\0029\2\5\1\18\4\2\0009\2\6\2'\5\a\0009\6\b\0005\b\n\0005\t\t\0=\t\v\bB\6\2\0A\2\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "vim-vsnip" },
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
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\nã\2\0\0\b\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0006\4\0\0'\6\a\0B\4\2\0029\4\b\4'\6\t\0'\a\n\0B\4\3\2=\4\v\0035\4\f\0=\4\r\3=\3\14\2B\0\2\1K\0\1\0\nfloat\rwin_opts\1\0\4\roffset_y\3˛ˇˇˇ\15\roffset_x\3¸ˇˇˇ\15\vborder\tnone\rwinblend\3\0\ttext\ticon\14lightbulb\bget\rcodicons\1\0\1\fenabled\2\tsign\1\0\0\1\0\1\fenabled\1\21update_lightbulb\19nvim-lightbulb\frequire—\1\1\0\3\0\6\0\b6\0\0\0003\1\2\0=\1\1\0006\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0ó\1        augroup LightbulbAutoGroup\n          autocmd!\n          autocmd CursorHold,CursorHoldI * call v:lua.lightbulb()\n        augroup END\n      \bcmd\bvim\0\14lightbulb\a_G\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nx\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0B\1\2\0016\1\4\0=\0\1\1K\0\1\0\bvim\1\0\3\22background_colour\vNormal\ftimeout\3ƒ\19\vstages\nslide\nsetup\vnotify\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27ikws4.config.nvim_tree\frequire\0" },
    keys = { { "", "<leader>n" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!ikws4.config.nvim_treesitter\frequire\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
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
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/rose-pine"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\vconfig\27ikws4.config.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-vsnip"] = {
    after = { "cmp-vsnip" },
    config = { "\27LJ\2\n»\1\0\0\5\0\t\0\0216\0\0\0009\0\1\0004\1\3\0006\2\0\0009\2\3\0029\2\4\2'\4\5\0B\2\2\2'\3\6\0&\2\3\2>\2\1\0016\2\0\0009\2\3\0029\2\4\2'\4\a\0B\2\2\2'\3\b\0&\2\3\2>\2\2\1=\1\2\0K\0\1\0\14/snippets\vconfig7/site/pack/packer/start/friendly-snippets/snippets\tdata\fstdpath\afn\23vsnip_snippet_dirs\6g\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/vim-vsnip",
    wants = { "friendly-snippets" }
  },
  ["which-key.nvim"] = {
    after = { "FTerm.nvim" },
    loaded = true,
    only_config = true
  },
  ["winshift.nvim"] = {
    commands = { "WinShift" },
    config = { "\27LJ\2\nπ\1\0\0\4\0\t\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\1K\0\1\0\15<leader>wm\1\0\0\1\3\0\0\22<Cmd>WinShift<CR>\17Move windows\rregister\14which-key\1\0\1\21focused_hl_group\vNormal\nsetup\rwinshift\frequire\0" },
    keys = { { "", "<leader>wm" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/winshift.nvim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26ikws4.config.zen_mode\frequire\0" },
    keys = { { "", "<leader>z" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
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

-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\27ikws4.config.telescope\frequire\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nW\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rmappings\1\0\0\1\0\1\nextra\1\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26ikws4.config.nvim_cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0!ikws4.config.nvim_treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\n∂\4\0\0\t\0#\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2!\0005\3\3\0004\4\0\0=\4\4\0035\4\21\0005\5\15\0005\6\b\0005\a\6\0005\b\5\0=\b\a\a=\a\t\0065\a\v\0005\b\n\0=\b\a\a=\a\f\0065\a\r\0=\a\14\6=\6\16\0055\6\18\0005\a\17\0=\a\19\6=\6\20\5=\5\22\4=\4\23\0034\4\0\0=\4\24\0035\4\28\0005\5\26\0005\6\25\0=\6\27\5=\5\22\4=\4\29\0035\4\31\0005\5\30\0=\5\22\4=\4 \3=\3\"\2B\0\2\1K\0\1\0\tload\1\0\0\25core.norg.completion\1\0\0\1\0\1\vengine\rnvim-cmp\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\fdefault\23~/Dev/GitHub/notes\24core.norg.concealer!core.integrations.treesitter\vconfig\1\0\0\bdim\14CodeBlock\1\0\0\1\0\2\15percentage\3\0\14reference\20UnfocusedWindow\15highlights\1\0\0\vMarker\1\0\1\nTitle\r+TSLabel\17CarryoverTag\1\0\0\1\0\1\5\r+TSLabel\bTag\1\0\0\tName\1\0\1\fContent\15guibg=NONE\1\0\1\5\15+TSKeyword\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27ikws4.config.which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27ikws4.config.dashboard\frequire\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd vim-vsnip ]]

-- Config for: vim-vsnip
try_loadstring("\27LJ\2\n»\1\0\0\5\0\t\0\0216\0\0\0009\0\1\0004\1\3\0006\2\0\0009\2\3\0029\2\4\2'\4\5\0B\2\2\2'\3\6\0&\2\3\2>\2\1\0016\2\0\0009\2\3\0029\2\4\2'\4\a\0B\2\2\2'\3\b\0&\2\3\2>\2\2\1=\1\2\0K\0\1\0\14/snippets\vconfig7/site/pack/packer/start/friendly-snippets/snippets\tdata\fstdpath\afn\23vsnip_snippet_dirs\6g\bvim\0", "config", "vim-vsnip")

vim.cmd [[ packadd cmp-vsnip ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-spell ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'zen-mode.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file WinShift lua require("packer.load")({'winshift.nvim'}, { cmd = "WinShift", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>n <cmd>lua require("packer.load")({'nvim-tree.lua'}, { keys = "<lt>leader>n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>gg <cmd>lua require("packer.load")({'neogit'}, { keys = "<lt>leader>gg", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>z <cmd>lua require("packer.load")({'zen-mode.nvim'}, { keys = "<lt>leader>z", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>wm <cmd>lua require("packer.load")({'winshift.nvim'}, { keys = "<lt>leader>wm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>m <cmd>lua require("packer.load")({'FTerm.nvim'}, { keys = "<lt>leader>m", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au CursorHold * ++once lua require("packer.load")({'nvim-lightbulb'}, { event = "CursorHold *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'friendly-snippets', 'better-escape.nvim', 'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-colorizer.lua'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au ColorScheme * ++once lua require("packer.load")({'lualine.nvim', 'nvim-notify', 'focus.nvim'}, { event = "ColorScheme *" }, _G.packer_plugins)]]
vim.cmd [[au CursorHoldI * ++once lua require("packer.load")({'nvim-lightbulb'}, { event = "CursorHoldI *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
