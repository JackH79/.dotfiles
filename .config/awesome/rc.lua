require("awful")
require("awful.autofocus")
require("beautiful")
require("naughty")
require("vicious")
require("rodentbane")
require("shifty")
require("calendar2")

-- THEME
beautiful.init("/home/jack/.config/awesome/themes/jack/theme.lua")

-- COLOURS
coldef  = "</span>"
colblk  = "<span color='#1a1a1a'>"
colred  = "<span color='#b23535'>"
colgre  = "<span color='#60801f'>"
colyel  = "<span color='#be6e00'>"
colblu  = "<span color='#1f6080'>"
colmag  = "<span color='#8f46b2'>"
colcya  = "<span color='#73afb4'>"
colwhi  = "<span color='#b2b2b2'>"
colbblk = "<span color='#333333'>"
colbred = "<span color='#ff4b4b'>"
colbgre = "<span color='#9bcd32'>"
colbyel = "<span color='#d79b1e'>"
colbblu = "<span color='#329bcd'>"
colbmag = "<span color='#cd64ff'>"
colbcya = "<span color='#9bcdff'>"
colbwhi = "<span color='#ffffff'>"

-- DEFAULTS
terminal = "urxvtc"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
browser = "firefox"
modkey = "Mod4"
altkey = "Mod1"

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
	["1-term"]   = { init = true, position = 1, layout = awful.layout.suit.fair.horizontal },
	["2-web"]    = { position = 2, layout = awful.layout.suit.max                          },
	["3-mail"]   = { position = 3, layout = awful.layout.suit.max                          },
	["4-office"] = { position = 4, layout = awful.layout.suit.tile.bottom                  },
	["5-pdf"]    = { position = 5, layout = awful.layout.suit.tile.bottom                  },
	["6-gimp"]   = { position = 6, layout = awful.layout.suit.floating, spawn = "gimp"     },
	["7-video"]  = { position = 7, layout = awful.layout.suit.floating                     },
	["8-music"]  = { position = 8, layout = awful.layout.suit.tile.bottom                  },
	["9-irc"]    = { position = 9, layout = awful.layout.suit.max                          },
	["torrent"]  = { layout = awful.layout.suit.max                                        },
	["picture"]  = { layout = awful.layout.suit.max                                        },
	["dial"]     = { layout = awful.layout.suit.max                                        },
	["rss"]      = { layout = awful.layout.suit.max                                        },
}

