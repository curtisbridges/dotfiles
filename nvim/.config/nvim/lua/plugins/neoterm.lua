return {{
    -- Floating terminal
    "itmecho/neoterm.nvim",
    opts = {
        clear_on_run = true, -- run clear command before user specified commands
        position = "horizontal", -- vertical/horizontal/fullscreen
        noinsert = false -- disable entering insert mode when opening the neoterm window
    },
    config = function(_, opts)
        require("neoterm").setup(opts)
    end
}}

