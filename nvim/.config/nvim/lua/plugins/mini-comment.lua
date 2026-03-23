return {
  "echasnovski/mini.comment",
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.comment").setup({
      mappings = {
        comment = "gc",
        comment_line = "gcc",
        textobject = "gc",
      },
      options = {
        custom_commentstring = nil,
        ignore_blank_line = false,
        start_of_line = false,
      },
    })
    local map_opts = { remap = true, silent = true }
    vim.keymap.set("n", "<leader>/", "gcc", map_opts)
    vim.keymap.set("x", "<leader>/", "gc", map_opts)
  end,
}
