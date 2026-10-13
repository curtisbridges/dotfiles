-- ~/.config/nvim/lua/plugins/lsp.lua
local completion_triggers = {}
for byte = string.byte("0"), string.byte("9") do
  completion_triggers[#completion_triggers + 1] = string.char(byte)
end
for byte = string.byte("A"), string.byte("Z") do
  completion_triggers[#completion_triggers + 1] = string.char(byte)
end
for byte = string.byte("a"), string.byte("z") do
  completion_triggers[#completion_triggers + 1] = string.char(byte)
end
completion_triggers[#completion_triggers + 1] = "_"

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  local provider = client.server_capabilities.completionProvider
  if provider then
    provider.triggerCharacters = vim.list_extend(provider.triggerCharacters or {}, completion_triggers)
    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
  end
end

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  on_attach = on_attach,
})

vim.lsp.config("html", {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ" },
  root_markers = { "package.json", ".git" },
  on_attach = on_attach,
})

vim.lsp.config("cssls", {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "less", "scss" },
  root_markers = { "package.json", ".git" },
  on_attach = on_attach,
})

for _, server in ipairs({ "lua_ls", "ts_ls", "html", "cssls" }) do
  vim.lsp.enable(server)
end
