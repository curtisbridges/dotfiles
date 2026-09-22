-- Lualine no longer ships a built-in `catppuccin` theme file; catppuccin.nvim exposes it here.
local lualine_theme = require("catppuccin.utils.lualine")()
require("lualine").setup({
  options = {
    theme = lualine_theme,
    icons_enabled = true,
    globalstatus = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
  },
})
