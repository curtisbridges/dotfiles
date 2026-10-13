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
local function ensure_fzf_native()
  local plugin = vim.pack.get({ "telescope-fzf-native.nvim" }, { info = false })[1]
  if not plugin then
    return false
  end

  local library = plugin.path .. "/build/libfzf.so"
  if vim.uv.fs_stat(library) then
    return true
  end

  if vim.fn.executable("make") ~= 1 then
    vim.notify("telescope-fzf-native requires make to build libfzf.so", vim.log.levels.ERROR)
    return false
  end

  local result = vim.system({ "make" }, { cwd = plugin.path }):wait()
  if result.code ~= 0 or not vim.uv.fs_stat(library) then
    vim.notify(
      "telescope-fzf-native build failed:\n" .. (result.stderr or result.stdout or ""),
      vim.log.levels.ERROR
    )
    return false
  end

  return true
end

if ensure_fzf_native() then
  telescope.load_extension("fzf")
end

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { silent = true })
