-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.tsserver.setup({ capabilities = capabilities })
    lspconfig.html.setup({ capabilities = capabilities })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.eslint.setup({ capabilities = capabilities })
  end,
}

-- plugins/lsp.lua
-- return {
--   "neovim/nvim-lspconfig",
--   dependencies = {
--     "williamboman/mason.nvim",
--     "williamboman/mason-lspconfig.nvim",
--   },
--   config = function()
--     require("mason").setup()
--     require("mason-lspconfig").setup({
--       ensure_installed = { "tsserver" },
--     })

--     local lspconfig = require("lspconfig")
--     require("mason-lspconfig").setup_handlers({
--       function(server_name)
--         lspconfig[server_name].setup({})
--       end,
--     })
--   end,
-- }
