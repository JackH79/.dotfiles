require("awful")
require("awful.autofocus")
require("beautiful")
require("naughty")
require("vicious")
require("rodentbane")
require("shifty")

-- THEME
beautiful.init("/home/jack/.config/awesome/themes/jack2/theme.lua")

-- DEFAULTS
terminal = "urxvt"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

-- TAGS + TAG MATCHING
-- layouts
layouts = {
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.max,
	awful.layout.suit.floating,
}
-- shifty: predefined tags
shifty.config.tags = {
	["1-def"]   = { init = true, position = 1, layout = awful.layout.suit.fair.horizontal },
	["2-web"]   = { position = 2, layout = awful.layout.suit.max                          },
	["3-mail"]  = { position = 3, layout = awful.layout.suit.max                          },
	["4-off"]   = { position = 4, layout = awful.layout.suit.tile.bottom                  },
	["5-pdf"]   = { position = 5, layout = awful.layout.suit.tile.bottom                  },
	["6-gra"]   = { position = 6, layout = awful.layout.suit.floating                     },
	["7-video"] = { position = 7, layout = awful.layout.suit.max                          },
	["8-music"] = { position = 8, layout = awful.layout.suit.tile.bottom                  },
	["9-irssi"] = { position = 9, layout = awful.layout.suit.max                          },
	["torrent"] = { layout = awful.layout.suit.max                                        },
	["mirage"]  = { layout = awful.layout.suit.max                                        },
	["dial"]    = { layout = awful.layout.suit.max                                        },
}
-- shifty: tags matching
shifty.config.apps = {
	{ match = { "Namoroka", "jumanji"            }, tag = "2-web",   },
	{ match = { "mutt", "Lanikai"                }, tag = "3-mail",  },
	{ match = { "OpenOffice.org 3.2", "Texmaker" }, tag = "4-off",   },
	{ match = { "Zathura", "Epdfview"            }, tag = "5-pdf",   },
	{ match = { "Gimp", "Geeqie"                 }, tag = "6-gra",   },
	{ match = { "gimp%-image%-window"            }, geometry = {175,15,930,770}, border_width = 0                },
	{ match = { "^gimp%-toolbox$"                }, geometry = {0,15,175,770}, slave = true, border_width = 0    },
	{ match = { "^gimp%-dock$"                   }, geometry = {1105,15,175,770}, slave = true, border_width = 0 },
	{ match = { "MPlayer", "Vlc", "Audacity"     }, tag = "7-video", },
	{ match = { "MPlayer"                        }, geometry = {0,15,nil,nil}, float = true },
	{ match = { "ncmpcpp"                        }, tag = "8-music", },
	{ match = { "irssi"                          }, tag = "9-irssi", },
	{ match = { "rtorrent"                       }, tag = "torrent", },
	{ match = { "Mirage"                         }, tag = "mirage",  },
	{ match = { "wicd%-curses", "wvdial"         }, tag = "dial",    },
	-- client manipulation
	{ match = { "" },
		honorsizehints = false,
		buttons = awful.util.table.join (
		awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
		awful.button({ modkey }, 1, awful.mouse.client.move),
		awful.button({ modkey }, 3, awful.mouse.client.resize))
	},
}
-- shifty: defaults
shifty.config.defaults = {
layout = awful.layout.suit.max,
}
shifty.config.layouts = layouts
shifty.init()

-- MENUE
networkmenu = {
	{ "namoroka",    "firefox" },
	{ "mutt",        terminal .. " -e mutt" },
	{ "irssi",       terminal .. " -e irssi" },
	{ "wicd",        terminal .. " -e wicd-curses" },
	{ "wvdial",      terminal .. " -e sudo wvdial optus" },
	{ "rtorrent",    terminal .. " -e rtorrent" }
}

officemenu = {
	{ "texmaker",    "texmaker" },
	{ "writer",      "soffice -writer" },
	{ "calc",        "soffice -calc" },
	{ "impress",     "soffice -impress" },
	{ "speedcrunch", "speedcrunch" },
	{ "r",           terminal .. " -e R" }
}

