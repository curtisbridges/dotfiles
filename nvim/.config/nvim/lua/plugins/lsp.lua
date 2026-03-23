-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  'neovim/nvim-lspconfig',
  dependencies = { 'hrsh7th/nvim-cmp' },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, silent = true }
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    end

    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    vim.lsp.enable('lua_ls')

    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.enable('ts_ls')
  end,
}
