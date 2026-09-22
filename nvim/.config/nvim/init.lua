-- ~/.config/nvim/init.lua
require("core")
require("plugins")

-- ## Features
-- - Built-in vim.pack plugin manager (`:packupdate`, `:packdel`)
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
