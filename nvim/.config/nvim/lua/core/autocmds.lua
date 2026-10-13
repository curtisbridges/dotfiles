vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("autoformat", { clear = true }),
  callback = function()
    if vim.g.autoformat_enabled then
      require("core.format").format()
    end
  end,
})

