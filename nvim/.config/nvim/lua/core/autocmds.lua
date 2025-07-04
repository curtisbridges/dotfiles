vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    if vim.g.autoformat_enabled then
      vim.lsp.buf.format({ async = false })
    end
  end
})

