return { {
  -- Statusline
  -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "catppuccin/nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Lualine no longer ships a built-in `catppuccin` theme file; catppuccin.nvim exposes it here.
    local lualine_theme = require("catppuccin.utils.lualine")()
    require("lualine").setup({
      options = {
        theme = lualine_theme,
        icons_enabled = true,
        globalstatus = true,
        section_separators = { left = '', right = '' }, -- Rounded corners
        component_separators = { left = "", right = "" }, -- Rounded separators
      },
    })
  end
} }
