-- ~/.config/nvim/lua/plugins/null-ls.lua
local null_ls = require("null-ls")
null_ls.setup({ sources = { null_ls.builtins.formatting.prettier } })
