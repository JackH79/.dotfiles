-- RC
-- General helpers
require("awful")
require("awful.autofocus")
require("beautiful")
require("naughty")
require("vicious")
require("shifty")
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
require("tags")
require("menu")
require("widgetstop")
require("widgetsbottom")
require("creation")
require("bindings")
require("signals")

os.execute"dex -a"
-- awful.util.spawn_with_shell ("kde4")
-- awful.util.spawn_with_shell ("qdbus org.kde.kded /kded loadModule powerdevil")
