require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
require("vicious")

beautiful.init("/usr/share/awesome/themes/jack2/theme.lua")

terminal = "urxvt"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

-- LAYOUTS
layouts = {
	awful.layout.suit.tile,          -- 1
	awful.layout.suit.tile.left,     -- 2
	awful.layout.suit.tile.bottom,   -- 3
	awful.layout.suit.tile.top,      -- 4
	awful.layout.suit.max,           -- 5
	awful.layout.suit.magnifier,     -- 6
	awful.layout.suit.floating,      -- 7
	awful.layout.suit.spiral.dwindle -- 8
}

tags = {}
for s = 1, screen.count() do
	tags[s] = awful.tag({ "1-def", "2-net", "3-off", "4-gra", "5-med", "6-tor |" }, s,
	{ layouts[3], layouts[5], layouts[3],
	layouts[3], layouts[3], layouts[1]
})
end

-- MENUES

awesomemenu = {
	{ "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
	{ "restart",     awesome.restart },
	{ "lock",        terminal .. " -e xscreensaver-command --lock" },
	{ "quit",        awesome.quit },
	{ "reboot",      terminal .. " -e reboot" },
	{ "shutdown",    terminal .. " -e shutdown" }
}

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
	{ "writer",      "soffice -writer" }, -- "env GTK2_RC_FILES=/usr/share/themes/Clearlooks/gtk-2.0/gtkrc soffice -writer" },
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

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon), menu = mainmenu })

--c.honorsizehints=false

-- WIDGETS

-- Spacer
spacer      = widget({ type = "textbox" })
spacer.text = "|"

-- Calendar widget
calwidget = awful.widget.textclock({ align = "right" }, "<span color='#d79b1e'>%a, %d %b </span>", 61)
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

calicon = widget({ type = "imagebox" })
	calicon.image = image("/home/jack/.config/awesome/icons/cal18.png")
	calicon:buttons(calwidget:buttons())

-- Clock widget
clockwidget = awful.widget.textclock({ align = "right" }, "<span color='#ff4b4b'>%l:%M%P</span> ", 59)
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
			rem = string.gsub(rem, "\027%[1;36m", "<span color='#9bcdff'>")
			rem = string.gsub(rem, "\027%[1;37m", "<span color='#ffffff'>")
		return rem
	end
	function cal_remt()
		naughty.notify { text = cal_gett(), timeout = 10, hover_timeout = 1 }
	end
	clockwidget:buttons(awful.util.table.join(awful.button({}, 1, cal_remt)))

clockicon = widget({ type = "imagebox" })
	clockicon.image = image("/home/jack/.config/awesome/icons/clock18.png")
	clockicon:buttons(clockwidget:buttons())

-- Memory widget
memwidget = widget({ type = "textbox" })
--	memwidget.width, memwidget.align = 100, 'right'
	vicious.enable_caching(vicious.widgets.mem)
	vicious.register(memwidget, vicious.widgets.mem, "<span color='#9acd32'>$1% ($2 MiB) </span>", 10)

memicon = widget({ type = "imagebox" })
	memicon.image = image("/home/jack/.config/awesome/icons/mem18.png")

-- CPU temp widget
tempwidget = widget({ type = "textbox" })
	vicious.register(tempwidget, vicious.widgets.thermal, "<span color='#9acd32'>$1°C </span>", 19, "thermal_zone0")

tempicon = widget({ type = "imagebox" })
	tempicon.image = image("/home/jack/.config/awesome/icons/temp18.png")

-- CPU widget
cputwidget = widget({ type = "textbox" })
	cputwidget.width, cputwidget.align = 30, 'right'
	vicious.register(cputwidget, vicious.widgets.cpu, "<span color='#9acd32'>$1%</span>") 

cpuicon = widget({ type = "imagebox" })
	cpuicon.image = image("/home/jack/.config/awesome/icons/cpu18.png")

-- CPU info widget
cpuinfowidget = widget({ type = "textbox" })
	vicious.register(cpuinfowidget, vicious.widgets.cpuinf, "<span color='#9acd32'> @ ${cpu0 ghz}GHz</span>")

-- FS widgets
fsrwidget = widget({ type = "textbox" })
	vicious.register(fsrwidget, vicious.widgets.fs, "<span color='#60801f'>/</span> <span color='#9acd32'>${/ used_p}% (${/ avail_gb} GiB avail)</span>", 1200)

