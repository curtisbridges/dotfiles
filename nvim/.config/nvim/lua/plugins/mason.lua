-- ~/.config/nvim/lua/plugins/mason.lua
require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "html", "cssls" } })
