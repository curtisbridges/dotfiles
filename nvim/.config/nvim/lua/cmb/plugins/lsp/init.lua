local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "cmb.plugins.lsp.mason"
require("cmb.plugins.lsp.handlers").setup()
