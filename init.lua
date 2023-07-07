hs.logger.defaultLogLevel="debug"

hyper       = {"cmd","alt","ctrl"}
shift_hyper = {"cmd","alt","ctrl","shift"}
ctrl_cmd    = {"cmd","ctrl"}

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true

Install=spoon.SpoonInstall

Install:andUse("Hammer",
               {
                 config = { auto_reload_config = true },
                 -- hotkeys = {
                 --   config_reload = {hyper, "r"},
                 --   toggle_console = {hyper, "y"}
                 -- },
                 start = true
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

Install:andUse("BrewInfo",
               {
                 config = {
                   brew_info_style = {
                     textFont = "Inconsolata",
                     textSize = 14,
                     radius = 10 }
                 },
                 hotkeys = {
                   -- brew info
                   show_brew_info = {hyper, "b"},
                   open_brew_url = {shift_hyper, "b"},
                 }
               }
)

Install:andUse("KSheet",
               {
                 hotkeys = {
                   toggle = { hyper, "/" }
}})

Install:andUse("TimeMachineProgress",
               {
                 start = true,
               }
)


Install:andUse("EjectMenu", {
                 config = {
                   eject_on_lid_close = true,
                   eject_on_sleep = false,
                   show_in_menubar = true,
                   notify = true,
                 },
                 hotkeys = { ejectAll = { hyper, "=" } },
                 start = true,
                -- loglevel = 'debug'
})

Install:andUse("MicMute", {
                 disable = false,
})

Install:andUse("HeadphoneAutoPause",
               {
                 start = true
               }
)

Install:andUse("Seal",
               {
                 hotkeys = { show = { {"alt"}, "space" } },
                 fn = function(s)
                   s:loadPlugins({"apps", "calc", "screencapture", "useractions"})
                   s.plugins.useractions.actions =
                     {
						["Hammerspoon docs webpage"] = {
                              url = "http://hammerspoon.org/docs/",
                              icon = hs.image.imageFromName(hs.image.systemImageNames.ApplicationIcon),
                         },
                     }
                   s:refreshAllCommands()
                 end,
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
