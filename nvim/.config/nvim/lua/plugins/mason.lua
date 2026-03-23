-- ~/.config/nvim/lua/plugins/mason.lua
return {
  "mason-org/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  build = ":MasonUpdate",
  dependencies = { "mason-org/mason-lspconfig.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({ ensure_installed = { "html", "cssls" } })
  end,
}