-- shifty: tags matching and client rules
shifty.config.apps = {
	{ match = { "Firefox", "luakit"                  }, tag = "2-web",                                               },
	{ match = { "mutt", "Lanikai"                    }, tag = "3-mail",                                              },
	{ match = { "VCLSalFrame", "abiword", "Gnumeric" }, tag = "4-office",                                            },
	{ match = { "Zathura", "Epdfview"                }, tag = "5-pdf",                                               },
	{ match = { "Gimp"                               }, tag = "6-gimp",                                              },
	{ match = { "gimp%-image%-window"                }, geometry = {175,15,930,770}, border_width = 0                },
	{ match = { "^gimp%-toolbox$"                    }, geometry = {0,15,175,770}, slave = true, border_width = 0    },
	{ match = { "^gimp%-dock$"                       }, geometry = {1105,15,175,770}, slave = true, border_width = 0 },
	{ match = { "MPlayer", "Vlc", "Audacity"         }, tag = "7-video",                                             },
	{ match = { "MPlayer"                            }, geometry = {0,15,nil,nil}, float = true                      },
	{ match = { "ncmpcpp"                            }, tag = "8-music",                                             },
	{ match = { "irssi"                              }, tag = "9-irc",                                               },
	{ match = { "rtorrent"                           }, tag = "torrent",                                             },
	{ match = { "Mirage", "Geeqie", "sxiv"           }, tag = "picture",                                             },
	{ match = { "wicd%-curses", "wvdial"             }, tag = "dial",                                                },
	{ match = { "canto"                              }, tag = "rss",                                                 },
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

-- MENU
networkmenu = {
	{ "firefox",    "firefox" },
	{ "mutt",        terminal .. " -e mutt" },
	{ "irssi",       terminal .. " -e irssi" },
	{ "wicd",        terminal .. " -e wicd-curses" },
	{ "wvdial",      terminal .. " -e sudo wvdial optus" },
	{ "rtorrent",    terminal .. " -e rtorrent" }
}

officemenu = {
	{ "writer",      "libreoffice -writer" },
	{ "calc",        "libreoffice -calc" },
	{ "impress",     "libreoffice -impress" },
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
	{ "audacity",    "audacity" },
	{ "avidemux",    "avidemux2_gtk" }
}

utilitiesmenu = {
	{ "virtualbox",  "VirtualBox" },
	{ "xfburn",      "xfburn" },
	{ "truecrypt",   "truecrypt" }
}

monitormenu = {
	{ "scroff",      "xrandr --output LVDS --off" },
	{ "scron",       "xrandr --output LVDS --auto" },
	{ "scrmax",      "xrandr --output VGA-0 --preferred" }
}

systemmenu = {
	{ "monitor",     monitormenu },
	{ "htop",        terminal .. " -e htop" },
	{ "kill",        "xkill" }
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
calwidget = widget({ type = "textbox" })
	function dayth()
		local osd = os.date("%d")
		if osd == "01" or osd == "21" or osd == "31" then
			return "<span font='proggytiny 7'><sup>st</sup></span>"
		elseif osd == "02" or osd == "22" then
			return "<span font='proggytiny 7'><sup>nd</sup></span>"
		elseif osd == "03" or osd == "23" then
			return "<span font='proggytiny 7'><sup>rd</sup></span>"
		else
			return "<span font='proggytiny 7'><sup>th</sup></span>"
		end
	end
	vicious.register(calwidget, vicious.widgets.date, "" .. colyel .. " %a, %e" .. dayth() .. " %B" .. coldef .. " ")
	calendar2.addCalendarToWidget(calwidget, "" .. colyel .. "%s" .. coldef .. "")

-- Clock widget
clockwidget = widget({ type = "textbox" })
	vicious.register(clockwidget, vicious.widgets.date, "" .. colbyel .. "%l:%M%P" .. coldef .. "")
	function cal_gett()
		local fp = io.popen("remind /home/jack/.reminders")
		local rem = fp:read("*a")
		fp:close()
			rem = string.gsub(rem, "\027%[0m", "</span>")
			rem = string.gsub(rem, "\027%[0;30m", "<span color='#1a1a1a'>") --black
			rem = string.gsub(rem, "\027%[0;31m", "<span color='#b23535'>") --red
			rem = string.gsub(rem, "\027%[0;32m", "<span color='#60801f'>") --green
			rem = string.gsub(rem, "\027%[0;33m", "<span color='#be6e00'>") --yellow
			rem = string.gsub(rem, "\027%[0;34m", "<span color='#1f6080'>") --blue
			rem = string.gsub(rem, "\027%[0;35m", "<span color='#8f46b2'>") --magenta
			rem = string.gsub(rem, "\027%[0;36m", "<span color='#73afb4'>") --cyan
			rem = string.gsub(rem, "\027%[0;37m", "<span color='#b2b2b2'>") --white
			rem = string.gsub(rem, "\027%[1;30m", "<span color='#4c4c4c'>") --br-black
			rem = string.gsub(rem, "\027%[1;31m", "<span color='#ff4b4b'>") --br-red
			rem = string.gsub(rem, "\027%[1;32m", "<span color='#9bcd32'>") --br-green
			rem = string.gsub(rem, "\027%[1;33m", "<span color='#d79b1e'>") --br-yellow
			rem = string.gsub(rem, "\027%[1;34m", "<span color='#329bcd'>") --br-blue
			rem = string.gsub(rem, "\027%[1;35m", "<span color='#cd64ff'>") --br-magenta
			rem = string.gsub(rem, "\027%[1;36m", "<span color='#9bcdff'>") --br-cyan
			rem = string.gsub(rem, "\027%[1;37m", "<span color='#ffffff'>") --br-white
			return rem
	end
	clockwidget:add_signal('mouse::enter', function () cal_remt = { naughty.notify({ text = cal_gett(), border_color = "#1a1a1a", timeout = 0, hover_timeout = 0.5 }) } end)
	clockwidget:add_signal('mouse::leave', function () naughty.destroy(cal_remt[1]) end)

	local function time_cet()
		local time = os.time()
		time2 = time - (8*3600)
		local new_time = os.date("%a, %I:%M%P", time2)
		return new_time
	end
	local function time_utc()
		local time = os.time()
		time2 = time - (9*3600)
		local new_time = os.date("%a, %I:%M%P", time2)
		return new_time
	end
	local function time_nzst()
		local time = os.time()
		time2 = time + (2*3600)
		local new_time = os.date("%a, %I:%M%P", time2)
		return new_time
	end
	local function time_ckt()
		local time = os.time()
		time2 = time - (20*3600)
		local new_time = os.date("%a, %I:%M%P", time2)
		return new_time
	end
	local function time_pst()
		local time = os.time()
		time2 = time - (17*3600)
		local new_time = os.date("%a, %I:%M%P", time2)
		return new_time
	end
	local function time_est()
		local time = os.time()
		time2 = time - (14*3600)
		local new_time = os.date("%a, %I:%M%P", time2)
		return new_time
	end

-- Weather widget
weatherwidget = widget({ type = "textbox" })
	vicious.register(weatherwidget, vicious.widgets.weather,
	function (widget, args)
		if args["{tempc}"] == "N/A" then
			return ""
		else
--			weatherwidget:add_signal('mouse::enter', function () weather_n = { naughty.notify({ title = "" .. colblu .. "───────────── Weather ─────────────" .. coldef .. "", text = "" .. colbblu .. "Wind    : " .. args["{windkmh}"] .. " km/h " .. args["{wind}"] .. "\nHumidity: " .. args["{humid}"] .. " %\nPressure: " .. args["{press}"] .. " hPa" .. coldef .. "", border_color = "#1a1a1a" }) } end)
--			weatherwidget:add_signal('mouse::leave', function () naughty.destroy(weather_n[1]) end)
			return "" .. colblu .. " weather " .. coldef .. colbblu .. string.lower(args["{sky}"]) .. ", " .. args["{tempc}"] .. "°C" .. coldef .. ""
		end
	end, 1200, "YBTL" )
weatherwidget:buttons(awful.util.table.join(awful.button({}, 3, function () awful.util.spawn ( browser .. " http://www.weatherzone.com.au/qld/lower-burdekin/townsville") end)))

-- WIDGETS BOTTOM RIGHT
-- CPU widget
cputwidget = widget({ type = "textbox" })
	vicious.register(cputwidget, vicious.widgets.cpu,
	function (widget, args)
		if  args[1] == 50 then
			return "" .. colyel .. "cpu " .. coldef .. colbyel .. args[1] .. "% " .. coldef .. ""
		elseif args[1] >= 50 then
			return "" .. colred .. "cpu " .. coldef .. colbred .. args[1] .. "% " .. coldef .. ""
		else
			return "" .. colblk .. "cpu " .. coldef .. colbblk .. args[1] .. "% " .. coldef .. ""
		end
	end )
cputwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( terminal .. " -e htop --sort-key PERCENT_CPU") end ) ) )

