local tree_cb = require('nvim-tree.config').nvim_tree_callback

vim.g.nvim_tree_bindings = {
    ['<C-v>'] = tree_cb('vsplit'),
    ['<C-x>'] = tree_cb('split'),
    ['<C-t>'] = tree_cb('tabnew'),
    ['<C-r>'] = tree_cb('full_rename'),

    ['gy'] = tree_cb('copy_absolute_path'),
    ['[c'] = tree_cb('prev_git_item'),
    [']c'] = tree_cb('next_git_item'),

    ['I'] = tree_cb('toggle_ignored'),
    ['.'] = tree_cb('toggle_dotfiles'),
    ['R'] = tree_cb('refresh'),
    ['a'] = tree_cb('create'),
    ['d'] = tree_cb('remove'),
    ['r'] = tree_cb('rename'),

    ['o'] = tree_cb('edit'),
    ['x'] = tree_cb('cut'),
    ['c'] = tree_cb('copy'),
    ['p'] = tree_cb('paste'),
    ['y'] = tree_cb('copy_name'),
    ['Y'] = tree_cb('copy_path'),
    ['-'] = tree_cb('dir_up'),
    ['+'] = tree_cb('cd'),
    ['q'] = tree_cb('close'),
}
