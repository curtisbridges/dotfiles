local M = {}

local function explore(path)
  vim.cmd("Lexplore " .. vim.fn.fnameescape(path))
end

function M.toggle()
  if vim.bo.filetype == "netrw" then
    vim.cmd.close()
    return
  end

  explore(vim.fn.getcwd())
end

function M.find_file()
  local path = vim.api.nvim_buf_get_name(0)
  explore(path ~= "" and vim.fs.dirname(path) or vim.fn.getcwd())

  local filename = vim.fs.basename(path)
  if filename ~= "" then
    vim.fn.search("\\V" .. vim.fn.escape(filename, "\\"), "cw")
  end
end

function M.refresh()
  if vim.bo.filetype == "netrw" then
    vim.cmd.edit()
  else
    vim.cmd.checktime()
  end
end

return M
