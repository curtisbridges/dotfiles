-- ~/.config/nvim/lua/plugins/which-key.lua
return {
  "folke/which-key.nvim",
   event = "VeryLazy", 
   config = function()
    require("which-key").setup({})
  end,
}
