-- ~/.config/nvim/lua/plugins/treesitter.lua
-- nvim-treesitter `main` installs parsers explicitly and leaves highlight/indent to Neovim.
local languages = { "lua", "vim", "javascript", "typescript" }

-- The `main` branch compiles parsers with the `tree-sitter` CLI.
if vim.fn.executable("tree-sitter") == 1 then
  require("nvim-treesitter").install(languages):wait(300000)
else
  vim.notify("tree-sitter CLI not found; parsers were not installed", vim.log.levels.WARN)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = languages,
  callback = function()
    vim.treesitter.start()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
