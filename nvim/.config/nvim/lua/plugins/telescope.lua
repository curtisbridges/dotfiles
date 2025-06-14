return {
  -- Telescope
  -- Find, Filter, Preview, Pick. All lua, all the time.
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  } },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      pickers = {
        live_grep = {
          file_ignore_patterns = { 'node_modules/', '.git/' },
          additional_args = function(_)
            return { "--hidden" }
          end
        },
        find_files = {
          file_ignore_patterns = { 'node_modules/', '.git/' },
          hidden = true
        }

      },
      extensions = {
        "fzf"
      },
    })
    telescope.load_extension("fzf")
  end,
}
