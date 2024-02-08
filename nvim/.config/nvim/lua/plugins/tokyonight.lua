return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night',        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = 'day',    -- The theme is used when the background is set to light
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
    },
    -- config = function()
    --   vim.cmd.colorscheme "tokyonight"
    -- end
  }
}
