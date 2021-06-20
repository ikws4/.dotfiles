require('bufferline').setup{
    options = {
        mappings = true,
        left_mouse_command = function(bufnum)
           require('bufdelete').bufdelete(bufnum, false)
        end,
        offsets = {{filetype = 'NvimTree', text = ' File Explore', text_align = 'left'}},
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = 'slant',
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'extension',
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return '('..count..')'
        end,
    }
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'gb', '<cmd>BufferLinePick<CR>', {silent = true, noremap = true})
