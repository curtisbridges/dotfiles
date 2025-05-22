-- ~/.config/nvim/lua/plugins/init.lua
require("lazy").setup({
  -- install = {
  --   -- install missing plugins on startup
  --   missing = true,
  --   -- try to load one of these colorschemes when starting an installation during startup
  --   colorscheme = { "catppuccin", "tokyonight", "onedarkpro" }
  -- },
  { "catppuccin/nvim",                      name = "catppuccin", priority = 1000 },
  { "nvim-lua/plenary.nvim" },
  -- { import = "plugins" },
  { import = "plugins.colorscheme" },
  { import = "plugins.telescope" },
  { import = "plugins.nvim-tree" },
  { import = "plugins.lualine" },
  { import = "plugins.lsp" },
  { import = "plugins.mason" },
  { import = "plugins.which-key" },
  { import = "plugins.trouble" },
  { import = "plugins.noice" },
  { import = "plugins.mini" },
  { import = "plugins.mini-statusline" },
  { import = "plugins.treesitter" },
  { import = "plugins.completion" },
  { import = "plugins.null-ls" },
  { import = "plugins.gitsigns" },
  { import = "plugins.toggleterm" },
  { import = "plugins.persistence" },
  { import = "plugins.telescope-extensions" },
  { import = "plugins.snacks" },
})
