-- ~/.config/nvim/lua/core/keymaps.lua
local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>mm", function()
  require("core.statusline").toggle()
end, vim.tbl_extend("force", opts, { desc = "Toggle statusline style" }))
vim.keymap.set("n", "<leader>fa", function()
  vim.g.autoformat_enabled = not vim.g.autoformat_enabled
  vim.notify("Autoformat on save: " .. (vim.g.autoformat_enabled and "enabled" or "disabled"))
end, vim.tbl_extend("force", opts, { desc = "Toggle autoformat on save" }))

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

-- Telescope find/grep/buffers: plugins/telescope.lua
vim.keymap.set("n", "<leader>gs", function()
  require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
end, vim.tbl_extend("force", opts, { desc = "Grep string under cursor" }))

-- Built-in netrw file explorer
vim.keymap.set("n", "<leader>e", function() require("core.explorer").toggle() end,
  { silent = true, desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>n", function() require("core.explorer").toggle() end,
  { silent = true, desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>nr", function() require("core.explorer").refresh() end,
  { silent = true, desc = "Refresh file explorer" })
vim.keymap.set("n", "<leader>nf", function() require("core.explorer").find_file() end,
  { silent = true, desc = "Find current file in explorer" })

-- Built-in diagnostics list, terminal, and sessions
vim.keymap.set("n", "<leader>xx", function()
  vim.diagnostic.setqflist()
  vim.cmd.copen()
end, { silent = true, desc = "Workspace diagnostics" })
vim.keymap.set("n", "<C-\\>", function() require("core.terminal").toggle() end,
  { silent = true, desc = "Toggle terminal" })
vim.keymap.set("n", "<leader>qs", function() require("core.session").load() end,
  { silent = true, desc = "Load current directory session" })
vim.keymap.set("n", "<leader>ql", function() require("core.session").load({ last = true }) end,
  { silent = true, desc = "Load last session" })
vim.keymap.set("n", "<leader>qd", function() require("core.session").stop() end,
  { silent = true, desc = "Stop session saving" })

-- Insert --
-- Press jj fast to exit insert mode
vim.keymap.set("i", "jj", "<ESC>", opts)
vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() == 0 then
    return "<CR>"
  end
  return vim.fn.complete_info().selected == -1 and "<C-n><C-y>" or "<C-y>"
end, { expr = true, desc = "Accept completion or insert newline" })

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

-- Neovim's built-in commenting operator provides gc/gcc.
vim.keymap.set("n", "<leader>/", "gcc", { remap = true, silent = true, desc = "Comment line" })
vim.keymap.set("x", "<leader>/", "gc", { remap = true, silent = true, desc = "Comment selection" })
