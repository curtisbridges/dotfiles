-- ~/.config/nvim/init.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("core")
require("plugins")

-- ## Features
-- - Lazy.nvim plugin manager
-- - Telescope + fzf-native for blazing fast search
-- - LSP setup for JS/TS, HTML, CSS, React
-- - Mini.nvim utilities
-- - Toggleable autoformat on save (<leader>fa)
-- - Toggle between `lualine` and `mini.statusline` (<leader>mm)
-- - Integrated terminal with toggleterm
-- - Git status via gitsigns
-- - Session management via persistence.nvim
-- - Trouble, noice, and which-key integrations
--
-- ## Keybindings
-- - `<leader>e` — toggle file explorer
-- - `<leader>ff` — find files
-- - `<leader>fg` — grep
-- - `<leader>fb` — switch buffers
-- - `<leader>fa` — toggle autoformat on save
-- - `<leader>mm` — toggle statusline mode
-- - `<leader>qs/ql/qd` — session load/save/stopped

vim.cmd.colorscheme "catppuccin"
