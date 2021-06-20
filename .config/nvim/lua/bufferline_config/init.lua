require('bufferline').setup{
    options = {
        numbers = 'none',
        number_style = '',
        indicator_icon = '|',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        max_prefix_length = 15,
        tab_size = 18,
        offsets = {{filetype = 'NvimTree', text = ' Explore', text_align = 'left'}},
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = { '', ''},
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = 'extension'
    }
}
