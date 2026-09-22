-- ~/.config/nvim/lua/plugins/init.lua
-- Plugins are installed with vim.pack and configured in the modules below.
-- Update with :lua vim.pack.update(). Remove unused plugins with :lua vim.pack.del({ "name" }).

-- Install hooks run before plugins are loaded. Defer command hooks until after setup.
local startup = true
local pending_builds = {}

local function run_build(name)
  local ok, err = pcall(function()
    if name == "nvim-treesitter" then
      vim.cmd("TSUpdate")
    elseif name == "mason.nvim" then
      vim.cmd("MasonUpdate")
    end
  end)
  if not ok then
    vim.notify(name .. " build failed:\n" .. tostring(err), vim.log.levels.ERROR)
  end
end

local function on_pack_changed(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if kind ~= "install" and kind ~= "update" then
    return
  end

  if name == "telescope-fzf-native.nvim" then
    local result = vim.system({ "make" }, { cwd = ev.data.path }):wait()
    if result.code ~= 0 then
      vim.notify("telescope-fzf-native build failed:\n" .. (result.stderr or ""), vim.log.levels.ERROR)
    end
    return
  end

  if name ~= "nvim-treesitter" and name ~= "mason.nvim" then
    return
  end

  if startup then
    pending_builds[name] = true
    return
  end

  if not ev.data.active then
    vim.cmd.packadd(name)
  end
  run_build(name)
end

vim.api.nvim_create_autocmd("PackChanged", { callback = on_pack_changed })

local function gh(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({
  { src = gh("catppuccin/nvim"), name = "catppuccin" },
  gh("folke/tokyonight.nvim"),
  gh("olimorris/onedarkpro.nvim"),

  gh("nvim-tree/nvim-web-devicons"),
  gh("nvim-tree/nvim-tree.lua"),
  gh("nvim-lualine/lualine.nvim"),

  gh("hrsh7th/nvim-cmp"),
  gh("hrsh7th/cmp-nvim-lsp"),
  gh("L3MON4D3/LuaSnip"),
  gh("saadparwaiz1/cmp_luasnip"),
  gh("neovim/nvim-lspconfig"),

  gh("mason-org/mason.nvim"),
  gh("mason-org/mason-lspconfig.nvim"),

  gh("folke/which-key.nvim"),
  gh("folke/trouble.nvim"),
  gh("MunifTanjim/nui.nvim"),
  gh("rcarriga/nvim-notify"),
  gh("folke/noice.nvim"),

  gh("echasnovski/mini.nvim"),
  gh("echasnovski/mini.comment"),
  gh("echasnovski/mini.statusline"),

  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },

  gh("nvimtools/none-ls.nvim"),
  gh("lewis6991/gitsigns.nvim"),
  -- Latest semver tag, same as the old lazy.nvim `version = "*"`.
  { src = gh("akinsho/toggleterm.nvim"), version = vim.version.range("*") },
  gh("folke/persistence.nvim"),

  gh("nvim-lua/plenary.nvim"),
  gh("nvim-telescope/telescope-fzf-native.nvim"),
  gh("nvim-telescope/telescope.nvim"),
}, { load = true, confirm = false })

require("plugins.colorscheme")
require("plugins.nvim-tree")
require("plugins.lualine")
require("plugins.lsp")
require("plugins.mason")
require("plugins.which-key")
require("plugins.trouble")
require("plugins.noice")
require("plugins.mini")
require("plugins.mini-comment")
require("plugins.mini-statusline")
require("plugins.treesitter")
require("plugins.completion")
require("plugins.null-ls")
require("plugins.gitsigns")
require("plugins.toggleterm")
require("plugins.persistence")
require("plugins.telescope")

startup = false
for name in pairs(pending_builds) do
  run_build(name)
end
