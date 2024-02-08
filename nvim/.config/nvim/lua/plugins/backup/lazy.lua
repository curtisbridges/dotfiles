-- Example using a list of specs with the default options
vim.g.mapleader = ' ' -- Make sure to set `mapleader` before lazy so your mappings are correct

require('lazy').setup({
  -- 'folke/todo-comments.nvim',
  -- 'folke/trouble.nvim',
  -- 'folke/which-key.nvim',
  -- 'folke/zen-mode.nvim',
  -- 'tpope/vim-surround', -- allow you to change surround ('cs')

  -- UI (bufferlines and statuslines)
  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  --   opts = {
  --     icons_enabled = true,
  --     theme = 'auto',
  --   },
  -- },
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = '*',
  --   dependencies = 'nvim-tree/nvim-web-devicons'
  -- },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  'christoomey/vim-tmux-navigator', -- keybinds for tmux and vim integration

  -- Tree
  -- {
  --   'kyazdani42/nvim-web-devicons',
  --   name = 'kyazdani42-nvim-web-devicons'
  -- },
  -- 'kyazdani42/nvim-tree.lua',

  -- 'akinsho/toggleterm.nvim',

  -- nvim-lua
  'nvim-lua/popup.nvim',   -- An implementation of the Popup API from vim in Neovim
  'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins

  -- cmp plugins
  'hrsh7th/nvim-cmp',    -- The completion plugin
  'hrsh7th/cmp-buffer',  -- buffer completions
  'hrsh7th/cmp-path',    -- path completions
  'hrsh7th/cmp-cmdline', -- cmdline completions
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'saadparwaiz1/cmp_luasnip', -- snippet completions

  -- snippets
  'L3MON4D3/LuaSnip', --snippet engine

  -- LSP
  'neovim/nvim-lspconfig',             -- enable LSP
  'williamboman/mason.nvim',           -- simple to use language server installer
  'williamboman/mason-lspconfig.nvim', -- simple to use language server installer

  'prettier/vim-prettier',             -- formatting

  -- Telescope
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-media-files.nvim',

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  },
  'nvim-treesitter/nvim-treesitter-context',
  'nvim-treesitter/playground',
  'windwp/nvim-autopairs', -- Autopairs, integrates with both cmp and treesitter
  'axelvc/template-string.nvim',

  -- Comments
  'numToStr/Comment.nvim', -- Easily comment stuff

  -- Git
  'lewis6991/gitsigns.nvim',

  -- coding
  'jose-elias-alvarez/typescript.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },
  'JoosepAlviste/nvim-ts-context-commentstring',
})
