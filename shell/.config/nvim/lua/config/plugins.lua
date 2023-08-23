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
  'folke/which-key.nvim',
  -- { 'folke/neoconf.nvim', cmd = 'Neoconf' },
  -- 'folke/neodev.nvim',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    opts = {
      icons_enabled = true,
      theme = 'auto',
    }
  },
  'christoomey/vim-tmux-navigator',

  -- nvim-lua
  'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim
  'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins

  -- cmp plugins
  'hrsh7th/nvim-cmp', -- The completion plugin
  'hrsh7th/cmp-buffer', -- buffer completions
  'hrsh7th/cmp-path', -- path completions
  'hrsh7th/cmp-cmdline', -- cmdline completions
  'saadparwaiz1/cmp_luasnip', -- snippet completions
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',

  -- snippets
  'L3MON4D3/LuaSnip', --snippet engine

  -- LSP
  'neovim/nvim-lspconfig', -- enable LSP
  'williamboman/mason.nvim', -- simple to use language server installer
  'williamboman/mason-lspconfig.nvim', -- simple to use language server installer

  -- Telescope
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-media-files.nvim',

  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate",
  },
  'p00f/nvim-ts-rainbow',
  'nvim-treesitter/playground',
})