editorsmenu = {
	{ "vim",         terminal .. " -e vim" },
	{ "medit",       "medit" }
}

graphicsmenu = {
	{ "gimp",        "gimp" },
	{ "geeqie",      "geeqie" }
}

mediamenu = {
	{ "vlc",         "vlc" },
	{ "ncmpcpp",     terminal .. " -e ncmpcpp" },
	{ "audacity",    "audacity" }
}

utilitiesmenu = {
	{ "virtualbox",  "VirtualBox" },
	{ "xfburn",      "xfburn" },
	{ "truecrypt",   "truecrypt" }
}

systemmenu = {
	{ "monitor",     monitormenu },
	{ "htop",        terminal .. " -e htop" },
	{ "kill",        "xkill" }
}

monitormenu = {
	{ "scroff",      "xrandr --output LVDS --off" },
	{ "scron",       "xrandr --output LVDS --auto" },
	{ "scrmax",      "xrandr --output VGA-0 --preferred" }
}

awesomemenu = {
	{ "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
	{ "restart",     awesome.restart },
	{ "lock",        terminal .. " -e xscreensaver-command --lock" },
	{ "quit",        awesome.quit },
	{ "reboot",      terminal .. " -e reboot" },
	{ "shutdown",    terminal .. " -e shutdown" }
}

mainmenu = awful.menu({
	items = {
		{ "network",   networkmenu },
		{ "office",    officemenu },
		{ "editors",   editorsmenu },
		{ "graphics",  graphicsmenu },
		{ "media",     mediamenu },
		{ "utilities", utilitiesmenu },
		{ "sytem",     systemmenu },
		{ "awesome",   awesomemenu }
	}
})

-- WIDGETS TOP
-- Spacer widget
spacerwidget = widget({ type = "imagebox" })
	spacerwidget.image = image("/home/jack/.config/awesome/themes/jack2/spacer.png")
-- Calendar widget
calwidget = awful.widget.textclock({ align = "right" }, "<span color='#be6e00'> %a, %d %b </span>", 61)
	function cal_getc()
		local fp = io.popen("remind -c -m -w40,2,0 /dev/null")
		local reminders = fp:read("*a")
		fp:close()
		return "<span color='#9acd32'>\n" .. reminders .. "</span>\n"
	end
	function cal_remc()
		naughty.notify { text = cal_getc(), timeout = 10, hover_timeout = 1 }
	end
	calwidget:buttons(awful.util.table.join(awful.button({}, 1, cal_remc)))

-- Clock widget
clockwidget = awful.widget.textclock({ align = "right" }, "<span color='#d79b1e'>%l:%M%P</span>", 59)
	function cal_gett()
		local fp = io.popen("remind /home/jack/.reminders")
		local rem = fp:read("*a")
		fp:close()
			rem = string.gsub(rem, "\027%[0m", "</span>")
			rem = string.gsub(rem, "\027%[0;30m", "<span color='#1a1a1a'>")
			rem = string.gsub(rem, "\027%[0;31m", "<span color='#b23535'>")
			rem = string.gsub(rem, "\027%[0;32m", "<span color='#60801f'>")
			rem = string.gsub(rem, "\027%[0;33m", "<span color='#be6e00'>")
			rem = string.gsub(rem, "\027%[0;34m", "<span color='#1f6080'>")
			rem = string.gsub(rem, "\027%[0;35m", "<span color='#8f46b2'>")
			rem = string.gsub(rem, "\027%[0;36m", "<span color='#73afb4'>")
			rem = string.gsub(rem, "\027%[0;37m", "<span color='#b2b2b2'>")
			rem = string.gsub(rem, "\027%[1;30m", "<span color='#4c4c4c'>")
			rem = string.gsub(rem, "\027%[1;31m", "<span color='#ff4b4b'>")
			rem = string.gsub(rem, "\027%[1;32m", "<span color='#9acd32'>")
			rem = string.gsub(rem, "\027%[1;33m", "<span color='#d79b1e'>")
			rem = string.gsub(rem, "\027%[1;34m", "<span color='#329bcd'>")
			rem = string.gsub(rem, "\027%[1;35m", "<span color='#cd64ff'>")
			rem = string.gsub(rem, "\027%[1;36m", "<span color='#9acdff'>")
			rem = string.gsub(rem, "\027%[1;37m", "<span color='#ffffff'>")
		return rem
	end
	function cal_remt()
		naughty.notify { text = cal_gett(), timeout = 10, hover_timeout = 1 }
	end
	clockwidget:buttons(awful.util.table.join(awful.button({}, 1, cal_remt)))

-- Weather widget TODO
--weatherwidget = widget({ type = "textbox" })
--	vicious.register(weatherwidget, vicious.widgets.weather,
--	function (widget, args)
--		if args["{tempc}"] == "N/A" then
--			return ""
--		else
--			return YBTL

-- WIDGETS BOTTOM RIGHT
-- CPU widget
cputwidget = widget({ type = "textbox" })
	vicious.register(cputwidget, vicious.widgets.cpu,
	function (widget, args)
		if  args[1] == 50 then
			return "<span color='#be6e00'>cpu </span><span color='#d79b1e'>" .. args[1] .. "% </span>"
		elseif args[1] >= 50 then
			return "<span color='#b23535'>cpu </span><span color='#ff4b4b'>" .. args[1] .. "% </span>"
		else
			return "<span color='#60801f'>cpu </span><span color='#9acd32'>" .. args[1] .. "% </span>"
		end
	end )
cputwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( terminal .. " -e htop --sort-key PERCENT_CPU") end ) ) )

