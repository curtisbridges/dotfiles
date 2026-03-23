-- ~/.config/nvim/lua/plugins/trouble.lua
return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>" },
  }, 
  config = function()
    require("trouble").setup({})
  end,
}
