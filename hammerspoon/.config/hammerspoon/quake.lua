---@diagnostic disable: need-check-nil
function quakeTerminal()
  local APP_NAME = TERMINAL_APP
  if APP_NAME == nil then
    APP_NAME = 'Alacritty'
  end

  local terminal = hs.application.get(APP_NAME)

  if terminal ~= nil and terminal:isFrontmost() then
    terminal:hide()
  else
    local space = hs.spaces.activeSpaceOnScreen()
    if terminal == nil and hs.application.launchOrFocus(APP_NAME) then
      local appWatcher = nil
      appWatcher = hs.application.watcher.new(function(name, event, app)
        if event == hs.application.watcher.launched and name == APP_NAME then
          app:hide()
          moveAppToSpace(app, space)
          appWatcher:stop()
        end
      end)
      appWatcher:start()
    end
    if terminal ~= nil then
      moveAppToSpace(terminal, space)
    end
  end
end