-- CPU temp widget
tempwidget = widget({ type = "textbox" })
	vicious.register(tempwidget, vicious.widgets.thermal,
	function (widget, args)
		if  args[1] >= 65 and args[1] < 75 then
			return "<span color='#be6e00'>temp </span><span color='#d79b1e'>" .. args[1] .. "°C </span>"
		elseif args[1] >= 75 and args[1] < 80 then
			return "<span color='#b23535'>temp </span><span color='#ff4b4b'>" .. args[1] .. "°C </span>"
		elseif args[1] > 80 then
			naughty.notify({ title = "Temperature Warning", text = "Running hot! "..args[1].."°C!\nTake it easy.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "<span color='#b23535'>temp </span><span color='#ff4b4b'>" .. args[1] .. "°C </span>" 
		else
			return "<span color='#60801f'>temp </span><span color='#9acd32'>" .. args[1] .. "°C </span>"
		end
	end, 19, "thermal_zone0"	)

-- Ram widget
memwidget = widget({ type = "textbox" })
	vicious.cache(vicious.widgets.mem)
	vicious.register(memwidget, vicious.widgets.mem, "<span color='#60801f'>ram </span><span color='#9acd32'>$1% ($2 MiB) </span>", 13)

-- Filesystem widgets
fsrwidget = widget({ type = "textbox" })
	vicious.register(fsrwidget, vicious.widgets.fs,
	function (widget, args)
		if  args["{/ used_p}"] >= 90 and args["{/ used_p}"] < 98 then
			return "<span color='#be6e00'>/ </span><span color='#d79b1e'>" .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) </span>"
		elseif args["{/ used_p}"] >= 98 and args["{/ used_p}"] < 100 then
			return "<span color='#b23535'>/ </span><span color='#ff4b4b'>" .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) </span>"
		elseif args["{/ used_p}"] == 100 then
			naughty.notify({ title = "Hard drive Warning", text = "No space left on root!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "<span color='#b23535'>/ </span><span color='#ff4b4b'>" .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) </span>" 
		else
			return "<span color='#60801f'>/ </span><span color='#9acd32'>" .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) </span>"
		end
	end, 1200)

fshwidget = widget({ type = "textbox" })
	vicious.register(fshwidget, vicious.widgets.fs,
	function (widget, args)
		if  args["{/home used_p}"] >= 90 and args["{/home used_p}"] < 98 then
			return "<span color='#be6e00'>/home </span><span color='#d79b1e'>" .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) </span>"
		elseif args["{/home used_p}"] >= 98 and args["{/home used_p}"] < 100 then
			return "<span color='#b23535'>/home </span><span color='#ff4b4b'>" .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) </span>"
		elseif args["{/home used_p}"] == 100 then
			naughty.notify({ title = "Hard drive Warning", text = "No space left on /home!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "<span color='#b23535'>/home </span><span color='#ff4b4b'>" .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) </span>" 
		else
			return "<span color='#60801f'>/home </span><span color='#9acd32'>" .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) </span>"
		end
	end, 1200)

