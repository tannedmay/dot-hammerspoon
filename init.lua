hs.logger.defaultLogLevel="debug"

hyper       = {"cmd","alt","ctrl"}
shift_hyper = {"cmd","alt","ctrl","shift"}
ctrl_cmd    = {"cmd","ctrl"}

hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall.use_syncinstall = true

Install=spoon.SpoonInstall

Install:andUse("Hammer",
               {
                 config = { auto_reload_config = false },
                 hotkeys = {
                   config_reload = {hyper, "r"},
                   toggle_console = {hyper, "y"}
                 },
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
                 start = false,
                 disable = true
               }
)


Install:andUse("EjectMenu", {
                 config = {
                   eject_on_lid_close = true,
                   eject_on_sleep = true,
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
                 hotkeys = { show = { hyper, "space" } },
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

local laptopScreen = "Color LCD"
local Monitor = "LG"

-- Define position values that don't exist by default in hs.layout.*
local positions = {
  leftTop = {x=0, y=0, w=0.5, h=0.5},
  leftBottom = {x=0, y=0.5, w=0.5, h=0.5},
  rightTop = {x=0.5, y=0, w=0.5, h=0.5},
  rightBottom = {x=0.5, y=0.5, w=0.5, h=0.5}
  -- left = {x=0, y=0, w=0.5, h=1}
  -- right = {x=0.5, y=0, w=0.5, h=1}
}

local layoutDualScreen = {
  {"GoLand", nil, Monitor, positions.left, nil, nil},
  {"Firefox", nil, Monitor, positions.right, nil, nil},
  {"ClickUp", nil, Monitor, positions.right, nil, nil},
  {"Discord", nil, Monitor, positions.right, nil, nil},
  {"Sublime Text", nil, Monitor, positions.left, nil, nil},
  {"Sublime Merge", nil, Monitor, positions.left, nil, nil},
  {"iTerm", nil, Monitor, positions.rightBottom, nil, nil},
}

local layoutSingleScreen = {
  {"GoLand", nil, laptopScreen, hs.layout.maximized, nil, nil},
  {"Firefox", nil, laptopScreen, hs.layout.maximized, nil, nil},
  {"ClickUp", nil, laptopScreen, hs.layout.maximized, nil, nil},
  {"Discord", nil, laptopScreen, hs.layout.maximized, nil, nil},
  {"Sublime Text", nil, laptopScreen, hs.layout.maximized, nil, nil},
  {"Sublime Merge", nil, laptopScreen, hs.layout.maximized, nil, nil},
  {"iTerm", nil, laptopScreen, positions.rightBottom, nil, nil},
}

local appNames = {
  "GoLand",
  "Firefox",
  "ClickUp",
  "Discord",
  "Sublime Text",
  "Sublime Merge",
  "iTerm"
}

local function launchApps()
  for i, appName in ipairs(appNames) do
    hs.application.launchOrFocus(appName)
  end
end

local menu = hs.menubar.new()
local function setSingleScreen()
  menu:setTitle("🖥1")
  menu:setTooltip("Single Screen Layout")
  hs.layout.apply(layoutSingleScreen)
end

local function setDualScreen()
  menu:setTitle("🖥2")
  menu:setTooltip("Dual Screen Layout")
  hs.layout.apply(layoutDualScreen)
end

local function enableMenu()
  menu:setTitle("🖥")
  menu:setTooltip("No Layout")
  menu:setMenu({
      { title = "Launch Apps", fn = launchApps },
      { title = "Set Dual Screen Layout", fn = setDualScreen },
      { title = "Set Single Screen Layout", fn = setSingleScreen },
  })
end

enableMenu()
