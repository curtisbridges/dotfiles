-- Spoons!
-- Download and install this _one_ spoon to autoload all the others
hs.loadSpoon('SpoonInstall')
Install = spoon.SpoonInstall
spoon.SpoonInstall.use_syncinstall = true

-- -- Window Management
-- Install:andUse("WindowHalfsAndThirds", { config = {} })
-- local windowHotkeys = {
--   left_half    = { { "ctrl", "cmd" }, "Left" },
--   right_half   = { { "ctrl", "cmd" }, "Right" },
--   top_half     = { { "ctrl", "cmd" }, "Up" },
--   bottom_half  = { { "ctrl", "cmd" }, "Down" },
--   third_left   = { { "ctrl", "alt" }, "Left" },
--   third_right  = { { "ctrl", "alt" }, "Right" },
--   third_up     = { { "ctrl", "alt" }, "Up" },
--   third_down   = { { "ctrl", "alt" }, "Down" },
--   top_left     = { { "ctrl", "cmd" }, "1" },
--   top_right    = { { "ctrl", "cmd" }, "2" },
--   bottom_left  = { { "ctrl", "cmd" }, "3" },
--   bottom_right = { { "ctrl", "cmd" }, "4" },
--   max_toggle   = { { "ctrl", "cmd" }, "f" },
--   max          = { { "ctrl", "alt", "cmd" }, "Up" },
--   undo         = { { "ctrl", "cmd" }, "forwarddelete" },
--   center       = { { "ctrl", "cmd" }, "c" },
--   larger       = { { "ctrl", "alt", "cmd" }, "=" },
--   smaller      = { { "ctrl", "alt", "cmd" }, "-" },
-- }
-- spoon.WindowHalfsAndThirds:bindHotkeys(windowHotkeys)

-- local screenHotkeys = {
--   screen_left = { { "ctrl", "alt", "cmd" }, "Left" },
--   screen_right = { { "ctrl", "alt", "cmd" }, "Right" },
-- }
-- Install:andUse("WindowScre[[enLeftAndRight", {})
-- spoon.WindowScreenLeftAndRight:bindHotkeys(screenHotkeys)

Install:andUse("URLDispatcher",
  {
    config = {
      url_patterns = {
        { "https://*.skillsoft.com/",                       WorkBrowser },
        { "https://github.skillsoft.com/",                  WorkBrowser },
        { "https://skillsoftartisan.slack.com/",            WorkBrowser },
        { "https://skillsoftdev.atlassian.net/",            WorkBrowser },
        { "https://percipio.front.develop.squads-dev.com/", WorkBrowser },
        { "https://percipio.front.release.squads-dev.com/", WorkBrowser },
        { "https://kubernetes.develop.squads-dev.com/",     WorkBrowser },
        { "https://jenkins.rocs.io/",                       WorkBrowser },
        { "https://percipion.qa.rocs.io/",                  WorkBrowser },
        { "https://skillsoft-my.sharepoint.com/",           WorkBrowser },
        { "https://jenkins.paris-squad.com",                WorkBrowser },
      },
      default_handler = DefaultBrowser
    },
    start = true,
    -- Enable debug logging if you get unexpected behavior
    -- loglevel = 'debug'
  }
)
