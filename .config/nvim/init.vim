source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/modules/general.vim
source $HOME/.config/nvim/modules/keymapping.vim
source $HOME/.config/nvim/modules/airline.vim
source $HOME/.config/nvim/modules/nvim-tree.vim
source $HOME/.config/nvim/themes/nord.vim

lua require('myconfig/treesitter')
lua require('myconfig/lspconfig')
lua require('myconfig/compe')
lua require('myconfig/bufferline')
lua require('myconfig/kommentary')
lua require('myconfig/trouble')
