-- ~/.config/nvim/lua/core/keymaps.lua
vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>mm", function()
  local use_mini = vim.g.use_mini_statusline
  if use_mini then
    require("lualine").hide({ unhide = true })
    require("mini.statusline").setup()
  else
    require("mini.statusline").setup({ use_icons = false })
    require("lualine").setup({ options = { theme = "catppuccin" } })
  end
  vim.g.use_mini_statusline = not use_mini
end, opts)
map("n", "<leader>fa", function()
  vim.g.autoformat_enabled = not vim.g.autoformat_enabled
  vim.notify("Autoformat on save: " .. (vim.g.autoformat_enabled and "enabled" or "disabled"))
end, opts)
