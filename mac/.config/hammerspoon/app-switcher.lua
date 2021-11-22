BROWSER = 'Safari'             -- Google Chrome
COMMS = 'Slack'
EDITOR = 'Visual Studio Code'  -- TextEdit
FILES = 'Finder'               -- ???
MAIL = 'Mail'                  -- Outlook
MUSIC = 'Spotify'              -- Apple Music
NOTES = 'Notes'
PODCASTS = 'Pocket Casts'      -- Apple Podcasts
REMINDERS = 'Reminders'
TERMINAL = 'iTerm'            -- Terminal
VISUAL = 'Visual Studio Code'

local MODAL_ID = 'AppSwitcher'
spoon.ModalMgr:new(MODAL_ID)
local cmodal = spoon.ModalMgr.modal_list[MODAL_ID]

local function appActivate(name)
  hs.application.launchOrFocus(name)
  spoon.ModalMgr:deactivate({MODAL_ID})
end

-- direct apps
hs.hotkey.bind(hyper, 'b', BROWSER, function() appActivate(BROWSER) end)
hs.hotkey.bind(hyper, 'e', EDITOR, function() appActivate(EDITOR) end)
hs.hotkey.bind(hyper, 't', TERMINAL, function() appActivate(TERMINAL) end)

-- modal related
cmodal:bind('', 'escape', 'Deactivate AppSwitcher', function() spoon.ModalMgr:deactivate({MODAL_ID}) end )
cmodal:bind('', 'tab', 'Toggle Cheatsheet', function() spoon.ModalMgr:toggleCheatsheet() end )

cmodal:bind('', 'b', BROWSER, function() appActivate(BROWSER) end)
cmodal:bind('', 'c', COMMS, function() appActivate(COMMS) end)
cmodal:bind('', 'e', EDITOR, function() appActivate(EDITOR) end)
cmodal:bind('', 'f', FILES, function() appActivate(FILES) end)
cmodal:bind('', 'g', 'Google Chrome', function() appActivate('Google Chrome') end)
cmodal:bind('', 'm', MAIL, function() appActivate(MAIL) end)
cmodal:bind('', 'n', NOTES, function() appActivate(NOTES) end)
cmodal:bind('', 'o', 'Outlook', function() appActivate('Outlook') end)
cmodal:bind('', 'p', PODCASTS, function() appActivate(PODCASTS) end)
cmodal:bind('', 'r', REMINDERS, function() appActivate(REMINDERS) end)
cmodal:bind('', 's', MUSIC, function() appActivate(MUSIC) end)
cmodal:bind('', 't', TERMINAL, function() appActivate(TERMINAL) end)
cmodal:bind('', 'v', VISUAL, function() appActivate(VISUAL) end)

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
