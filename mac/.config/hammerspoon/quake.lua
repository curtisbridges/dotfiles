local function alacrittyQuake()
  local APP_NAME = 'Alacritty'
  local alacritty = hs.application.get(APP_NAME)

  if alacritty ~= nil and alacritty:isFrontmost() then
    alacritty:hide()
  else

    local space = hs.spaces.activeSpaceOnScreen()
    if alacritty == nil and hs.application.launchOrFocus(APP_NAME) then
      local appWatcher = nil
      appWatcher = hs.application.watcher.new(function(name, event, app)
        if event == hs.application.watcher.launched and name == APP_NAME then
          app:hide()
          moveWindowToSpace(app, space)
          appWatcher:stop()
        end
      end)
      appWatcher:start()
    end
    if alacritty ~= nil then
      moveWindowToSpace(alacritty, space)
    end
  end
end

hs.hotkey.bind({ "shift", "command" }, "return", function() alacrittyQuake() end)