-- Net widgets
-- eth
neteupwidget = widget({ type = "textbox" })
	vicious.cache(vicious.widgets.net)
	vicious.register(neteupwidget, vicious.widgets.net, "<span color='#60801f'>up </span><span color='#9acd32'>${eth0 up_kb} </span>")

netedownwidget = widget({ type = "textbox" })
	vicious.register(netedownwidget, vicious.widgets.net, "<span color='#60801f'>down </span><span color='#9acd32'>${eth0 down_kb} </span>")

netwidget = widget({ type = "textbox" })
	vicious.register(netwidget, vicious.widgets.netinfo,
	function (widget, args)
		if args["{ip}"] == nil then
			netedownwidget.visible = false
			neteupwidget.visible = false
			return ""
		else
			netedownwidget.visible = true
			neteupwidget.visible = true
			return "<span color='#60801f'>eth0 </span><span color='#9acd32'>" .. args["{ip}"] .. " </span>"
		end
	end, refresh_delay, "eth0")

-- wlan
netwupwidget = widget({ type = "textbox" })
	vicious.register(netwupwidget, vicious.widgets.net, "<span color='#60801f'>up </span><span color='#9acd32'>${wlan0 up_kb} </span>")

netwdownwidget = widget({ type = "textbox" })
	vicious.register(netwdownwidget, vicious.widgets.net, "<span color='#60801f'>down </span><span color='#9acd32'>${wlan0 down_kb} </span>")

wifiwidget = widget({ type = "textbox" })
	vicious.register(wifiwidget, vicious.widgets.wifi,
	function (widget, args)
		if args["{link}"] == 0 then
			netwdownwidget.visible = false
			netwupwidget.visible = false
			return ""
		else
			netwdownwidget.visible = true
			netwupwidget.visible = true
			return "<span color='#60801f'>wlan </span><span color='#9acd32'>" .. string.format("%s [%i%%]", args["{ssid}"], args["{link}"]/70*100) .. " </span>"
		end
	end, refresh_delay, "wlan0" )