-- CPU temp widget
tempwidget = widget({ type = "textbox" })
	vicious.register(tempwidget, vicious.widgets.thermal,
	function (widget, args)
		if  args[1] >= 65 and args[1] < 75 then
			return "" .. colyel .. "temp " .. coldef .. colbyel .. args[1] .. "°C " .. coldef .. ""
		elseif args[1] >= 75 and args[1] < 80 then
			return "" .. colred .. "temp " .. coldef .. colbred .. args[1] .. "°C " .. coldef .. ""
		elseif args[1] > 80 then
			naughty.notify({ title = "Temperature Warning", text = "Running hot! " .. args[1] .. "°C!\nTake it easy.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "" .. colred .. "temp " .. coldef .. colbred .. args[1] .. "°C " .. coldef .. "" 
		else
			return "" .. colblk .. "temp " .. coldef .. colbblk .. args[1] .. "°C " .. coldef .. ""
		end
	end, 19, "thermal_zone0" )

-- Ram widget
memwidget = widget({ type = "textbox" })
	vicious.cache(vicious.widgets.mem)
	vicious.register(memwidget, vicious.widgets.mem, "" .. colblk .. "ram " .. coldef .. colbblk .. "$1% ($2 MiB) " .. coldef .. "", 13)

-- Filesystem widgets
-- root
fsrwidget = widget({ type = "textbox" })
	vicious.register(fsrwidget, vicious.widgets.fs,
	function (widget, args)
		if  args["{/ used_p}"] >= 93 and args["{/ used_p}"] < 97 then
			return "" .. colyel .. "/ " .. coldef .. colbyel .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/ used_p}"] >= 97 and args["{/ used_p}"] < 99 then
			return "" .. colred .. "/ " .. coldef .. colbred .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/ used_p}"] >= 99 and args["{/ used_p}"] <= 100 then
			naughty.notify({ title = "Hard drive Warning", text = "No space left on root!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "" .. colred .. "/ " .. coldef .. colbred .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. "" 
		else
			return "" .. colblk .. "/ " .. coldef .. colbblk .. args["{/ used_p}"] .. "% (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
		end
	end, 620)
-- /home
fshwidget = widget({ type = "textbox" })
	vicious.register(fshwidget, vicious.widgets.fs,
	function (widget, args)
		if  args["{/home used_p}"] >= 97 and args["{/home used_p}"] < 98 then
			return "" .. colyel .. "/home " .. coldef .. colbyel .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/home used_p}"] >= 98 and args["{/home used_p}"] < 99 then
			return "" .. colred .. "/home " .. coldef .. colbred .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/home used_p}"] >= 99 and args["{/home used_p}"] <= 100 then
			naughty.notify({ title = "Hard drive Warning", text = "No space left on /home!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "" .. colred .. "/home " .. coldef .. colbred .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. "" 
		else
			return "" .. colblk .. "/home " .. coldef .. colbblk .. args["{/home used_p}"] .. "% (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
		end
	end, 620)

-- Net widgets
-- eth
neteupwidget = widget({ type = "textbox" })
	vicious.cache(vicious.widgets.net)
	vicious.register(neteupwidget, vicious.widgets.net, "" .. colblk .. "up " .. coldef .. colbblk .. "${eth0 up_kb} " .. coldef .. "")

netedownwidget = widget({ type = "textbox" })
	vicious.register(netedownwidget, vicious.widgets.net, "" .. colblk .. "down " ..coldef .. colbblk .. "${eth0 down_kb} " .. coldef .. "")

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
			return "" .. colblk .. "eth0 " .. coldef .. colbblk .. args["{ip}"] .. coldef .. " "
		end
	end, refresh_delay, "eth0")

-- wlan
netwupwidget = widget({ type = "textbox" })
	vicious.register(netwupwidget, vicious.widgets.net, "" .. colblk .. "up " .. coldef .. colbblk .. "${wlan0 up_kb} " .. coldef .. "")

netwdownwidget = widget({ type = "textbox" })
	vicious.register(netwdownwidget, vicious.widgets.net, "" .. colblk .. "down " .. coldef .. colbblk .. "${wlan0 down_kb} " .. coldef .. "")

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
			return "" .. colblk .. "wlan " .. coldef .. colbblk .. string.format("%s [%i%%]", args["{ssid}"], args["{link}"]/70*100) .. coldef .. " "
		end
	end, refresh_delay, "wlan0" )

