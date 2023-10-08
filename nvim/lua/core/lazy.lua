-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: lazy.nvim
-- URL: https://github.com/folke/lazy.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Start setup
lazy.setup({
  spec = {
    -- Colorscheme:
    -- The colorscheme should be available when starting Neovim.
    {
      'navarasu/onedark.nvim',
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
    },

    -- other colorschemes:
    { 'tanvirtin/monokai.nvim', lazy = false, priority = 1001 },
    { 'https://github.com/rose-pine/neovim', name = 'rose-pine', lazy = true },
    { 'sainnhe/edge',priority = 1002, lazy = false },

    -- Icons
    { 'kyazdani42/nvim-web-devicons', lazy = true },

    -- Dashboard (start screen)
    {
      'goolord/alpha-nvim',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- Git labels
    {
      'lewis6991/gitsigns.nvim',
      lazy = true,
      dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require('gitsigns').setup{}
      end
    },

    -- File explorer
    {
      'kyazdani42/nvim-tree.lua',
      dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- Statusline
    {
      'freddiehaddad/feline.nvim',
      dependencies = {
        'kyazdani42/nvim-web-devicons',
        'lewis6991/gitsigns.nvim',
      },
    },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- Indent line
    { 'lukas-reineke/indent-blankline.nvim' },

    -- Tag viewer
    { 'preservim/tagbar' },

    -- Autopair
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('nvim-autopairs').setup{}
      end
    },

    -- LSP
    --{ 'neovim/nvim-lspconfig' },

    ---- Autocomplete
    --{
      --'hrsh7th/nvim-cmp',
      ---- load cmp on InsertEnter
      --event = 'InsertEnter',
      ---- these dependencies will only be loaded when cmp loads
      ---- dependencies are always lazy-loaded unless specified otherwise
      --dependencies = {
        --'L3MON4D3/LuaSnip',
        --'hrsh7th/cmp-nvim-lsp',
        --'hrsh7th/cmp-path',
        --'hrsh7th/cmp-buffer',
        --'saadparwaiz1/cmp_luasnip',
      --},
    --},

	{
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required

  }
},
{
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
},

-- Installation
 --{ 'L3MON4D3/LuaSnip' },
 --{
  --'hrsh7th/nvim-cmp',
  --config = function ()
    --require'cmp'.setup {
    --snippet = {
      --expand = function(args)
        --require'luasnip'.lsp_expand(args.body)
      --end
    --},

    --sources = {
      --{ name = 'luasnip' },
      ---- more sources
    --},
  --}
  --end
--},
--{ 'saadparwaiz1/cmp_luasnip' },
  {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim'
    },
    config = "require('plugins.telescope')",
  },


{ 'sainnhe/gruvbox-material'},
{'jnurmine/Zenburn'},
{'luisiacc/gruvbox-baby'},
{
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    -- your optional config goes here, see below.
  end,
},


{'FrenzyExists/aquarium-vim'},
{
  "willothy/nvim-cokeline",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  config = true
},
{"sindrets/diffview.nvim"},
{"f-person/git-blame.nvim"},
{
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = {
      {"kyazdani42/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    },
    }



  },
})
