-- ~/.config/nvim/lua/plugins/mason.lua
require("mason").setup()

local registry = require("mason-registry")
local packages = {
  "css-lsp",
  "html-lsp",
  "lua-language-server",
  "typescript-language-server",
}

registry.refresh(function()
  for _, name in ipairs(packages) do
    local ok, package = pcall(registry.get_package, name)
    if ok and not package:is_installed() then
      package:install()
    end
  end
end)
