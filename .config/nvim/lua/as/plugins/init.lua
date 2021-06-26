local fn = vim.fn
local fmt = string.format

local PACKER_COMPILED_PATH = fn.stdpath "cache" .. "/packer/packer_compiled.vim"

-----------------------------------------------------------------------------// Bootstrap Packer {{{
-----------------------------------------------------------------------------//
-- Make sure packer is installed on the current machine and load
-- the dev or upstream version depending on if we are at work or not
-- NOTE: install packer as an opt plugin since it's loaded conditionally on my local machine
-- it needs to be installed as optional so the install dir is consistent across machines
local install_path = fmt("%s/site/pack/packer/opt/packer.nvim", fn.stdpath "data")
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify "Downloading packer.nvim..."
  vim.notify(
    fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd "packadd! packer.nvim"
  require("packer").sync()
else
  vim.cmd(fmt("packadd! %s", "packer.nvim"))
end
-- }}}
-----------------------------------------------------------------------------//

as.augroup("PackerSetupInit", {
  {
    events = { "BufWritePost" },
    targets = { "*/as/plugins/*.lua" },
    command = function()
      as.invalidate("as.plugins", true)
      require("packer").compile()
      vim.notify "packer compiled..."
    end,
  },
})

---Require a plugin config
---@param name string
---@return any
local function conf(name)
  return require(fmt("as.plugins.%s", name))
end

--[[
  NOTE "use" functions cannot call *upvalues* i.e. the functions
  passed to setup or config etc. cannot reference aliased functions
  or local variables
--]]
require("packer").startup {
  --- TODO: add fold levels so some sections are closed by default
  --- depending on foldlevel and foldlevelstart
  function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use "kyazdani42/nvim-web-devicons"

    use {
      "kyazdani42/nvim-tree.lua",
      config = conf "nvim-tree",
      requires = "nvim-web-devicons",
    }

    use "folke/lua-dev.nvim"

    -----------------------------------------------------------------------------//
    -- LSP,Completion & Debugger {{{
    -----------------------------------------------------------------------------//
    use {
      "neovim/nvim-lspconfig",
      config = conf "lspconfig",
      requires = {
        { "glepnir/lspsaga.nvim", config = conf "lspsaga" },
        {
          "kabouzeid/nvim-lspinstall",
          config = function()
            require("lspinstall").post_install_hook = function()
              as.lsp.setup_servers()
              vim.cmd "bufdo e"
            end
          end,
        },
      },
    }

    use {
      "hrsh7th/nvim-compe",
      config = conf "compe",
      event = "insertenter",
    }

    use {
      "hrsh7th/vim-vsnip",
      event = "insertenter",
      requires = { "rafamadriz/friendly-snippets", "hrsh7th/nvim-compe" },
      config = function()
        vim.g.vsnip_snippet_dir = vim.g.vim_dir .. "/snippets/textmate"
        local opts = { expr = true }
        as.imap("<c-l>", "vsnip#jumpable(1) ? '<plug>(vsnip-jump-next)' : '<c-l>'", opts)
        as.smap("<c-l>", "vsnip#jumpable(1) ? '<plug>(vsnip-jump-next)' : '<c-l>'", opts)
        as.imap("<c-h>", "vsnip#jumpable(1) ? '<plug>(vsnip-jump-prev)' : '<c-h>'", opts)
        as.smap("<c-h>", "vsnip#jumpable(1) ? '<plug>(vsnip-jump-prev)' : '<c-h>'", opts)
        as.xmap("<c-j>", "vsnip#available(1)  ? '<plug>(vsnip-expand-or-jump)' : '<c-j>'", opts)
        as.imap("<c-j>", "vsnip#available(1)  ? '<plug>(vsnip-expand-or-jump)' : '<c-j>'", opts)
        as.smap("<c-j>", "vsnip#available(1)  ? '<plug>(vsnip-expand-or-jump)' : '<c-j>'", opts)
      end,
    }
    -- }}}

    --------------------------------------------------------------------------------
    -- Utilities {{{
    ---------------------------------------------------------------------------------
    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup {
          close_triple_quotes = true,
          check_ts = false,
        }
      end,
    }

    use { "folke/which-key.nvim", config = conf "whichkey" }

    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup({ "*" }, {
          names = false,
          mode = "background",
        })
      end,
    }

    use "christoomey/vim-system-copy"

    use { 
      "jrudess/vim-foldtext",
      config = function()
        vim.g.FoldText_info = 0
      end
    }
    -- }}}

    --------------------------------------------------------------------------------
    -- Syntax {{{
    --------------------------------------------------------------------------------
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = conf "treesitter",
    }

    use { "nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter" }
    ---}}}

    --------------------------------------------------------------------------------
    -- Text Objects {{{
    --------------------------------------------------------------------------------
    use {
      "b3nj5m1n/kommentary",
      config = function()
        require("kommentary.config").configure_language(
          "lua",
          { prefer_single_line_comments = true }
        )
      end,
    }

    use "tpope/vim-surround"
    ---}}}

    --------------------------------------------------------------------------------
    -- Themes {{{
    --------------------------------------------------------------------------------
    use "arcticicestudio/nord-vim"

    use {
      "akinsho/nvim-bufferline.lua",
      requires = "nvim-web-devicons",
      config = conf "nvim-bufferline",
    }

    use {
      "hoob3rt/lualine.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = conf "lualine",
    }

    ---}}}
  end,
  config = {
    compile_path = PACKER_COMPILED_PATH,
    display = {
      prompt_border = "rounded",
      open_cmd = "silent topleft 65vnew Packer",
    },
    profile = {
      enable = true,
      threshold = 1,
    },
  },
}

if not vim.g.packer_compiled_loaded and vim.loop.fs_stat(PACKER_COMPILED_PATH) then
  vim.cmd(fmt("source %s", PACKER_COMPILED_PATH))
  vim.g.packer_compiled_loaded = true
end
