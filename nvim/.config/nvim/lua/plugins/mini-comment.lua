-- plugins/mini.lua or plugins/mini-comment.lua
return {
  "echasnovski/mini.comment",
  version = false,
  event = "VeryLazy",
  config = function()
    require("mini.comment").setup({
      -- All below options are defaults and can be omitted
      mappings = {
        comment = 'gc',
        comment_line = 'gcc',
        textobject = 'gc',
      },
      options = {
        custom_commentstring = nil,
        ignore_blank_line = false,
        start_of_line = false,
      },
    })
  end,
}
