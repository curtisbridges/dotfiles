vim.opt.background = 'dark'

require('onedark').setup  {
  -- Main options --
  style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = true,  -- Show/hide background
  term_colors = true, -- Change terminal color as per the selected theme style

  -- Lualine options --
  lualine = {
    transparent = false, -- lualine center bar transparency
  },
}
require('lualine').setup {
  options = {
    theme = 'onedark'
    -- ... your lualine config
  }
}

vim.cmd('colorscheme onedark')