local M = {}
local session_dir = vim.fn.stdpath("state") .. "/sessions"
local stopped = false
vim.fn.mkdir(session_dir, "p")

local function session_path(cwd)
  return ("%s/%s.vim"):format(session_dir, vim.fn.sha256(cwd))
end

local function latest_session()
  local latest
  local latest_time = -1

  for name, type in vim.fs.dir(session_dir) do
    if type == "file" and name:sub(-4) == ".vim" then
      local path = session_dir .. "/" .. name
      local stat = vim.uv.fs_stat(path)
      local modified = stat and stat.mtime.sec or 0
      if modified > latest_time then
        latest = path
        latest_time = modified
      end
    end
  end

  return latest
end

function M.save()
  if stopped then
    return
  end

  vim.fn.mkdir(session_dir, "p")
  vim.cmd("silent! mksession! " .. vim.fn.fnameescape(session_path(vim.fn.getcwd())))
end

function M.load(opts)
  opts = opts or {}
  local path = opts.last and latest_session() or session_path(vim.fn.getcwd())
  if not path or vim.fn.filereadable(path) == 0 then
    vim.notify("No session found", vim.log.levels.WARN)
    return
  end

  vim.cmd("source " .. vim.fn.fnameescape(path))
end

function M.stop()
  stopped = true
  vim.notify("Session saving stopped")
end

vim.api.nvim_create_autocmd("VimLeavePre", {
  group = vim.api.nvim_create_augroup("builtin_sessions", { clear = true }),
  callback = M.save,
})

return M