fshwidget = widget({ type = "textbox" })
	vicious.register(fshwidget, vicious.widgets.fs, "<span color='#60801f'> /home</span> <span color='#9acd32'>${/home used_p}% (${/home avail_gb} GiB avail)</span>", 1200)

fsicon = widget({ type = "imagebox" })
	fsicon.image = image("/home/jack/.config/awesome/icons/disk18.png")

-- Net widgets
neteupwidget = widget({ type = "textbox" })
	vicious.enable_caching(vicious.widgets.net)
	vicious.register(neteupwidget, vicious.widgets.net, "<span color='#9acd32'>${eth0 up_kb}</span>")

netedownwidget = widget({ type = "textbox" })
	vicious.register(netedownwidget, vicious.widgets.net, "<span color='#9acd32'>${eth0 down_kb}</span>")

netwupwidget = widget({ type = "textbox" })
	vicious.register(netwupwidget, vicious.widgets.net, "<span color='#9acd32'>${wlan0 up_kb}</span>")

netwdownwidget = widget({ type = "textbox" })
	vicious.register(netwdownwidget, vicious.widgets.net, "<span color='#9acd32'>${wlan0 down_kb}</span>")

wifiicon = widget({ type = "imagebox" })
	wifiicon.image = image("/home/jack/.config/awesome/icons/wifi18.png")

neticon = widget({ type = "imagebox" })
	neticon.image = image("/home/jack/.config/awesome/icons/net18.png")

upeicon = widget({ type = "imagebox" })
	upeicon.image = image("/home/jack/.config/awesome/icons/up18.png")

downeicon = widget({ type = "imagebox" })
	downeicon.image = image("/home/jack/.config/awesome/icons/down18.png")

upwicon = widget({ type = "imagebox" })
	upwicon.image = image("/home/jack/.config/awesome/icons/up18.png")

downwicon = widget({ type = "imagebox" })
	downwicon.image = image("/home/jack/.config/awesome/icons/down18.png")

wifispacer = widget({ type = "textbox" })
	wifispacer.text = "|"

netspacer = widget({ type = "textbox" })
	netspacer.text = "|"

wifiwidget = widget({ type = "textbox" })
	vicious.register(wifiwidget, vicious.widgets.wifi,
	function (widget, args)
		if args["{link}"] == 0 then
			wifiicon.visible = false
			netwdownwidget.visible = false
			netwupwidget.visible = false
			upwicon.visible = false
			downwicon.visible = false
			return ""
		else
			wifiicon.visible = true
			netwdownwidget.visible = true
			netwupwidget.visible = true
			upwicon.visible = true
			downwicon.visible = true
			return "<span color='#9acd32'>" .. string.format("%s [%i%%]", args["{ssid}"], args["{link}"]/70*100) .. "</span>"
		end
	end, refresh_delay, "wlan0")

netwidget = widget({ type = "textbox" })
	vicious.register(netwidget, vicious.widgets.netinfo,
	function (widget, args)
		if args["{ip}"] == nil then
			neticon.visible = false
			netedownwidget.visible = false
			neteupwidget.visible = false
			upeicon.visible = false
			downeicon.visible = false
			return ""
		else
			neticon.visible = true
			netedownwidget.visible = true
			neteupwidget.visible = true
			upeicon.visible = true
			downeicon.visible = true
			return "<span color='#9acd32'>" .. args["{ip}"] .. "</span>"
		end
	end, refresh_delay, "eth0")

-- Volume widget
volicon = widget({ type = "imagebox" })
	volicon.image = image("/home/jack/.config/awesome/icons/vol18.png")

volwidget = widget({ type = "textbox" })
	vicious.register(volwidget, vicious.widgets.volume, "<span color='#9acd32'>$1%</span>", 2, "Master")

