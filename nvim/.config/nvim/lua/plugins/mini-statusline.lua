-- ~/.config/nvim/lua/plugins/mini-statusline.lua
return {
  "echasnovski/mini.statusline",
  config = function()
    require("mini.statusline").setup({ use_icons = true })
  end,
  lazy = false,
  enabled = true,
}
