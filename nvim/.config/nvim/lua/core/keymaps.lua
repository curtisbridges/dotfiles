-- ~/.config/nvim/lua/core/keymaps.lua
local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>mm", function()
  local use_mini = vim.g.use_mini_statusline
  if use_mini then
    require("lualine").hide({ unhide = true })
    require("mini.statusline").setup()
  else
    require("mini.statusline").setup({ use_icons = false })
    require("lualine").setup({ options = { theme = "catppuccin" } })
  end
  vim.g.use_mini_statusline = not use_mini
end, opts)
vim.keymap.set("n", "<leader>fa", function()
  vim.g.autoformat_enabled = not vim.g.autoformat_enabled
  vim.notify("Autoformat on save: " .. (vim.g.autoformat_enabled and "enabled" or "disabled"))
end, opts)

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Move around splits
vim.keymap.set("n", "<leader>wh", "<C-w>h", {})
vim.keymap.set("n", "<leader>wj", "<C-w>j", {})
vim.keymap.set("n", "<leader>wk", "<C-w>k", {})
vim.keymap.set("n", "<leader>wl", "<C-w>l", {})

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", opts)

vim.keymap.set("n", "<leader>q", ":qa!<CR>", {})
-- Fast saving with <leader> and s
vim.keymap.set("n", "<leader>s", ":w<CR>", {})

-- Reload configuration without restart nvim
vim.keymap.set("n", "<leader>r", ":so %<CR>", {})

-- Telescope
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", opts)
vim.keymap.set('n', '<leader>gs', function()
  require('telescope.builtin').grep_string({ search = vim.fn.expand("<cword>") })
end, { desc = 'Grep string under cursor' })

-- NvimTree
-- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
-- vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", {})    -- open/close
-- vim.keymap.set("n", "<leader>nr", ":NvimTreeRefresh<CR>", {})  -- refresh
-- vim.keymap.set("n", "<leader>nf", ":NvimTreeFindFile<CR>", {}) -- search file

-- Insert --
-- Press jj fast to exit insert mode
vim.keymap.set("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Snacks --
-- local opts = { noremap = true, silent = true }
-- local picker = require("snacks.picker")

-- Snacks Picker
-- vim.keymap.set("n", "<leader>ff", function() picker.files() end, opts)
-- vim.keymap.set("n", "<leader>fb", function() picker.buffers() end, opts)
-- vim.keymap.set("n", "<leader>fg", function() picker.live_grep() end, opts)
-- vim.keymap.set("n", "<leader>gs", function() picker.grep_string({ search = vim.fn.expand("<cword>") }) end, opts)

-- vim.keymap.set("n", "<leader>e", function()
-- picker.open("files")
-- end, { desc = "Open file picker (snacks)", noremap = true, silent = true })

-- Comments
-- Comment: https://github.com/numToStr/Comment.nvim
vim.keymap.set("n", "<leader>/", function() require('Comment.api').toggle.linewise.current() end, opts)
--[[ vim.keymap.set('n', '<C-/>', 'gcc', { remap = true }) ]]
--[[ vim.keymap.set('v', '<C-/>', 'gc',  { remap = true }) ]]
