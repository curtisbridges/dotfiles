local M = {}

local prettier_filetypes = {
  css = true,
  html = true,
  javascript = true,
  javascriptreact = true,
  json = true,
  jsonc = true,
  scss = true,
  typescript = true,
  typescriptreact = true,
}

local function prettier()
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" or vim.fn.executable("prettier") ~= 1 then
    return false
  end

  local input = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
  if vim.bo.endofline then
    input = input .. "\n"
  end

  local result = vim.system(
    { "prettier", "--stdin-filepath", path },
    { stdin = input, text = true }
  ):wait()

  if result.code ~= 0 then
    vim.notify("Prettier failed:\n" .. (result.stderr or ""), vim.log.levels.ERROR)
    return true
  end

  local lines = vim.split(result.stdout or "", "\n", { plain = true })
  if lines[#lines] == "" then
    table.remove(lines)
  end

  local cursor = vim.api.nvim_win_get_cursor(0)
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  pcall(vim.api.nvim_win_set_cursor, 0, cursor)
  return true
end

function M.format()
  if prettier_filetypes[vim.bo.filetype] and prettier() then
    return
  end
  vim.lsp.buf.format({ async = false })
end

return M
