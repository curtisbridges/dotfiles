-- ~/.config/nvim/lua/plugins/nvim-tree.lua
require("nvim-tree").setup({})

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { silent = true })