volbar = awful.widget.progressbar()
	volbar:set_width(10)
	volbar:set_height(18)
	volbar:set_vertical(true)
	volbar:set_background_color("#1a1918")
	volbar:set_color("#ff6500")
	volbar:set_gradient_colors({ "#1a1918", "#60801f", "#9acd32" })
	vicious.enable_caching(vicious.widgets.volume)
	vicious.register(volbar, vicious.widgets.volume, "$1",  2, "Master")
	volbar.widget:buttons(
		awful.util.table.join(
			awful.button({ }, 1, function () awful.util.spawn("amixer -q sset Master toggle")   end),
			awful.button({ }, 4, function () awful.util.spawn("amixer -q sset Master 2dB+", false) end),
			awful.button({ }, 5, function () awful.util.spawn("amixer -q sset Master 2dB-", false) end)
		)
	)
	volwidget:buttons(volbar.widget:buttons())

-- MPD widget
mpdicon = widget({ type = "imagebox" })
	mpdicon.image = image("/home/jack/.config/awesome/icons/music18.png")

mpdwidget = widget({ type = "textbox" })
	vicious.register(mpdwidget, vicious.widgets.mpd,
	function (widget, args)
		if args[1] == 'Stopped' then
			mpdicon.visible = false
			return ""
		else
			mpdicon.visible = true
			return "<span color='#9acd32'>" .. args[1] .. "</span>"
		end
	end)
	mpdwidget:buttons(
		awful.util.table.join(
			awful.button({}, 1, function () awful.util.spawn("mpc toggle", false) end),
			awful.button({}, 4, function () awful.util.spawn("mpc prev", false) end),
			awful.button({}, 5, function () awful.util.spawn("mpc next", false) end)
		)
	)
	mpdicon:buttons(mpdwidget:buttons())

-- Battery widget
baticon = widget({ type = "imagebox" })
	baticon.image = image("/home/jack/.config/awesome/icons/bat18.png")

batwidget = widget({ type = "textbox" })
	vicious.register(batwidget, vicious.widgets.bat, "<span color='#9acd32'>$1 $2%</span>", 12, "BAT1")

-- Mbox count widget
mdiricon = widget({ type = "imagebox" })
	mdiricon.image = image("/home/jack/.config/awesome/icons/mail18.png")

mdirwidget = widget({ type = "textbox" })
	vicious.register(mdirwidget, vicious.widgets.mdir, "<span color='#9acd32'> $1 j</span>", 61, { "/home/jack/.mail/joernv76" } )
		mdirwidget:buttons(
			awful.util.table.join(
				awful.button({ }, 1, function () awful.util.spawn(terminal .. " -e mutt") end),
				awful.button({ }, 3, function () awful.util.spawn(terminal .. " -e offlineimap") end)			)
		)
		mdiricon:buttons(mdirwidget:buttons())

mdirhwidget = widget({ type = "textbox" })
	vicious.register(mdirhwidget, vicious.widgets.mdir, "<span color='#9acd32'> $1 h</span>", 61, { "/home/jack/.mail/holborn79" } )
		mdirhwidget:buttons(
			awful.util.table.join(
				awful.button({ }, 1, function () awful.util.spawn(terminal .. " -e mutt") end),
				awful.button({ }, 3, function () awful.util.spawn(terminal .. " -e offlineimap") end)			)
		)

-- SYSTRAY
mysystray = widget({ type = "systray" })

-- WIBOX for each screen
mywibox = {}
infobox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
	awful.button({ }, 1, awful.tag.viewonly),
	awful.button({ modkey }, 1, awful.client.movetotag),
	awful.button({ }, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, awful.client.toggletag),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev)
)
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

