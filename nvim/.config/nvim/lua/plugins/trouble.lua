-- ~/.config/nvim/lua/plugins/trouble.lua
return {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup({})
  end,
}
