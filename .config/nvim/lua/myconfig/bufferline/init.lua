require('bufferline').setup{
    options = {
        mappings = false,
        offsets = {
            {
                filetype = 'NvimTree',
                text = ' File Explore',
                text_align = 'left',
                padding = 1 
            }
        },
        indicator_icon = '',
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = 'thick' or 'padded_thick',
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = function(a, b)
            local astat = vim.loop.fs_stat(a.path)
            local bstat = vim.loop.fs_stat(b.path)
            local mod_a = astat and astat.mtime.sec or 0
            local mod_b = bstat and bstat.mtime.sec or 0
            return mod_a > mod_b
        end,
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match('error') and ' ' or ' '
            return ' ' .. icon .. count
        end,
    }
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', 'gb', '<cmd>BufferLinePick<CR>', {silent = true, noremap = true})
