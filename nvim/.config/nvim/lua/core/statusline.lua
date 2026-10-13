local M = {}
local branch = ""
local style = "full"

local modes = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "V-LINE",
  ["\22"] = "V-BLOCK",
  c = "COMMAND",
  R = "REPLACE",
  t = "TERMINAL",
}

local function escape(value)
  return value:gsub("%%", "%%%%")
end

local function diagnostics()
  local counts = vim.diagnostic.count(0)
  local severity = vim.diagnostic.severity
  local parts = {}
  if counts[severity.ERROR] then
    parts[#parts + 1] = "E:" .. counts[severity.ERROR]
  end
  if counts[severity.WARN] then
    parts[#parts + 1] = "W:" .. counts[severity.WARN]
  end
  if counts[severity.INFO] then
    parts[#parts + 1] = "I:" .. counts[severity.INFO]
  end
  if counts[severity.HINT] then
    parts[#parts + 1] = "H:" .. counts[severity.HINT]
  end
  return table.concat(parts, " ")
end

function M.render()
  local mode = modes[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode:upper()
  local file = vim.fn.expand("%:~:.")
  file = file == "" and "[No Name]" or escape(file)

  if style == "minimal" then
    return (" %s  %s %%m%%r%%=%%l:%%c  %%p%%%% "):format(mode, file)
  end

  local git = branch ~= "" and ("  git:" .. escape(branch)) or ""
  local diag = diagnostics()
  diag = diag ~= "" and ("  " .. diag) or ""
  local encoding = vim.bo.fileencoding ~= "" and vim.bo.fileencoding or vim.o.encoding
  return (" %s%s%s  %s %%m%%r%%=%s  %s  %s  %%l:%%c  %%p%%%% "):format(
    mode,
    git,
    diag,
    file,
    vim.bo.filetype,
    encoding,
    vim.bo.fileformat
  )
end

function M.toggle()
  style = style == "full" and "minimal" or "full"
  vim.cmd.redrawstatus()
  vim.notify("Statusline: " .. style)
end

local function refresh_branch()
  local path = vim.api.nvim_buf_get_name(0)
  local cwd = vim.fs.root(path ~= "" and path or vim.fn.getcwd(), ".git") or vim.fn.getcwd()
  vim.system({ "git", "branch", "--show-current" }, { cwd = cwd, text = true }, function(result)
    vim.schedule(function()
      branch = result.code == 0 and vim.trim(result.stdout or "") or ""
      vim.cmd.redrawstatus()
    end)
  end)
end

vim.o.laststatus = 3
vim.o.statusline = "%!v:lua.require'core.statusline'.render()"

vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged", "FocusGained" }, {
  group = vim.api.nvim_create_augroup("builtin_statusline", { clear = true }),
  callback = refresh_branch,
})

refresh_branch()

return M
