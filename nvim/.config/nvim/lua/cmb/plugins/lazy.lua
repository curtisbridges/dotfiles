local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = ' ' -- Make sure to set `mapleader` before lazy so your mappings are correct

require('lazy').setup({
  -- Colorschemes
  -- Lazy
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  -- somewhere in your config:
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night', -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = 'day', -- The theme is used when the background is set to light
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    },
  },
  {
    "folke/noice.nvim",
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
      }
  },
  'folke/todo-comments.nvim',
  'folke/trouble.nvim',
  'folke/which-key.nvim',
  'folke/zen-mode.nvim',
  'tpope/vim-surround', -- allow you to change surround ('cs')

  -- UI (bufferlines and statuslines)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    opts = {
      icons_enabled = true,
      theme = 'auto',
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  'christoomey/vim-tmux-navigator', -- keybinds for tmux and vim integration

  -- Tree
  {
    'kyazdani42/nvim-web-devicons',
    name = 'kyazdani42-nvim-web-devicons'
  },
  'kyazdani42/nvim-tree.lua',

  'akinsho/toggleterm.nvim',

  -- nvim-lua
  'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim
  'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins

  -- cmp plugins
  'hrsh7th/nvim-cmp', -- The completion plugin
  'hrsh7th/cmp-buffer', -- buffer completions
  'hrsh7th/cmp-path', -- path completions
  'hrsh7th/cmp-cmdline', -- cmdline completions
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  'saadparwaiz1/cmp_luasnip', -- snippet completions

  -- snippets
  'L3MON4D3/LuaSnip', --snippet engine

  -- LSP
  'neovim/nvim-lspconfig', -- enable LSP
  'williamboman/mason.nvim', -- simple to use language server installer
  'williamboman/mason-lspconfig.nvim', -- simple to use language server installer

  'prettier/vim-prettier', -- formatting

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
