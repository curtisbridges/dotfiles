-- ~/.config/nvim/lua/plugins/trouble.lua
require("trouble").setup({})

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { silent = true })
