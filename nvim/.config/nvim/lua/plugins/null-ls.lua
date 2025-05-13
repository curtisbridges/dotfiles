-- ~/.config/nvim/lua/plugins/null-ls.lua
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({ sources = { null_ls.builtins.formatting.prettier } })
  end,
}
