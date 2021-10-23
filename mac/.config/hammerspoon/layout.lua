-- -------------------------------------------------------------------
-- Layout managment
-- -------------------------------------------------------------------

--
-- Apps
--

local apps = {
  chrome = 'Google Chrome',
  slack = 'Slack',
  tweetbot = 'Tweetbot',
  terminal = 'iTerm',
}

---
-- Screen watcher
---

function SwitchLayout()
  local allScreens = hs.screen.allScreens()
  local moreThanOneScreen = #allScreens > 1
  local isTwoScreens = #allScreens == 2
  local contains = hs.fnutils.contains

  local screens = {
    laptop = hs.screen 'Retina Display', -- laptop screen
    -- samsung = hs.screen 'S24R65x',
    -- LG = hs.screen 'LG HDR 4K',
    dell = hs.screen 'Dell U3219Q'
  }

-- hs.alert(allScreens[0])
-- hs.alert(allScreens[1])
-- hs.alert(allScreens[2])
-- hs.alert(screens.laptop)
-- hs.alert(screens.dell)

  local layout = {
    -- {
    --   apps.chrome,
    --   nil,
    --   (moreThanOneScreen and (contains(allScreens, screens.LG) or contains(
    --     allScreens, screens.samsung
    --   ))) and (screens.LG or screens.samsung) or screens.main,
    --   hs.layout.maximized,
    --   nil,
    --   nil,
    -- },
    { apps.tweetbot, nil, screens.dell, hs.layout.right30, nil, nil },
    { apps.slack, nil, screens.laptop, hs.layout.maximized, nil, nil },
  }

  if moreThanOneScreen then
    hs.notify.show(
      'Hammerspoon',
      #allScreens .. ' monitor layout activated',
      (screens.dell or screens.laptop):name()
    )
  end

  hs.layout.apply(layout)
end

SwitchLayout()

return {
  layoutWatcher = hs.screen.watcher.newWithActiveScreen(SwitchLayout),
}
