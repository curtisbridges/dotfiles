-- ~/.config/nvim/lua/plugins/mini.lua
return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",
  config = function()
    require("mini.pairs").setup()
    require("mini.surround").setup()
    require("mini.bufremove").setup()
  end,
}
