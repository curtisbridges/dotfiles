BROWSER = 'Safari'             -- Google Chrome
EDITOR = 'Visual Studio Code'  -- TextEdit
FILES = 'Finder'               -- ???
MAIL = 'Mail'                  -- Outlook
TERMINAL = 'iTerm2'            -- Terminal
MUSIC = 'Spotify'              -- Apple Music
PODCASTS = 'Pocket Casts'      -- Apple Podcasts


local MODAL_ID = 'AppSwitcher'
spoon.ModalMgr:new(MODAL_ID)
local cmodal = spoon.ModalMgr.modal_list[MODAL_ID]

local function appActivate(name)
  findOrLaunch(name)
  spoon.ModalMgr:deactivate({MODAL_ID})
end

-- modal related
cmodal:bind('', 'escape', 'Deactivate AppSwitcher', function() spoon.ModalMgr:deactivate({MODAL_ID}) end )
cmodal:bind('', 'tab', 'Toggle Cheatsheet', function() spoon.ModalMgr:toggleCheatsheet() end )

-- hs.hotkey.bind(hyper, 'b', function() findOrLaunch(BROWSER) end)
-- hs.hotkey.bind(hyper, 'e', function() findOrLaunch(EDITOR) end)
-- hs.hotkey.bind(hyper, 'f', function() findOrLaunch(FILES) end)
-- hs.hotkey.bind(hyper, 'm', function() findOrLaunch(MAIL) end)
-- hs.hotkey.bind(hyper, 't', function() findOrLaunch(TERMINAL) end)
-- hs.hotkey.bind(hyper, 'p', function() findOrLaunch(PODCASTS) end)
cmodal:bind('', 'b', BROWSER, function() appActivate(BROWSER) end)
cmodal:bind('', 'e', EDITOR, function() appActivate(EDITOR) end)
cmodal:bind('', 'f', FILES, function() appActivate(FILES) end)
cmodal:bind('', 'm', MAIL, function() appActivate(MAIL) end)
cmodal:bind('', 'p', PODCASTS, function() appActivate(PODCASTS) end)
cmodal:bind('', 's', MUSIC, function() appActivate(MUSIC) end)
cmodal:bind('', 't', TERMINAL, function() appActivate(TERMINAL) end)

-- Register AppSwitcher with modal supervisor
modal_keys = modal_keys or {hyper, '\\'}
if string.len(modal_keys[2]) > 0 then
  spoon.ModalMgr.supervisor:bind(
    modal_keys[1],
    modal_keys[2],
    'Enter App Switcher Environment',
    function()
      -- Deactivate some modal environments or not before activating a new one
      spoon.ModalMgr:deactivateAll()
      -- Show an status indicator so we know we're in some modal environment now
      spoon.ModalMgr:activate({MODAL_ID}, '#B22222')
    end
  )
end
