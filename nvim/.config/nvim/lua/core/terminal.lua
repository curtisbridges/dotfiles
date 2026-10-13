local M = {}
local terminal_buf

local function terminal_window()
  if not terminal_buf or not vim.api.nvim_buf_is_valid(terminal_buf) then
    return nil
  end
  return vim.fn.bufwinid(terminal_buf)
end

function M.toggle()
  local win = terminal_window()
  if win and win ~= -1 then
    vim.api.nvim_win_close(win, false)
    return
  end

  vim.cmd("botright 12split")
  if terminal_buf and vim.api.nvim_buf_is_valid(terminal_buf) then
    vim.api.nvim_win_set_buf(0, terminal_buf)
  else
    vim.cmd.terminal()
    terminal_buf = vim.api.nvim_get_current_buf()
    vim.bo[terminal_buf].bufhidden = "hide"
  end
  vim.cmd.startinsert()
end

return M