-- Battery widget
batwidget = widget({ type = "textbox" })
	vicious.register(batwidget, vicious.widgets.bat,
	function (widget, args)
		if args[2] >= 50 and args[2] < 75 then
			return "" .. colyel .. "bat " .. coldef .. colbyel .. args[2] .. "% " .. coldef .. ""
		elseif args[2] >= 20 and args[2] < 50 then
			return "" .. colred .. "bat " .. coldef .. colbred .. args[2] .. "% " .. coldef .. ""
		elseif args[2] < 20 and args[1] == "-" then
			naughty.notify({ title = "Battery Warning", text = "Battery low! "..args[2].."% left!\nBetter get some power.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "" .. colred .. "bat " .. coldef .. colbred .. args[2] .. "% " .. coldef .. ""
		elseif args[2] < 20 then 
			return "" .. colred .. "bat " .. coldef .. colbred .. args[2] .. "% " .. coldef .. ""
		else
			return "" .. colblk .. "bat " .. coldef .. colbblk .. args[2] .. "% " .. coldef .. ""
		end
	end, 23, "BAT1"	)

-- Volume widget
volwidget = widget({ type = "textbox" })
	vicious.register(volwidget, vicious.widgets.volume,
		function (widget, args)
			if args[1] == 0 or args[2] == "♩" then
				return "" .. colblk .. "vol " .. coldef .. colbred .. "mute" .. coldef .. "" 
			else
				return "" .. colblk .. "vol " .. coldef .. colbblk .. args[1] .. "% " .. coldef .. ""
			end
		end, 2, "Master" )
	volwidget:buttons(
		awful.util.table.join(
			awful.button({ }, 1, function () awful.util.spawn("amixer -q sset Master toggle")   end),
			awful.button({ }, 3, function () awful.util.spawn( terminal .. " -e alsamixer")   end),
			awful.button({ }, 4, function () awful.util.spawn("amixer -q sset Master 2dB+") end),
			awful.button({ }, 5, function () awful.util.spawn("amixer -q sset Master 2dB-") end)
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
				return "" .. colblk .. "mpd " .. coldef .. colbblk .. args["{Artist}"] .. " - " .. args["{Album}"] .. " - " .. args["{Title}"] .. coldef .. ""
			elseif args["{state}"] == "Pause" then
				return "" .. colblk .. "mpd " .. coldef .. colbyel .. "paused" .. coldef .. ""
			end
		end)
	mpdwidget:buttons(
		awful.util.table.join(
			awful.button({}, 1, function () awful.util.spawn("mpc toggle", false) end),
			awful.button({}, 2, function () awful.util.spawn( terminal .. " -e ncmpcpp")   end),
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
--	mytasklist[s] = awful.widget.tasklist(
--		function(c)
--			return awful.widget.tasklist.label.currenttags(c, s)
--	end,
--	mytasklist.buttons
--	)
	mytasklist[s] = awful.widget.tasklist(
		function(c)
			local text, bg, status_image, icon = awful.widget.tasklist.label.currenttags(c, s)
			return text, bg, status_image, nil
		end,
		mytasklist.buttons
	)
	-- top box
	mywibox[s] = awful.wibox({ position = "top", height = "14", screen = s })
	mywibox[s].widgets = { {
		mytaglist[s], spacerwidget,
		mypromptbox[s], layout = awful.widget.layout.horizontal.leftright },
		clockwidget,
		calwidget,
		weatherwidget,
		spacerwidget,
		s == 1 and mysystray or nil,
		mytasklist[s],
		layout = awful.widget.layout.horizontal.rightleft }
	-- bottom box
	infobox[s] = awful.wibox({ position = "bottom", height = "14", screen = s })
	infobox[s].widgets = { {
		mpdwidget, layout = awful.widget.layout.horizontal.leftright },
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
	awful.key({ modkey,           }, "l",                     function () awful.tag.incmwfact( 0.05) end),
	awful.key({ modkey,           }, "h",                     function () awful.tag.incmwfact(-0.05) end),

	-- Programs
	-- launchers
	awful.key({ modkey,           }, "w",                     function () mainmenu:show({keygrabber=true}) end),
	awful.key({ modkey,           }, "p",                     function () awful.util.spawn("dmenu_run -fn 'terminus' -nb '#000000' -nf '#4c4c4c' -sb '#000000' -sf '#be6e00'") end),
	awful.key({ modkey, "Shift"   }, "Return",                function () awful.util.spawn(terminal) end),
	-- miscellaneous
	awful.key({                   }, "Print",                 function () awful.util.spawn("scrot -b") end),
	awful.key({                   }, "XF86Calculator",        function () awful.util.spawn("speedcrunch") end),
	awful.key({ modkey, "Shift"   }, "x",                     function () awful.util.spawn("xkill") end),
	awful.key({ modkey, "Shift"   }, "l",                     function () awful.util.spawn(terminal .. " -e xscreensaver-command --lock") end),
	awful.key({ modkey, "Control", "Shift" }, "r",            rodentbane.start),         
	awful.key({ modkey            }, "F8",                    function () awful.util.spawn("truecrypt") end),
	awful.key({ modkey, "Control" }, "t",                     function () naughty.notify({ text = "" .. colbyel .. "────────────────────────────────── World Clock ─────────────────────────────────" .. coldef .. colblk .."\nOOO      OOOO             OO                                     OOOOO  OOOOOOOO\nOO " .. coldef .. colyel .. "London" .. coldef .. colblk .. "             O  OOOOOOOOOOO  O                    OOOO O OO O    OOOOOO\n  O" .. coldef .. colbyel .. time_utc() .. coldef .. colblk .. "OO OO OOOOOOOOOOOOOOOOOOOOOOOOO  OOOOOOOOOOOOOOOOOOOO OO    OO\n      OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO    O        OOO  OOOOOOOOOO   OOO\n    OOOOO" .. coldef .. colyel .. "Düsseldorf" .. coldef .. colblk .. "OOOOOOOOOOOOOOOOOO               " .. coldef .. colyel .. "Vancouver" .. coldef .. colblk .. "OOOOOOOOOO\n  OOOOO  " .. coldef .. colbyel .. time_cet() .. coldef .. colblk .. "OOOOOOOOOOOOOOOO O             " .. coldef .. colbyel .. time_pst() .. coldef .. colblk .. "OOO\n       OO      OOOOOOOOOOOOOOOOOOO O O                     OOOOOOOO" .. coldef .. colyel .. "Woods Hole" .. coldef .. colblk .. "\n     OOOOOOOOOOOOOOOOOOOOOOOOOOOOO                           OOOO  " .. coldef .. colbyel .. time_est() .. coldef .. colblk .. "\n    OOOOOOOOOOOO OOOO  OOOO OOOOO                               OO\n   OOOOOOOOOOOOO O      O    OO                                   OO\n     OOOOOOOOOOOOO                O                                  OOOO\n         OOOOO O              O OOO                                 OOOOOOO\n          OOOOOO               O      OO          " .. coldef .. colyel .. "Rarotonga" .. coldef .. colblk .. "        OOOOOOOOO\n          OOOOOO                    O O           " .. coldef .. colbyel .. time_ckt() .. coldef .. colblk .. "     OOOOOOOO\n          OOOOO  O              OOOOOOOO                            OOOOOO\n           OOO                  OOOOOOOOO                            OOOO\n            O                         OO  " .. coldef .. colyel .. "Tauranga" .. coldef .. colblk .. "                   OOOO\n                                          " .. coldef .. colbyel .. time_nzst() .. coldef .. colblk .. "               OO\n                                                                     O" .. coldef .. "", border_color = "#1a1a1a", timeout = 20, hover_timeout = 0.5 }) end),
	awful.key({ modkey, "Control" }, "r",                     function () naughty.notify({ text = cal_gett(), border_color = "#1a1a1a", timeout = 20, hover_timeout = 0.5 }) end),
	-- volume + mpd
	awful.key({                   }, "XF86AudioLowerVolume",  function () awful.util.spawn("amixer -q sset Master 2dB-") end),
	awful.key({                   }, "XF86AudioRaiseVolume",  function () awful.util.spawn("amixer -q sset Master 2dB+") end),
	awful.key({                   }, "XF86AudioStop",         function () awful.util.spawn("mpc stop") end),
	awful.key({                   }, "XF86AudioPlay",         function () awful.util.spawn("mpc toggle") end),
	awful.key({                   }, "XF86AudioNext",         function () awful.util.spawn("mpc next") end),
	awful.key({                   }, "XF86AudioPrev",         function () awful.util.spawn("mpc prev") end),
	awful.key({                   }, "XF86AudioMute",         function () awful.util.spawn("amixer -q sset Master toggle") end),
	awful.key({ modkey,           }, "m",                     function () awful.util.spawn(terminal .. " -e ncmpcpp") end),
	-- office
	awful.key({ modkey,           }, "F2",                    function () awful.util.spawn("libreoffice -writer") end),
	awful.key({ modkey,           }, "F3",                    function () awful.util.spawn("libreoffice -calc") end),
	awful.key({ modkey,           }, "F4",                    function () awful.util.spawn("libreoffice -impress") end),
	awful.key({ modkey,           }, "a",                     function () awful.util.spawn("abiword") end),
	awful.key({ modkey,           }, "s",                     function () awful.util.spawn("gnumeric") end),
	-- web
	awful.key({                   }, "XF86HomePage",          function () awful.util.spawn("firefox") end),
	awful.key({ modkey            }, "XF86HomePage",          function () awful.util.spawn("luakit") end),
	awful.key({                   }, "XF86Mail",              function () awful.util.spawn(terminal .. " -e mutt") end),
	awful.key({ modkey,           }, "i",                     function () awful.util.spawn(terminal .. " -e irssi") end),
	awful.key({ modkey,           }, "d",                     function () awful.util.spawn(terminal .. " -e wicd-curses") end),
	awful.key({ modkey, "Shift"   }, "d",                     function () awful.util.spawn(terminal .. " -e sudo wvdial optus") end),
	awful.key({ modkey,           }, "F12",                   function () awful.util.spawn(terminal .. " -e rtorrent") end),
	awful.key({ modkey,           }, "c",                     function () awful.util.spawn(terminal .. " -e canto -u") end),
	-- file managers
	awful.key({ modkey,           }, "r",                     function () awful.util.spawn(terminal .. " -e ranger") end),
	awful.key({ modkey,           }, "t",                     function () awful.util.spawn("thunar") end),

	-- Layouts
	awful.key({ modkey, "Shift"   }, "Right",                 function () awful.client.swap.byidx(  1) end),
	awful.key({ modkey, "Shift"   }, "Left",                  function () awful.client.swap.byidx( -1) end),
	awful.key({ modkey, "Control" }, "Right",                 function () awful.screen.focus_relative( 1) end),
	awful.key({ modkey, "Control" }, "Left",                  function () awful.screen.focus_relative(-1) end),
	awful.key({ modkey,           }, "u",                     awful.client.urgent.jumpto),

	-- Awesome
--	awful.key({ modkey, "Control" }, "r",                     awesome.restart),
	awful.key({ modkey,           }, "space",                 function () awful.layout.inc(layouts,  1) end),
	awful.key({ modkey, "Shift"   }, "space",                 function () awful.layout.inc(layouts, -1) end),
	awful.key({ modkey,           }, "XF86PowerOff",          awesome.quit),
	awful.key({ modkey, "Shift"   }, "XF86PowerOff",          function () awful.util.spawn("reboot") end),
	awful.key({ modkey, "Control", "Shift" }, "XF86PowerOff", function () awful.util.spawn("shutdown") end),

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
				return end end end), awful.key({ modkey,
			}, "f",                    function (c)
				c.maximized_horizontal = not
				c.maximized_horizontal c.maximized_vertical   =
				not c.maximized_vertical end))

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
