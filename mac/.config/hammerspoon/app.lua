function findOrLaunchApp(a)
  local app = hs.application.find(a)
  if not app then
    hs.application.launchOrFocus(a)
  end
  return app
end

function toggleApp(name)
  local app = hs.application.find(name)
  if not app or app:isHidden() then
    hs.application.launchOrFocus(name)
  elseif hs.application.frontmostApplication() ~= app then
    app:activate()
  else
    app:hide()
  end
end

-- move any window to a given space
function moveAppToSpace(app, space)
  -- move to main space
  local win = nil
  while win == nil do
    win = app:mainWindow()
  end

  hs.spaces.moveWindowToSpace(win, space)
  win:focus()
end

function getAppID(app)
  return hs.application.infoForBundlePath(app)['CFBundleIdentifier']
end
