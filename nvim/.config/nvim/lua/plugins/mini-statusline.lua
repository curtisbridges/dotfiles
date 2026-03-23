-- ~/.config/nvim/lua/plugins/mini-statusline.lua
return {
  "echasnovski/mini.statusline",
  event = "VeryLazy",
  config = function()
    require("mini.statusline").setup({ use_icons = true })
  end,
}
