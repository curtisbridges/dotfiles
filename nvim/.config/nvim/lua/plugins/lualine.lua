return { {
    -- Statusline
    -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
    "nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup {
            theme = "auto",
            icons_enabled = true,
        }
    end
} }
