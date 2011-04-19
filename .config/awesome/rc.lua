-- GENERAL HELPERS
require("awful")
require("awful.autofocus")
require("beautiful")
require("naughty")
require("vicious")
require("rodentbane")
require("shifty")
require("calendar2")

-- THEMES
local f = io.open("/home/jack/.config/awesome/themes/theme_to_use", "r")
local r = f:read("*a")
if r == "day" then
	themeset = "themeday"
	f:close()
elseif r == "night" then
	themeset = "themenight"
	f:close()
else
	local tod = os.date("%H")
	if tod >= "07" and tod <="18" then
		themeset = "themeday"
	else
		themeset = "themenight"
	end
	f:close()
end
require(themeset)

local f = io.open("/home/jack/.config/awesome/themes/theme_to_use", "w")
	f:write("")
	f:close()

-- DEFAULTS
terminal = "urxvtc"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
browser = "luakit"
modkey = "Mod4"
altkey = "Mod1"

-- CONFIGS
require("tags")
require("menu")
require("widgetstop")
require("widgetsbottom")
require("creation")
require("bindings")
require("signals")
