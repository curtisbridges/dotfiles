function findOrLaunch(a)
  local app = hs.application.find(a)
  if not app then
    hs.application.launchOrFocus(a)
  end
  return app
end

function toggleApplication(name)
  local app = hs.application.find(name)
  if not app or app:isHidden() then
    hs.application.launchOrFocus(name)
  elseif hs.application.frontmostApplication() ~= app then
    app:activate()
  else
    app:hide()
  end
end

function fancyNotify(t,m)
  hs.notify.new({title=t, informativeText=m}):send():release()
end

-- move any window to a given space
function moveWindowToSpace(app, space)
  -- move to main space
  local win = nil
  while win == nil do
    win = app:mainWindow()
  end

  hs.spaces.moveWindowToSpace(win, space)
  local fullScreen = win:isFullScreen()
  if fullScreen then
    hs.eventtap.keyStroke('cmd', 'return', 0, app)
  end
  win:focus()
end
-- move current window to the space sp
function moveFocusedWindowToSpace(sp)
  local win = hs.window.focusedWindow()   -- current window
  local cur_screen = hs.screen.mainScreen()
  local cur_screen_id = cur_screen:getUUID()
  local all_spaces = hs.spaces.allSpaces()
  local spaceID = all_spaces[cur_screen_id][sp]
  hs.spaces.moveWindowToSpace(win:id(), spaceID)
  hs.spaces.gotoSpace(spaceID)   -- follow window to new space
end
