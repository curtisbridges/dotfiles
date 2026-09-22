-- Telescope
-- Find, Filter, Preview, Pick. All lua, all the time.
local telescope = require("telescope")
telescope.setup({
  pickers = {
    live_grep = {
      file_ignore_patterns = { "node_modules/", ".git/" },
      additional_args = function(_)
        return { "--hidden" }
      end,
    },
    find_files = {
      file_ignore_patterns = { "node_modules/", ".git/" },
      hidden = true,
    },
  },
  extensions = {
    "fzf",
  },
})
telescope.load_extension("fzf")

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { silent = true })
