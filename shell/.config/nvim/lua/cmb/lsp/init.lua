local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "cmb.lsp.mason"
require("cmb.lsp.handlers").setup()
