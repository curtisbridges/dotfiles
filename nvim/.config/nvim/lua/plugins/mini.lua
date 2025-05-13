-- ~/.config/nvim/lua/plugins/mini.lua
return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.pairs").setup()
    require("mini.comment").setup()
    require("mini.surround").setup()
    require("mini.bufremove").setup()
  end,
}
