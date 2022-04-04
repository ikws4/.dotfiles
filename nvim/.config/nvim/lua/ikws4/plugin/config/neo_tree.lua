vim.g.neo_tree_remove_legacy_commands = 1

require("neo-tree").setup {
  -- resize_timer_interval = 1000,
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = false,
  enable_diagnostics = false,
  git_status_async = false,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = false,
      with_expanders = true,
    },

    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "",
      default = "",
    },
    modified = {
      symbol = "",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = false,
    },
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.wo.cursorlineopt = "line"
      end,
    },
    {
      event = "neo_tree_buffer_leave",
      handler = function()
        -- vim.wo.cursorlineopt = "number"
      end,
    },
  },
  window = {
    position = "left",
    width = 35,
    mappings = {
      ["<Tab>"] = "open",
      ["<CR>"] = "open",
      ["o"] = "open",
      ["O"] = function(state)
        local node = state.tree:get_node()
        local path = vim.fn.fnameescape(node.path)
        vim.fn.system { "qlmanage", "-p", path }
      end,
      ["-"] = "navigate_up",
      ["="] = "set_root",
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      ["t"] = "open_tabnew",
      ["C"] = "close_node",
      ["a"] = "add",
      ["A"] = "add_directory",
      ["r"] = "rename",
      ["d"] = "delete",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy",
      ["m"] = "move",
      ["q"] = "close_window",
      ["/"] = "fuzzy_finder",
      ["."] = "toggle_hidden",
    },
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_by_name = {
        ".DS_Store",
      },
      never_show = {
        ".DS_Store",
      },
    },
    follow_current_file = false,
    use_libuv_file_watcher = true,
    window = {
      mappings = {
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
      },
    },
  },
  buffers = {
    show_unloaded = true,
    window = {
      mappings = {
        ["bd"] = "buffer_delete",
      },
    },
  },
}
