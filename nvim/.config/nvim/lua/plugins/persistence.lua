-- ~/.config/nvim/lua/plugins/persistence.lua
return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  config = function()
    require("persistence").setup({
      dir = vim.fn.stdpath("state") .. "/sessions/",
      options = { "buffers", "curdir", "tabpages", "winsize" },
    })
    vim.api.nvim_set_keymap("n", "<leader>qs", "<cmd>lua require('persistence').load()<cr>",
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>ql", "<cmd>lua require('persistence').load({ last = true })<cr>",
      { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>qd", "<cmd>lua require('persistence').stop()<cr>",
      { noremap = true, silent = true })
  end,
}
