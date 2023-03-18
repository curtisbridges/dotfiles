-- hs.hotkey.bind({ "shift", "command" }, "return", function()
--   local alacritty = hs.application.find('alacritty')
--   if alacritty:isFrontmost() then
--     alacritty:hide()
--   else
--     hs.application.launchOrFocus("/Applications/Alacritty.app")
--   end
-- end)



-- SOURCE: https://world.hey.com/jonash/alacritty-drop-down-guake-quake-style-terminal-setup-on-macos-6eef7d73
-- https://github.com/asmagill/hs._asm.undocumented.spaces
local spaces = require "hs.spaces"
local screen = require "hs.screen"

-- Switch alacritty
hs.hotkey.bind({ 'shift', 'command' }, 'return', function()
  local APP_NAME = 'Alacritty'

  function moveWindow(alacritty, space)
    -- move to main space
    local win = nil
    while win == nil do
      win = alacritty:mainWindow()
    end
    -- print("win = ", win)
    -- print("space = ", space)
    -- print("win:screen() = ", win:screen())

    local fullScreen = not win:isStandard()
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, alacritty)
    end

    winFrame = win:frame()
    scrFrame = screen.mainScreen():frame()
    -- print(winFrame)
    -- print(scrFrame)

    winFrame.w = scrFrame.w
    winFrame.y = scrFrame.y
    winFrame.x = scrFrame.x
    -- print(winFrame)

    win:setFrame(winFrame, 0)
    -- print(win:frame())

    spaces.moveWindowToSpace(win, space)
    local fullScreen = not win:isStandard()
    if fullScreen then
      hs.eventtap.keyStroke('cmd', 'return', 0, alacritty)
    end
    win:focus()
  end

  local alacritty = hs.application.get(APP_NAME)
  if alacritty ~= nil and alacritty:isFrontmost() then
    alacritty:hide()
  else
    local space = spaces.activeSpaceOnScreen()
    -- print("activeSpace() = ", space)
    if alacritty == nil and hs.application.launchOrFocus(APP_NAME) then
      local appWatcher = nil
      -- print('create app watcher')
      appWatcher = hs.application.watcher.new(function(name, event, app)
        -- print(name)
        -- print(event)
        if event == hs.application.watcher.launched and name == APP_NAME then
          app:hide()
          moveWindow(app, space)
          appWatcher:stop()
        end
      end)
      -- print('start watcher')
      appWatcher:start()
    end
    if alacritty ~= nil then
      moveWindow(alacritty, space)
    end
  end
end)

-- Hide alacritty if not in focus
-- hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
--   local alacritty = hs.application.get('Alacritty')
--   print(alacritty)
--   if alacritty ~= nil then
--      print('hiding alacritty')
--      alacritty:hide()
--   end
-- end)
