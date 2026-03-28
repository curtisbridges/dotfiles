-- ~/.config/nvim/lua/plugins/treesitter.lua
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup({
      ensure_installed = { 'lua', 'vim', 'javascript', 'typescript' },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

