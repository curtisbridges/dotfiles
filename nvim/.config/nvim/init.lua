-- ~/.config/nvim/init.lua
require("core")
require("plugins")

-- ## Features
-- - Built-in vim.pack plugin manager (`:lua vim.pack.update()`)
-- - Telescope + fzf-native for blazing fast search
-- - Built-in LSP completion and snippets for JS/TS, HTML, CSS, React, and Lua
-- - Mini.nvim pairs and surround operators
-- - Built-in comments, diagnostics list, file explorer, statusline, terminal, and sessions
-- - Toggleable Prettier/LSP autoformat on save (<leader>fa)
-- - Toggle between full and minimal built-in statuslines (<leader>mm)
-- - Git status via gitsigns
-- - Keymap discovery via which-key
--
-- ## Keybindings
-- - `<leader>e` — toggle file explorer
-- - `<leader>ff` — find files
-- - `<leader>fg` — grep
-- - `<leader>fb` — switch buffers
-- - `<leader>fa` — toggle autoformat on save
-- - `<leader>mm` — toggle statusline mode
-- - `<leader>qs/ql/qd` — load current/load last/stop session saving