-- Battery widget
batwidget = widget({ type = "textbox" })
	vicious.register(batwidget, vicious.widgets.bat,
	function (widget, args)
		if  args[2] >= 75 and args[2] < 95 then
			return "<span color='#60801f'>bat </span><span color='#9acd32'>" .. args[2] .. "% </span>"
		elseif args[2] >= 50 and args[2] < 75 then
			return "<span color='#be6e00'>bat </span><span color='#d79b1e'>" .. args[2] .. "% </span>"
		elseif args[2] >= 20 and args[2] < 50 then
			return "<span color='#b23535'>bat </span><span color='#ff4b4b'>" .. args[2] .. "% </span>"
		elseif args[2] < 20 and args[1] == "-" then
			naughty.notify({ title = "Battery Warning", text = "Battery low! "..args[2].."% left!\nBetter get some power, or ... ", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "<span color='#b23535'>bat </span><span color='#ff4b4b'>" .. args[2] .. "% </span>"
		elseif args[2] < 20 then 
			return "<span color='#b23535'>bat </span><span color='#ff4b4b'>" .. args[2] .. "% </span>"
		else
			return "<span color='#60801f'>bat </span><span color='#9acd32'>" .. args[2] .. "% </span>"
		end
	end, 23, "BAT1"	)

-- Volume widget
volwidget = widget({ type = "textbox" })
	vicious.register(volwidget, vicious.widgets.volume,
		function (widget, args)
			if args[1] == 0 or args[2] == "♩" then
				return "<span color='#60801f'>vol </span><span color='#ff4b4b'>mute</span>" 
			else
				return "<span color='#60801f'>vol </span><span color='#9acd32'>" .. args[1] .. "% </span>"
			end
		end, 2, "Master" )
	volwidget:buttons(
		awful.util.table.join(
			awful.button({ }, 1, function () awful.util.spawn("amixer -q sset Master toggle")   end),
			awful.button({ }, 4, function () awful.util.spawn("amixer -q sset Master 2dB+", false) end),
			awful.button({ }, 5, function () awful.util.spawn("amixer -q sset Master 2dB-", false) end)
		)
	)

-- WIDGETS BOTTOM LEFT
-- MPD widget
mpdwidget = widget({ type = 'textbox' })
vicious.register(mpdwidget, vicious.widgets.mpd,
	function (widget, args)
		if args["{state}"] == "Stop" then
			return ""
		elseif args["{state}"] == "Play" then
			return "<span color='#60801f'>mpd </span><span color='#9acd32'>" .. args["{Artist}"] .. " - " .. args["{Album}"] .. " - " .. args["{Title}"] .. "</span>"
		elseif args["{state}"] == "Pause" then
			return "<span color='#60801f'>mpd </span><span color='#d79b1e'>paused</span>"
		end
	end)
	mpdwidget:buttons(
		awful.util.table.join(
			awful.button({}, 1, function () awful.util.spawn("mpc toggle", false) end),
			awful.button({}, 4, function () awful.util.spawn("mpc prev", false) end),
			awful.button({}, 5, function () awful.util.spawn("mpc next", false) end)
		)
	)

-- SYSTRAY
mysystray = widget({ type = "systray" })

-- WIBOXES
mywibox = {}
infobox = {}
mypromptbox = {}
-- taglist
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
	awful.button({ }, 1, awful.tag.viewonly),
	awful.button({ modkey }, 1, awful.client.movetotag),
	awful.button({ }, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, awful.client.toggletag),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev)
	)
shifty.taglist = mytaglist
-- tasklist
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
	awful.button({ }, 1, function (c)
		if not c:isvisible() then
			awful.tag.viewonly(c:tags()[1])
		end
		client.focus = c
		c:raise()
	end),
	awful.button({ }, 3, function ()
		if instance then
			instance:hide()
			instance = nil
		else
			instance = awful.menu.clients({ width=250 })
		end
	end),
	awful.button({ }, 4, function ()
		awful.client.focus.byidx(1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.button({ }, 5, function ()
		awful.client.focus.byidx(-1)
		if client.focus then
			client.focus:raise()
		end
	end)
)
-- Create for each screen
for s = 1, screen.count() do
	mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
	mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)
	mytasklist[s] = awful.widget.tasklist(function(c)
		return awful.widget.tasklist.label.currenttags(c, s)
	end, mytasklist.buttons)
	-- top box
	mywibox[s] = awful.wibox({ position = "top", height = "14", screen = s })
	mywibox[s].widgets = { {
		mytaglist[s], spacerwidget,
		mypromptbox[s],
		layout = awful.widget.layout.horizontal.leftright },
		clockwidget,
		calwidget,
		s == 1 and mysystray or nil,
		mytasklist[s],
		layout = awful.widget.layout.horizontal.rightleft }
	-- bottom box
	infobox[s] = awful.wibox({ position = "bottom", height = "14", screen = s })
	infobox[s].widgets = { {
		mpdwidget, ["layout"] = awful.widget.layout.horizontal.leftright },
		volwidget,
		batwidget,
		neteupwidget, netedownwidget, netwidget,
		netwupwidget, netwdownwidget, wifiwidget,
		fshwidget, fsrwidget,
		memwidget,
		tempwidget,
		cputwidget,
		layout = awful.widget.layout.horizontal.rightleft }
