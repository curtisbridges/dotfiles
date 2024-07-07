return { {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
}, {
    -- Tokyonight- A clean, dark Neovim theme written in Lua, with support for lsp,
    -- treesitter and lots of plugins. Includes additional themes for Kitty, Alacritty, iTerm and Fish.
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {
        style = 'night',        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = 'day',    -- The theme is used when the background is set to light
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    },
}, {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
}, }
