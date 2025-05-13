-- ~/.config/nvim/lua/plugins/noice.lua
return {
  "folke/noice.nvim",
  dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  config = function()
    require("noice").setup({})
  end,
}