for s = 1, screen.count() do
	-- Create a promptbox for each screen
	mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	mylayoutbox[s] = awful.widget.layoutbox(s)
	mylayoutbox[s]:buttons(awful.util.table.join(
		awful.button({ }, 1, function () awful.layout.inc(layouts,  1) end),
		awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
		awful.button({ }, 4, function () awful.layout.inc(layouts,  1) end),
		awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end))
	)
	-- Create a taglist widget
	mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all) --, mytaglist.buttons)
	-- Create a tasklist widget
	mytasklist[s] = awful.widget.tasklist(function(c)
		return awful.widget.tasklist.label.currenttags(c, s)
	end, mytasklist.buttons)
	-- Create the wibox
	mywibox[s] = awful.wibox({ position = "top", height = "18", screen = s })
	mywibox[s].widgets = { {
		mylauncher,
		mytaglist[s],
		mypromptbox[s],
		layout = awful.widget.layout.horizontal.leftright },
		mylayoutbox[s],
		clockwidget,
		clockicon,
		calwidget,
		calicon,
		s == 1 and mysystray or nil,
		mytasklist[s],
		layout = awful.widget.layout.horizontal.rightleft }
	infobox[s] = awful.wibox({ position = "bottom", height = "18", screen = s })
	infobox[s].widgets = { {
		mdiricon, mdirwidget, mdirhwidget, mpdicon, mpdwidget, ["layout"] = awful.widget.layout.horizontal.leftright },
		volwidget, volbar.widget, volicon,
		batwidget, baticon,
		neteupwidget, upeicon, netedownwidget, downeicon, netwidget, neticon,
		netwupwidget, upwicon, netwdownwidget, downwicon, wifiwidget, wifiicon,
		fshwidget, fsrwidget, fsicon,
		memwidget, memicon,
		tempwidget, tempicon,
		cpuinfowidget, cputwidget, cpuicon,
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
globalkeys = awful.util.table.join(
	awful.key({ modkey,           }, "j",                    awful.tag.viewprev       ),
	awful.key({ modkey,           }, "k",                    awful.tag.viewnext       ),
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
	awful.key({ modkey,           }, "w",                    function () mainmenu:show({keygrabber=true}) end),
	awful.key({                   }, "Print",                function () awful.util.spawn("scrot -b") end),
	awful.key({                   }, "XF86Calculator",       function () awful.util.spawn("speedcrunch") end),
	awful.key({                   }, "XF86AudioLowerVolume", function () awful.util.spawn("amixer -q sset Master 2dB-") end),
	awful.key({                   }, "XF86AudioRaiseVolume", function () awful.util.spawn("amixer -q sset Master 2dB+") end),
	awful.key({                   }, "XF86AudioStop",        function () awful.util.spawn("mpc stop") end),
	awful.key({                   }, "XF86AudioPlay",        function () awful.util.spawn("mpc toggle") end),
	awful.key({                   }, "XF86AudioNext",        function () awful.util.spawn("mpc next") end),
	awful.key({                   }, "XF86AudioPrev",        function () awful.util.spawn("mpc prev") end),
	awful.key({                   }, "XF86AudioMute",        function () awful.util.spawn("amixer -q sset Master toggle") end),
	awful.key({                   }, "XF86HomePage",         function () awful.util.spawn("firefox") end),
	awful.key({                   }, "XF86Mail",             function () awful.util.spawn(terminal .. " -e mutt") end),
	awful.key({ modkey,           }, "p",                    function () awful.util.spawn("dmenu_run -b -fn 'terminus' -nb '#262524' -nf '#a4a4a4' -sb '#a4a4a4' -sf '#262524'") end),

	awful.key({ modkey,           }, "t",                    function () awful.util.spawn("thunar") end),
	awful.key({ modkey,           }, "m",                    function () awful.util.spawn(terminal .. " -e mutt") end),
	awful.key({ modkey,           }, "r",                    function () awful.util.spawn(terminal .. " -e ranger") end),
	awful.key({ modkey, "Shift"   }, "l",                    function () awful.util.spawn(terminal .. " -e xscreensaver-command --lock") end),

	-- Layout manipulation
	awful.key({ modkey, "Shift"   }, "Right",                function () awful.client.swap.byidx(  1) end),
	awful.key({ modkey, "Shift"   }, "Left",                 function () awful.client.swap.byidx( -1) end),
	awful.key({ modkey, "Control" }, "Right",                function () awful.screen.focus_relative( 1) end),
	awful.key({ modkey, "Control" }, "Left",                 function () awful.screen.focus_relative(-1) end),
	awful.key({ modkey,           }, "u",                    awful.client.urgent.jumpto),
	awful.key({ modkey,           }, "Tab",                  function ()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end),
	-- Standard program
	awful.key({ modkey,           }, "Return",               function () awful.util.spawn(terminal) end),
	awful.key({ modkey, "Control" }, "r",                    awesome.restart),
	awful.key({ modkey, "Shift"   }, "q",                    awesome.quit),
--	awful.key({ modkey,           }, "l",                    function () awful.tag.incmwfact( 0.05) end),
--	awful.key({ modkey,           }, "h",                    function () awful.tag.incmwfact(-0.05) end),
--	awful.key({ modkey, "Shift"   }, "h",                    function () awful.tag.incnmaster( 1) end),
--	awful.key({ modkey, "Shift"   }, "l",                    function () awful.tag.incnmaster(-1) end),
--	awful.key({ modkey, "Control" }, "h",                    function () awful.tag.incncol( 1) end),
--	awful.key({ modkey, "Control" }, "l",                    function () awful.tag.incncol(-1) end),
	awful.key({ modkey,           }, "space",                function () awful.layout.inc(layouts,  1) end),
	awful.key({ modkey, "Shift"   }, "space",                function () awful.layout.inc(layouts, -1) end),
	-- Prompt
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

clientkeys = awful.util.table.join(
	awful.key({ modkey,           }, "o",                    function (c) c.fullscreen = not c.fullscreen  end),
	awful.key({ modkey, "Shift"   }, "c",                    function (c) c:kill() end),
	awful.key({ modkey, "Control" }, "space",                awful.client.floating.toggle ),
	awful.key({ modkey, "Control" }, "Return",               function (c) c:swap(awful.client.getmaster()) end),
	awful.key({ modkey, "Control" }, "o",                    awful.client.movetoscreen ),
	awful.key({ modkey, "Control", "Shift" }, "r",           function (c) c:redraw() end),
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

-- Compute the maximum number of digits we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
	keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
for i = 1, keynumber do
	globalkeys = awful.util.table.join(globalkeys,
	awful.key({ modkey }, "#" .. i + 9, function ()
		local screen = mouse.screen
		if tags[screen][i] then
			awful.tag.viewonly(tags[screen][i])
		end
	end),
	awful.key({ modkey, "Control" }, "#" .. i + 9, function ()
		local screen = mouse.screen
		if tags[screen][i] then
			awful.tag.viewtoggle(tags[screen][i])
		end
	end),
	awful.key({ modkey, "Shift" }, "#" .. i + 9, function ()
		if client.focus and tags[client.focus.screen][i] then
			awful.client.movetotag(tags[client.focus.screen][i])
		end
	end),
	awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function ()
		if client.focus and tags[client.focus.screen][i] then
			awful.client.toggletag(tags[client.focus.screen][i])
		end
	end)
	)
end

clientbuttons = awful.util.table.join(
	awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
	awful.button({ modkey }, 1, awful.mouse.client.move),
	awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)

-- RULES
awful.rules.rules = {
	-- All clients will match this rule.
	{ rule = { },
	properties = {
		border_width = beautiful.border_width,
		border_color = beautiful.border_normal,
		focus = true,
		keys = clientkeys,
		buttons = clientbuttons,
		size_hints_honor = false }
	},
	{ rule = { class = "Namoroka" },
		properties = { tag = tags[1][2] } },
	{ rule = { class = "OpenOffice.org 3.2" },
		properties = { tag = tags[1][3] } },
	{ rule = { class = "Texmaker" },
		properties = { tag = tags[1][3] } },
	{ rule = { class = "Epdfview" },
		properties = { tag = tags[1][3] } },
	{ rule = { class = "Zathura" },
		properties = { tag = tags[1][3] } },
	{ rule = { class = "Gimp" },
		properties = { tag = tags[1][4] } },
	{ rule = { class = "Gimp" },
		properties = { floating = true } },
	{ rule = { class = "Geeqie" },
		properties = { tag = tags[1][4] } },
	{ rule = { class = "Vlc" },
		properties = { tag = tags[1][5] } },
	{ rule = { class = "MPlayer" },
		properties = { tag = tags[1][5] } },
	{ rule = { class = "MPlayer" },
		properties = { floating = true } },
	{ rule = { class = "Audacity" },
		properties = { tag = tags[1][5] } }
}

-- SIGNALS
client.add_signal("manage", function (c, startup)
	-- Add a titlebar
	-- awful.titlebar.add(c, { modkey = modkey })
	
	-- Enable sloppy focus
	-- c:add_signal("mouse::enter", function(c)
	-- 	if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier and awful.client.focus.filter(c) then
	-- 		client.focus = c
	--      end
	-- end)

	if not startup then
        -- Set the windows at the slave,
        -- awful.client.setslave(c)

	-- Put windows in a smart way, only if they do not set an initial position.
	if not c.size_hints.user_position and not c.size_hints.program_position then
		awful.placement.no_overlap(c)
		awful.placement.no_offscreen(c)
	end
	end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
