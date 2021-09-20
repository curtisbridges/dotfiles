hyper       = {"cmd","alt","ctrl"}
shift_hyper = {"cmd","alt","ctrl","shift"}
ctrl_cmd    = {"cmd","ctrl"}


hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
-- shortcut for spoon installs
Install=spoon.SpoonInstall

function appID(app)
  return hs.application.infoForBundlePath(app)['CFBundleIdentifier']
end

safariBrowser = appID('/Applications/Safari.app')
chromeBrowser = appID('/Applications/Google Chrome.app')
-- edgeBrowser = appID('/Applications/Microsoft Edge.app')
-- braveBrowser = appID('/Applications/Brave Browser Dev.app')

DefaultBrowser = safariBrowser
WorkBrowser = chromeBrowser

-- Adjust this for current employer -- Skillsoft
Install:andUse("URLDispatcher",
               {
                 config = {
                   url_patterns = {
                     { "https?://jira%.work%.com",      JiraApp },
                     { "https?://wiki%.work%.com",      WikiApp },
                     { "https?://app.*%.opsgenie%.com", OpsGenieApp },
                     { "msteams:",                      "com.microsoft.teams" },
                     { "https?://.*%.work%.com",        WorkBrowser }
                   },
                   url_redir_decoders = {
                     -- Send MS Teams URLs directly to the app
                     { "MS Teams URLs",
                       "(https://teams.microsoft.com.*)", "msteams:%1", true },
                     -- Preview incorrectly encodes the anchor
                     -- character in URLs as %23, we fix it
                     { "Fix broken Preview anchor URLs",
                       "%%23", "#", false, "Preview" },
                   },
                   default_handler = DefaultBrowser
                 },
                 start = true,
                 -- Enable debug logging if you get unexpected behavior
                 -- loglevel = 'debug'
               }
)


Install:andUse("ColorPicker",
               {
                 disable = true,
                 hotkeys = {
                   show = { hyper, "z" }
                 },
                 config = {
                   show_in_menubar = false,
                 },
                 start = true,
               }
)

Install:andUse("FadeLogo",
               {
                 config = {
                   default_run = 1.0,
                 },
                 start = true
               }
)
