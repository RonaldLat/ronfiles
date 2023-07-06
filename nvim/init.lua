--[[

Neovim init file
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-- Import Lua modules
require('core/lazy')
require('core/autocmds')
require('core/keymaps')
require('core/colors')
require('core/statusline')
require('core/options')
require('lsp/lsp-zero')
require('lsp/lsp-config')
require('plugins/nvim-tree')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require('plugins/nvim-treesitter')
require('plugins/alpha-nvim')
require('plugins/telescope')
require('plugins/lspsaga')
require('plugins/cokeline')