end

-- BINDINGS
-- Mouse bindings
root.buttons(awful.util.table.join(
	awful.button({ }, 3, function () mainmenu:toggle() end),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev))
)

-- Key bindings
-- Global
globalkeys = awful.util.table.join(
	-- Tags
	awful.key({ modkey,           }, "Prior",                awful.tag.viewprev       ),
	awful.key({ modkey,           }, "Next",                 awful.tag.viewnext       ),
	awful.key({ modkey, "Shift"   }, "Prior",                shifty.shift_prev        ),
	awful.key({ modkey, "Shift"   }, "Next",                 shifty.shift_next        ),
	awful.key({ modkey            }, "a",                    function() shifty.add({ rel_index = 1 }) end ),
	awful.key({ modkey, "Shift"   }, "a",                    function() shifty.add({ rel_index = 1, nopopup = true }) end ),
	awful.key({ modkey            }, "z",                    shifty.del ),
	awful.key({ modkey,           }, "Escape",               awful.tag.history.restore),
	awful.key({ modkey,           }, "Right",                function ()
		awful.client.focus.byidx( 1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey,           }, "Left",                 function ()
		awful.client.focus.byidx(-1)
		if client.focus then
			client.focus:raise()
		end
	end),

	-- Programs
	-- launchers
	awful.key({ modkey,           }, "w",                    function () mainmenu:show({keygrabber=true}) end),
	awful.key({ modkey,           }, "p",                    function () awful.util.spawn("dmenu_run -b -fn 'terminus' -nb '#1a1918' -nf '#9acd32' -sb '#4c4b49' -sf '#9acd32'") end),
	awful.key({ modkey,           }, "Tab",                  function () awful.util.spawn(terminal) end),
	awful.key({ modkey, "Shift"   }, "Tab",                  function () awful.util.spawn(terminal .. " -e su") end),
	-- miscellaneous
	awful.key({                   }, "Print",                function () awful.util.spawn("scrot -b") end),
	awful.key({                   }, "XF86Calculator",       function () awful.util.spawn("speedcrunch") end),
	awful.key({ modkey, "Shift"   }, "x",                    function () awful.util.spawn("xkill") end),
	awful.key({ modkey, "Shift"   }, "l",                    function () awful.util.spawn(terminal .. " -e xscreensaver-command --lock") end),
	awful.key({ modkey, "Control", "Shift" }, "r",           rodentbane.start),
	-- volume + mpd
	awful.key({                   }, "XF86AudioLowerVolume", function () awful.util.spawn("amixer -q sset Master 2dB-") end),
	awful.key({                   }, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer -q sset Master 2dB+") end),
	awful.key({                   }, "XF86AudioStop",        function () awful.util.spawn("mpc stop") end),
	awful.key({                   }, "XF86AudioPlay",        function () awful.util.spawn("mpc toggle") end),
	awful.key({                   }, "XF86AudioNext",        function () awful.util.spawn("mpc next") end),
	awful.key({                   }, "XF86AudioPrev",        function () awful.util.spawn("mpc prev") end),
	awful.key({                   }, "XF86AudioMute",        function () awful.util.spawn("amixer -q sset Master toggle") end),
	awful.key({ modkey,           }, "m",                    function () awful.util.spawn(terminal .. " -e ncmpcpp") end),
	-- web
	awful.key({                   }, "XF86HomePage",         function () awful.util.spawn("firefox") end),
	awful.key({                   }, "XF86Mail",             function () awful.util.spawn(terminal .. " -e mutt") end),
	awful.key({ modkey,           }, "i",                    function () awful.util.spawn(terminal .. " -e irssi") end),
	awful.key({ modkey,           }, "d",                    function () awful.util.spawn(terminal .. " -e wicd-curses") end),
	awful.key({ modkey, "Shift"   }, "d",                    function () awful.util.spawn(terminal .. " -e sudo wvdial optus") end),
	-- file managers
	awful.key({ modkey,           }, "r",                    function () awful.util.spawn(terminal .. " -e ranger") end),
	awful.key({ modkey,           }, "t",                    function () awful.util.spawn("thunar") end),

	-- Layouts
	awful.key({ modkey, "Shift"   }, "Right",                function () awful.client.swap.byidx(  1) end),
	awful.key({ modkey, "Shift"   }, "Left",                 function () awful.client.swap.byidx( -1) end),
	awful.key({ modkey, "Control" }, "Right",                function () awful.screen.focus_relative( 1) end),
	awful.key({ modkey, "Control" }, "Left",                 function () awful.screen.focus_relative(-1) end),
	awful.key({ modkey,           }, "u",                    awful.client.urgent.jumpto),

	-- Awesome
	awful.key({ modkey, "Control" }, "r",                    awesome.restart),
	awful.key({ modkey, "Shift"   }, "q",                    awesome.quit),
	awful.key({ modkey,           }, "space",                function () awful.layout.inc(layouts,  1) end),
	awful.key({ modkey, "Shift"   }, "space",                function () awful.layout.inc(layouts, -1) end),

	-- Prompts
	awful.key({ modkey, "Shift"   }, "r",                    function () mypromptbox[mouse.screen]:run() end),
	awful.key({ modkey, "Shift"   }, "x",                    function ()
		awful.prompt.run({ prompt = "Run Lua code: " },
		mypromptbox[mouse.screen].widget,
		awful.prompt.run({ prompt = "Run Lua code: " },
		mypromptbox[mouse.screen].widget,
		awful.util.eval, nil,
		awful.util.getdir("cache") .. "/history_eval"))
	end)
)

-- Clients
clientkeys = awful.util.table.join(
	awful.key({ modkey,           }, "o",                    function (c) c.fullscreen = not c.fullscreen  end),
	awful.key({ modkey, "Shift"   }, "c",                    function (c) c:kill() end),
	awful.key({ modkey, "Control" }, "space",                awful.client.floating.toggle ),
	awful.key({ modkey, "Control" }, "Return",               function (c) c:swap(awful.client.getmaster()) end),
	awful.key({ modkey, "Control" }, "o",                    awful.client.movetoscreen ),
	awful.key({ modkey,           }, "n",                    function (c) c.minimized = not c.minimized end),
	awful.key({ modkey, "Shift"   }, "n",                    function ()
		local allclients = client.get(mouse.screen)
		for _,c in ipairs(allclients) do
			if c.minimized and c:tags()[mouse.screen] == awful.tag.selected(mouse.screen) then
				c.minimized = false client.focus = c c:raise()
				return
			end
		end end),
	awful.key({ modkey,           }, "f",                    function (c)
		c.maximized_horizontal = not c.maximized_horizontal
		c.maximized_vertical   = not c.maximized_vertical
	end)
)

-- WORKSPACES
-- shifty:
for i=1,9 do
	globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey }, i, function ()
		local t = awful.tag.viewonly(shifty.getpos(i))
	end))
	globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Control" }, i, function ()
		local t = shifty.getpos(i)
		t.selected = not t.selected
	end))
	globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Control", "Shift" }, i, function ()
		if client.focus then
			awful.client.toggletag(shifty.getpos(i))
		end
	end))
	globalkeys = awful.util.table.join(globalkeys, awful.key({ modkey, "Shift" }, i, function ()
		if client.focus then
			local t = shifty.getpos(i)
			awful.client.movetotag(t)
			awful.tag.viewonly(t)
		end
	end))
end

-- Set keys
root.keys(globalkeys)
shifty.config.globalkeys = globalkeys
shifty.config.clientkeys = clientkeys

-- SIGNALS
client.add_signal("manage", function (c, startup)

	if not startup then
	if not c.size_hints.user_position and not c.size_hints.program_position then
		awful.placement.no_overlap(c)
		awful.placement.no_offscreen(c)
	end
	end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
