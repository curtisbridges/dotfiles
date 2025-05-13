return { {
  -- Statusline
  -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'catppuccin',
        icons_enabled = true,
        section_separators = { left = '', right = '' }, -- Rounded corners
        component_separators = { left = '', right = '' } -- Rounded separators
      }
    }
  end
} }
