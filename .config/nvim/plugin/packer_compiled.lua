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
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\14\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2*<cmd>lua require(\"FTerm\").close()<CR>\n<esc>\6t\1\0\2\vsilent\2\fnoremap\2)<cmd>lua require(\"FTerm\").open()<CR>\14<leader>m\6n\20nvim_set_keymap\bapi\bvim\nsetup\nFTerm\frequire\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\t\0\0\2\0\t\0\0176\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0004\1\0\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\14telescope dashboard_default_executive\1\0\a\17last_session\f       \23change_colorscheme\f       \rnew_file\f       \14find_word\f       \14find_file\fSPC s f\17find_history\fSPC s h\15book_marks\f       \30dashboard_custom_shortcut\28dashboard_custom_footer\1\a\0\0�\1 ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗�\1 ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║�\1 ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║�\1 ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║�\1 ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║�\1 ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝\28dashboard_custom_header\6g\bvim\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\21--stdin-filepath\1\0\2\nstdin\2\bexe\rprettier\5����\4N\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\nstdin\2\bexe\vluafmt�\2\1\0\6\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0004\4\3\0003\5\4\0>\5\1\4=\4\6\0034\4\3\0003\5\a\0>\5\1\4=\4\b\3=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0+\3\2\0B\0\3\1K\0\1\0v    augroup FormatAutogroup\n      autocmd!\n      autocmd BufWritePost *.ts,*.lua FormatWrite\n    augroup END\n    \14nvim_exec\bapi\bvim\rfiletype\blua\0\15typescript\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/formatter.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\b\0\f\0\0226\0\0\0009\0\1\0009\0\2\0005\1\3\0006\2\4\0'\4\5\0B\2\2\0029\2\6\2B\2\1\1\18\2\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\1K\0\1\0\21<cmd>HopLine<CR>\afl\21<cmd>HopWord<CR>\afw\6n\nsetup\bhop\frequire\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\4\0\0\14dashboard\rNvimTree\thelp&indent_blankline_filetype_exclude$indent_blankline_use_treesitter\6g\bvim\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/lightline.vim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\1K\0\1\0\1\0\2\vmap_cr\2\17map_complete\2$nvim-autopairs.completion.compe\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n�\f\0\2\n\1*\0�\0016\2\0\0009\2\1\0028\2\1\2'\3\3\0=\3\2\0025\2\4\0-\3\0\0\18\5\1\0'\6\5\0'\a\6\0'\b\a\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\b\0'\b\t\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\n\0'\b\v\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\f\0'\b\r\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\14\0'\b\15\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\16\0'\b\17\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\18\0'\b\19\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\20\0'\b\21\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\22\0'\b\23\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\24\0'\b\25\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\26\0'\b\27\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\28\0'\b\29\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\30\0'\b\31\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a \0'\b!\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\"\0'\b#\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a$\0'\b%\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a&\0'\b'\0\18\t\2\0B\3\6\0016\3\0\0009\3(\3'\5)\0B\3\2\1K\0\1\0\1�= command! Format execute 'lua vim.lsp.buf.formatting()' \bcmdE<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>\15<leader>so2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\14<leader>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<leader>e+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>ca*<cmd>lua vim.lsp.buf.references()<CR>\agr&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\14<leader>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\15<leader>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\15<leader>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\15<leader>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\abo\bvim�\2\0\0\r\1\14\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\1\0B\1\2\0029\1\4\1B\1\1\0026\2\5\0\18\4\1\0B\2\2\4H\5\22�5\a\6\0-\b\0\0=\b\a\a\a\6\b\0X\b\r�6\b\0\0'\n\t\0B\b\2\0029\b\2\b5\n\v\0005\v\n\0=\v\f\n5\v\r\0-\f\0\0=\f\a\v=\v\3\nB\b\2\2\18\a\b\0008\b\6\0009\b\2\b\18\n\a\0B\b\2\1F\5\3\3R\5�K\0\1\0\2�\1\0\0\flibrary\1\0\0\1\0\3\15vimruntime\2\fplugins\2\ntypes\2\flua-dev\blua\14on_attach\1\0\0\npairs\22installed_servers\14lspconfig\nsetup\15lspinstall\frequireF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim�\1\0\0\6\0\b\2\0306\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\16�6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\15\0\1\0X\2\3�+\1\2\0L\1\2\0X\1\2�+\1\1\0L\1\2\0K\0\1\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0�\1\0\0\3\3\b\1 6\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4�-\0\0\0'\2\3\0D\0\2\0X\0\21�-\0\1\0009\0\4\0B\0\1\2\15\0\0\0X\1\4�-\0\0\0'\2\5\0D\0\2\0X\0\f�-\0\2\0B\0\1\2\15\0\0\0X\1\4�-\0\0\0'\2\6\0D\0\2\0X\0\4�6\0\0\0009\0\1\0009\0\a\0D\0\1\0K\0\1\0\4�\6�\5�\19compe#complete\n<Tab>!<Plug>luasnip-expand-or-jump\23expand_or_jumpable\n<C-n>\15pumvisible\afn\bvim\2�\1\0\0\3\2\a\1\0246\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4�-\0\0\0'\2\3\0D\0\2\0X\0\r�-\0\1\0009\0\4\0)\2��B\0\2\2\15\0\0\0X\1\4�-\0\0\0'\2\5\0D\0\2\0X\0\3�-\0\0\0'\2\6\0D\0\2\0K\0\1\0\4�\6�\f<S-Tab>\28<Plug>luasnip-jump-prev\rjumpable\n<C-p>\15pumvisible\afn\bvim\2�\4\1\0\14\0\30\0<6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\3\0013\2\4\0003\3\5\0\18\4\3\0B\4\1\0016\4\0\0009\4\6\4'\5\b\0=\5\a\0046\4\t\0'\6\n\0B\4\2\0029\4\v\0045\6\r\0005\a\f\0=\a\14\6B\4\2\0013\4\15\0003\5\16\0006\6\t\0'\b\17\0B\6\2\0026\a\18\0003\b\20\0=\b\19\a6\a\18\0003\b\22\0=\b\21\a5\a\23\0\18\b\0\0'\n\24\0'\v\25\0'\f\26\0\18\r\a\0B\b\5\1\18\b\0\0'\n\27\0'\v\25\0'\f\26\0\18\r\a\0B\b\5\1\18\b\0\0'\n\24\0'\v\28\0'\f\29\0\18\r\a\0B\b\5\1\18\b\0\0'\n\27\0'\v\28\0'\f\29\0\18\r\a\0B\b\5\0012\0\0�K\0\1\0\27v:lua.s_tab_complete()\f<S-Tab>\6s\25v:lua.tab_complete()\n<Tab>\6i\1\0\1\texpr\2\0\19s_tab_complete\0\17tab_complete\a_G\fluasnip\0\0\vsource\1\0\0\1\0\b\rnvim_lsp\2\vbuffer\1\tpath\2\14ultisnips\1\nvsnip\1\rnvim_lua\1\tcalc\1\fluasnip\1\nsetup\ncompe\frequire\21menuone,noselect\16completeopt\6o\0\0\24nvim_buf_set_keymap\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n�\t\0\0\t\0*\0j6\0\0\0009\0\1\0009\0\2\0005\1\3\0006\2\4\0'\4\5\0B\2\2\0029\2\6\0026\3\0\0009\3\a\0035\4\t\0=\4\b\0036\3\0\0009\3\a\0034\4\0\0=\4\n\0036\3\0\0009\3\a\3)\4\0\0=\4\v\0036\3\0\0009\3\a\3)\4\0\0=\4\f\0036\3\0\0009\3\a\3)\4\1\0=\4\r\0036\3\0\0009\3\a\3)\4\1\0=\4\14\0036\3\0\0009\3\a\3)\4\0\0=\4\15\0036\3\0\0009\3\a\3)\4\1\0=\4\16\0036\3\0\0009\3\a\3)\4\1\0=\4\17\0036\3\0\0009\3\a\3)\4\30\0=\4\18\0036\3\0\0009\3\a\3)\4\1\0=\4\19\0036\3\0\0009\3\a\3)\4\0\0=\4\20\0036\3\0\0009\3\a\3)\4\0\0=\4\21\0036\3\0\0009\3\a\3'\4\23\0=\4\22\0036\3\0\0009\3\a\0035\4\25\0=\4\24\0036\3\0\0009\3\a\3)\4\1\0=\4\26\0036\3\0\0009\3\a\0034\4\4\0005\5\28\0\18\6\2\0'\b\29\0B\6\2\2=\6\30\5>\5\1\0045\5\31\0\18\6\2\0'\b \0B\6\2\2=\6\30\5>\5\2\0045\5!\0\18\6\2\0'\b\"\0B\6\2\2=\6\30\5>\5\3\4=\4\27\0036\3\0\0005\4$\0005\5%\0=\5&\4=\4#\3\18\3\0\0'\5'\0'\6(\0'\a)\0\18\b\1\0B\3\5\1K\0\1\0\28<cmd>NvimTreeToggle<CR>\14<leader>n\6n\bgit\1\0\a\fdeleted\b\frenamed\b➜\fignored\b◌\runmerged\b\vstaged\b✓\runstaged\b✗\14untracked\b★\1\0\2\fdefault\b\fsymlink\b\21gnvim_tree_icons\20toggle_dotfiles\1\0\1\bkey\6.\acd\1\0\1\bkey\6+\acb\vdir_up\1\0\1\bkey\6-\23nvim_tree_bindings%nvim_tree_highlight_opened_files\1\4\0\0\14.DS_Store\t.git\17node_modules\21nvim_tree_ignore\a:t#nvim_tree_root_folder_modifier\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw!nvim_tree_width_allow_resize\20nvim_tree_width\21nvim_tree_follow\25nvim_tree_auto_close\24nvim_tree_auto_open\21nvim_tree_git_hl\26nvim_tree_group_empty\29nvim_tree_indent_markers\30nvim_tree_lsp_diagnostics\28nvim_tree_special_files\1\0\4\ffolders\3\1\nfiles\3\1\bgit\3\1\18folder_arrows\3\1\25nvim_tree_show_icons\6g\23nvim_tree_callback\21nvim-tree.config\frequire\1\0\2\vsilent\2\fnoremap\1\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\6\0\0\6\0\"\0+6\0\0\0009\0\1\0)\1c\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\v\0005\3\n\0=\3\f\0025\3\r\0005\4\14\0=\4\15\3=\3\16\0025\3\17\0=\3\18\0025\3\21\0005\4\19\0005\5\20\0=\5\15\4=\4\22\0035\4\23\0005\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\0045\5\30\0=\5\31\4=\4 \3=\3!\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[m\20@function.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\1\0\4\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\1\0\1\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\texpr\15foldmethod\31nvim_treesitter#foldexpr()\rfoldexpr\19foldlevelstart\6o\bvim\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
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
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  sonokai = {
    config = { "\27LJ\2\n�\3\0\0\4\0\16\0#6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0005\1\n\0=\1\t\0006\0\0\0009\0\v\0'\2\f\0B\0\2\0016\0\0\0009\0\r\0009\0\14\0'\2\15\0+\3\1\0B\0\3\1K\0\1\0�\1    augroup YankHighlight\n      autocmd!\n      autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })\n    augroup end\n    \14nvim_exec\bapi\24colorscheme sonokai\bcmd\1\0\1\16colorscheme\fsonokai\14lightline#sonokai_disable_italic_comment\26sonokai_enable_italic\21sonokai_show_eob\tauto\19sonokai_cursor\14andromeda\18sonokai_style\6g\bvim\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/surround.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\6\0\0\t\0\28\00046\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\v\0005\4\t\0005\5\a\0005\6\5\0009\a\4\0=\a\6\6=\6\b\5=\5\n\4=\4\f\3B\1\2\0016\1\r\0009\1\14\0019\1\15\0015\2\16\0\18\3\1\0'\5\17\0'\6\18\0'\a\19\0\18\b\2\0B\3\5\1\18\3\1\0'\5\17\0'\6\20\0'\a\21\0\18\b\2\0B\3\5\1\18\3\1\0'\5\17\0'\6\22\0'\a\23\0\18\b\2\0B\3\5\1\18\3\1\0'\5\17\0'\6\24\0'\a\25\0\18\b\2\0B\3\5\1\18\3\1\0'\5\17\0'\6\26\0'\a\27\0\18\b\2\0B\3\5\1K\0\1\0J<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>\15<leader>sbI<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>\15<leader>sdv<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({previewer = false}))<CR>\15<leader>shx<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))<CR>\15<leader>sf\31<cmd>Telescope buffers<CR>\20<leader><space>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-system-copy"] = {
    loaded = true,
    path = "/Users/zhipingne/.local/share/nvim/site/pack/packer/start/vim-system-copy"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\21--stdin-filepath\1\0\2\nstdin\2\bexe\rprettier\5����\4N\0\0\2\0\3\0\0045\0\0\0005\1\1\0=\1\2\0L\0\2\0\targs\1\4\0\0\19--indent-count\3\2\f--stdin\1\0\2\nstdin\2\bexe\vluafmt�\2\1\0\6\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0004\4\3\0003\5\4\0>\5\1\4=\4\6\0034\4\3\0003\5\a\0>\5\1\4=\4\b\3=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0+\3\2\0B\0\3\1K\0\1\0v    augroup FormatAutogroup\n      autocmd!\n      autocmd BufWritePost *.ts,*.lua FormatWrite\n    augroup END\n    \14nvim_exec\bapi\bvim\rfiletype\blua\0\15typescript\1\0\0\0\1\0\1\flogging\1\nsetup\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\b\0\f\0\0226\0\0\0009\0\1\0009\0\2\0005\1\3\0006\2\4\0'\4\5\0B\2\2\0029\2\6\2B\2\1\1\18\2\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\1K\0\1\0\21<cmd>HopLine<CR>\afl\21<cmd>HopWord<CR>\afw\6n\nsetup\bhop\frequire\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\4\0B\0\2\1K\0\1\0\1\0\2\vmap_cr\2\17map_complete\2$nvim-autopairs.completion.compe\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\f\0\2\n\1*\0�\0016\2\0\0009\2\1\0028\2\1\2'\3\3\0=\3\2\0025\2\4\0-\3\0\0\18\5\1\0'\6\5\0'\a\6\0'\b\a\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\b\0'\b\t\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\n\0'\b\v\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\f\0'\b\r\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\14\0'\b\15\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\16\0'\b\17\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\18\0'\b\19\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\20\0'\b\21\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\22\0'\b\23\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\24\0'\b\25\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\26\0'\b\27\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\28\0'\b\29\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\30\0'\b\31\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a \0'\b!\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a\"\0'\b#\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a$\0'\b%\0\18\t\2\0B\3\6\1-\3\0\0\18\5\1\0'\6\5\0'\a&\0'\b'\0\18\t\2\0B\3\6\0016\3\0\0009\3(\3'\5)\0B\3\2\1K\0\1\0\1�= command! Format execute 'lua vim.lsp.buf.formatting()' \bcmdE<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>\15<leader>so2<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>\14<leader>q0<cmd>lua vim.lsp.diagnostic.goto_next()<CR>\a]d0<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>\a[d<<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>\14<leader>e+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>ca*<cmd>lua vim.lsp.buf.references()<CR>\agr&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>rn/<cmd>lua vim.lsp.buf.type_definition()<CR>\14<leader>DJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\15<leader>wl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\15<leader>wr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\15<leader>wa.<cmd>lua vim.lsp.buf.signature_help()<CR>\n<C-k>.<cmd>lua vim.lsp.buf.implementation()<CR>\agi%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd+<Cmd>lua vim.lsp.buf.declaration()<CR>\agD\6n\1\0\2\vsilent\2\fnoremap\2\27v:lua.vim.lsp.omnifunc\romnifunc\abo\bvim�\2\0\0\r\1\14\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0026\1\0\0'\3\1\0B\1\2\0029\1\4\1B\1\1\0026\2\5\0\18\4\1\0B\2\2\4H\5\22�5\a\6\0-\b\0\0=\b\a\a\a\6\b\0X\b\r�6\b\0\0'\n\t\0B\b\2\0029\b\2\b5\n\v\0005\v\n\0=\v\f\n5\v\r\0-\f\0\0=\f\a\v=\v\3\nB\b\2\2\18\a\b\0008\b\6\0009\b\2\b\18\n\a\0B\b\2\1F\5\3\3R\5�K\0\1\0\2�\1\0\0\flibrary\1\0\0\1\0\3\15vimruntime\2\fplugins\2\ntypes\2\flua-dev\blua\14on_attach\1\0\0\npairs\22installed_servers\14lspconfig\nsetup\15lspinstall\frequireF\0\1\a\0\3\0\b6\1\0\0009\1\1\0019\1\2\1\18\3\0\0+\4\2\0+\5\2\0+\6\2\0D\1\5\0\27nvim_replace_termcodes\bapi\bvim�\1\0\0\6\0\b\2\0306\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\16�6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2\15\0\1\0X\2\3�+\1\2\0L\1\2\0X\1\2�+\1\1\0L\1\2\0K\0\1\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0�\1\0\0\3\3\b\1 6\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4�-\0\0\0'\2\3\0D\0\2\0X\0\21�-\0\1\0009\0\4\0B\0\1\2\15\0\0\0X\1\4�-\0\0\0'\2\5\0D\0\2\0X\0\f�-\0\2\0B\0\1\2\15\0\0\0X\1\4�-\0\0\0'\2\6\0D\0\2\0X\0\4�6\0\0\0009\0\1\0009\0\a\0D\0\1\0K\0\1\0\4�\6�\5�\19compe#complete\n<Tab>!<Plug>luasnip-expand-or-jump\23expand_or_jumpable\n<C-n>\15pumvisible\afn\bvim\2�\1\0\0\3\2\a\1\0246\0\0\0009\0\1\0009\0\2\0B\0\1\2\t\0\0\0X\0\4�-\0\0\0'\2\3\0D\0\2\0X\0\r�-\0\1\0009\0\4\0)\2��B\0\2\2\15\0\0\0X\1\4�-\0\0\0'\2\5\0D\0\2\0X\0\3�-\0\0\0'\2\6\0D\0\2\0K\0\1\0\4�\6�\f<S-Tab>\28<Plug>luasnip-jump-prev\rjumpable\n<C-p>\15pumvisible\afn\bvim\2�\4\1\0\14\0\30\0<6\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\3\0013\2\4\0003\3\5\0\18\4\3\0B\4\1\0016\4\0\0009\4\6\4'\5\b\0=\5\a\0046\4\t\0'\6\n\0B\4\2\0029\4\v\0045\6\r\0005\a\f\0=\a\14\6B\4\2\0013\4\15\0003\5\16\0006\6\t\0'\b\17\0B\6\2\0026\a\18\0003\b\20\0=\b\19\a6\a\18\0003\b\22\0=\b\21\a5\a\23\0\18\b\0\0'\n\24\0'\v\25\0'\f\26\0\18\r\a\0B\b\5\1\18\b\0\0'\n\27\0'\v\25\0'\f\26\0\18\r\a\0B\b\5\1\18\b\0\0'\n\24\0'\v\28\0'\f\29\0\18\r\a\0B\b\5\1\18\b\0\0'\n\27\0'\v\28\0'\f\29\0\18\r\a\0B\b\5\0012\0\0�K\0\1\0\27v:lua.s_tab_complete()\f<S-Tab>\6s\25v:lua.tab_complete()\n<Tab>\6i\1\0\1\texpr\2\0\19s_tab_complete\0\17tab_complete\a_G\fluasnip\0\0\vsource\1\0\0\1\0\b\rnvim_lsp\2\vbuffer\1\tpath\2\14ultisnips\1\nvsnip\1\rnvim_lua\1\tcalc\1\fluasnip\1\nsetup\ncompe\frequire\21menuone,noselect\16completeopt\6o\0\0\24nvim_buf_set_keymap\20nvim_set_keymap\bapi\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: sonokai
time([[Config for sonokai]], true)
try_loadstring("\27LJ\2\n�\3\0\0\4\0\16\0#6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0006\0\0\0009\0\1\0005\1\n\0=\1\t\0006\0\0\0009\0\v\0'\2\f\0B\0\2\0016\0\0\0009\0\r\0009\0\14\0'\2\15\0+\3\1\0B\0\3\1K\0\1\0�\1    augroup YankHighlight\n      autocmd!\n      autocmd TextYankPost * silent! lua vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })\n    augroup end\n    \14nvim_exec\bapi\24colorscheme sonokai\bcmd\1\0\1\16colorscheme\fsonokai\14lightline#sonokai_disable_italic_comment\26sonokai_enable_italic\21sonokai_show_eob\tauto\19sonokai_cursor\14andromeda\18sonokai_style\6g\bvim\0", "config", "sonokai")
time([[Config for sonokai]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\14\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\n\0'\3\v\0'\4\f\0005\5\r\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2*<cmd>lua require(\"FTerm\").close()<CR>\n<esc>\6t\1\0\2\vsilent\2\fnoremap\2)<cmd>lua require(\"FTerm\").open()<CR>\14<leader>m\6n\20nvim_set_keymap\bapi\bvim\nsetup\nFTerm\frequire\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\2\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0K\0\1\0\1\4\0\0\14dashboard\rNvimTree\thelp&indent_blankline_filetype_exclude$indent_blankline_use_treesitter\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\t\0\0\t\0*\0j6\0\0\0009\0\1\0009\0\2\0005\1\3\0006\2\4\0'\4\5\0B\2\2\0029\2\6\0026\3\0\0009\3\a\0035\4\t\0=\4\b\0036\3\0\0009\3\a\0034\4\0\0=\4\n\0036\3\0\0009\3\a\3)\4\0\0=\4\v\0036\3\0\0009\3\a\3)\4\0\0=\4\f\0036\3\0\0009\3\a\3)\4\1\0=\4\r\0036\3\0\0009\3\a\3)\4\1\0=\4\14\0036\3\0\0009\3\a\3)\4\0\0=\4\15\0036\3\0\0009\3\a\3)\4\1\0=\4\16\0036\3\0\0009\3\a\3)\4\1\0=\4\17\0036\3\0\0009\3\a\3)\4\30\0=\4\18\0036\3\0\0009\3\a\3)\4\1\0=\4\19\0036\3\0\0009\3\a\3)\4\0\0=\4\20\0036\3\0\0009\3\a\3)\4\0\0=\4\21\0036\3\0\0009\3\a\3'\4\23\0=\4\22\0036\3\0\0009\3\a\0035\4\25\0=\4\24\0036\3\0\0009\3\a\3)\4\1\0=\4\26\0036\3\0\0009\3\a\0034\4\4\0005\5\28\0\18\6\2\0'\b\29\0B\6\2\2=\6\30\5>\5\1\0045\5\31\0\18\6\2\0'\b \0B\6\2\2=\6\30\5>\5\2\0045\5!\0\18\6\2\0'\b\"\0B\6\2\2=\6\30\5>\5\3\4=\4\27\0036\3\0\0005\4$\0005\5%\0=\5&\4=\4#\3\18\3\0\0'\5'\0'\6(\0'\a)\0\18\b\1\0B\3\5\1K\0\1\0\28<cmd>NvimTreeToggle<CR>\14<leader>n\6n\bgit\1\0\a\fdeleted\b\frenamed\b➜\fignored\b◌\runmerged\b\vstaged\b✓\runstaged\b✗\14untracked\b★\1\0\2\fdefault\b\fsymlink\b\21gnvim_tree_icons\20toggle_dotfiles\1\0\1\bkey\6.\acd\1\0\1\bkey\6+\acb\vdir_up\1\0\1\bkey\6-\23nvim_tree_bindings%nvim_tree_highlight_opened_files\1\4\0\0\14.DS_Store\t.git\17node_modules\21nvim_tree_ignore\a:t#nvim_tree_root_folder_modifier\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw!nvim_tree_width_allow_resize\20nvim_tree_width\21nvim_tree_follow\25nvim_tree_auto_close\24nvim_tree_auto_open\21nvim_tree_git_hl\26nvim_tree_group_empty\29nvim_tree_indent_markers\30nvim_tree_lsp_diagnostics\28nvim_tree_special_files\1\0\4\ffolders\3\1\nfiles\3\1\bgit\3\1\18folder_arrows\3\1\25nvim_tree_show_icons\6g\23nvim_tree_callback\21nvim-tree.config\frequire\1\0\2\vsilent\2\fnoremap\1\20nvim_set_keymap\bapi\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: surround.nvim
time([[Config for surround.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rsurround\frequire\0", "config", "surround.nvim")
time([[Config for surround.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\n�\t\0\0\2\0\t\0\0176\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0004\1\0\0=\1\4\0006\0\0\0009\0\1\0005\1\6\0=\1\5\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\14telescope dashboard_default_executive\1\0\a\17last_session\f       \23change_colorscheme\f       \rnew_file\f       \14find_word\f       \14find_file\fSPC s f\17find_history\fSPC s h\15book_marks\f       \30dashboard_custom_shortcut\28dashboard_custom_footer\1\a\0\0�\1 ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗�\1 ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║�\1 ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║�\1 ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║�\1 ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║�\1 ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝\28dashboard_custom_header\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\6\0\0\6\0\"\0+6\0\0\0009\0\1\0)\1c\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\v\0005\3\n\0=\3\f\0025\3\r\0005\4\14\0=\4\15\3=\3\16\0025\3\17\0=\3\18\0025\3\21\0005\4\19\0005\5\20\0=\5\15\4=\4\22\0035\4\23\0005\5\24\0=\5\25\0045\5\26\0=\5\27\0045\5\28\0=\5\29\0045\5\30\0=\5\31\4=\4 \3=\3!\2B\0\2\1K\0\1\0\16textobjects\tmove\22goto_previous_end\1\0\2\a[M\20@function.outer\a[]\17@class.outer\24goto_previous_start\1\0\2\a[[\17@class.outer\a[m\20@function.outer\18goto_next_end\1\0\2\a]M\20@function.outer\a][\17@class.outer\20goto_next_start\1\0\2\a]]\17@class.outer\a]m\20@function.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\1\0\4\aif\20@function.inner\aaf\20@function.outer\aac\17@class.outer\aic\17@class.inner\1\0\1\venable\2\vindent\1\0\1\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\bgrn\22scope_incremental\bgrc\19init_selection\bgnn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\texpr\15foldmethod\31nvim_treesitter#foldexpr()\rfoldexpr\19foldlevelstart\6o\bvim\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\6\0\0\t\0\28\00046\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\v\0005\4\t\0005\5\a\0005\6\5\0009\a\4\0=\a\6\6=\6\b\5=\5\n\4=\4\f\3B\1\2\0016\1\r\0009\1\14\0019\1\15\0015\2\16\0\18\3\1\0'\5\17\0'\6\18\0'\a\19\0\18\b\2\0B\3\5\1\18\3\1\0'\5\17\0'\6\20\0'\a\21\0\18\b\2\0B\3\5\1\18\3\1\0'\5\17\0'\6\22\0'\a\23\0\18\b\2\0B\3\5\1\18\3\1\0'\5\17\0'\6\24\0'\a\25\0\18\b\2\0B\3\5\1\18\3\1\0'\5\17\0'\6\26\0'\a\27\0\18\b\2\0B\3\5\1K\0\1\0J<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>\15<leader>sbI<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>\15<leader>sdv<cmd>lua require('telescope.builtin').oldfiles(require('telescope.themes').get_dropdown({previewer = false}))<CR>\15<leader>shx<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))<CR>\15<leader>sf\31<cmd>Telescope buffers<CR>\20<leader><space>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
