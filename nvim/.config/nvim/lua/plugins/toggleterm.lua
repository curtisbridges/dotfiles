-- ~/.config/nvim/lua/plugins/toggleterm.lua
require("toggleterm").setup()

vim.keymap.set("n", "<C-\\>", "<cmd>ToggleTerm<CR>", { silent = true })
