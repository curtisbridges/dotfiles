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

  gh("mason-org/mason.nvim"),

  gh("folke/which-key.nvim"),

  gh("echasnovski/mini.nvim"),

  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },

  gh("lewis6991/gitsigns.nvim"),

  gh("nvim-lua/plenary.nvim"),
  gh("nvim-telescope/telescope-fzf-native.nvim"),
  gh("nvim-telescope/telescope.nvim"),
}, { load = true, confirm = false })

require("plugins.colorscheme")
require("plugins.mason")
require("plugins.lsp")
require("plugins.which-key")
require("plugins.mini")
require("plugins.treesitter")
require("plugins.gitsigns")
require("plugins.telescope")

startup = false
for name in pairs(pending_builds) do
  run_build(name)
end
