<<<<<<< HEAD
-- RC
-- General helpers
require("awful")
require("awful.autofocus")
=======
-- LIBRARIES
require("awful")
require("awful.autofocus")
require("awful.rules")
require("wibox")
>>>>>>> 84376952260f4610cd857d8eee54fff1c4f27c22
require("beautiful")
require("naughty")
require("vicious")
require("shifty")
<<<<<<< HEAD
require("calendar2")

-- Defaults
terminal = "urxvt"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
browser = "luakit"
modkey = "Mod4"
altkey = "Mod1"

-- Configs
require("themes")
=======

--ERRORS
-- Startup error handling
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "There were errors during startup!",
		text = awesome.startup_errors
	})
end

-- Runtime errors after startup
do local in_error = false
	awesome.connect_signal("debug::error",
	function (err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true
		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "An error occurred!",
			text = err
		})
		in_error = false
    	end)
end

-- DEFAULTS
terminal   = "urxvtc"
editor     = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
browser    = "opera"
modkey     = "Mod4"
altkey     = "Mod1"

-- THEME
beautiful.init("/home/jack/.config/awesome/themes/default/theme.lua")

-- CONFIGS
require("colours")
require("remind")
>>>>>>> 84376952260f4610cd857d8eee54fff1c4f27c22
require("tags")
require("menu")
require("widgetstop")
require("widgetsbottom")
require("creation")
require("bindings")
require("signals")
<<<<<<< HEAD

os.execute"dex -a"
-- awful.util.spawn_with_shell ("kde4")
-- awful.util.spawn_with_shell ("qdbus org.kde.kded /kded loadModule powerdevil")
=======
>>>>>>> 84376952260f4610cd857d8eee54fff1c4f27c22
