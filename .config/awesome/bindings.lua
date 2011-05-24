-- BINDINGS
-- helpers for world clock
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

-- Mouse bindings
root.buttons(awful.util.table.join(
	awful.button({ }, 3, function () mainmenu:toggle() end),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev))
)

-- Key bindings
-- Global
globalkeys = awful.util.table.join(
	-- Awesome
	awful.key({ modkey, "Shift"   }, "q",                    awesome.quit             ),
	awful.key({ modkey, "Shift"   }, "r",                    awesome.restart          ),
	awful.key({ modkey, "Shift"   }, "F11",                  function ()
		d = io.open("/home/jack/.config/awesome/themes/theme_to_use", "w")
		d:write("day")
		d:close()
	end, awesome.restart ),
	awful.key({ modkey, "Shift"   }, "F12",                  function ()
		n = io.open("/home/jack/.config/awesome/themes/theme_to_use", "w")
		n:write("night")
		n:close()
	end, awesome.restart ),

	-- Tags
	awful.key({ modkey,           }, "Prior",                 awful.tag.viewprev       ),
	awful.key({ modkey,           }, "Next",                  awful.tag.viewnext       ),
	awful.key({ modkey, "Shift"   }, "Prior",                 shifty.shift_prev        ),
	awful.key({ modkey, "Shift"   }, "Next",                  shifty.shift_next        ),
	awful.key({ modkey            }, "z",                     shifty.del ),
	awful.key({ modkey,           }, "Escape",                awful.tag.history.restore),
	awful.key({ modkey,           }, "Right",                 function ()
		awful.client.focus.byidx( 1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey,           }, "Left",                  function ()
		awful.client.focus.byidx(-1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey, "Control" }, "Right",                 function () awful.tag.incmwfact( 0.05) end),
	awful.key({ modkey, "Control" }, "Left",                  function () awful.tag.incmwfact(-0.05) end),

	-- Programs
	-- launchers
	awful.key({ modkey,           }, "w",                     function () mainmenu:show({keygrabber=true, coords={x=0, y=14} }) end),
	awful.key({                   }, "XF86PowerOff",          function () leavemenu:show({keygrabber=true, coords={x=0, y=14} }) end),
	awful.key({ modkey,           }, "p",                     function () awful.util.spawn("dmenu_run -fn 'terminus' -nb '#000000' -nf '#4c4c4c' -sb '#000000' -sf '#be6e00'") end),
	awful.key({ modkey, "Shift"   }, "Return",                function () awful.util.spawn(terminal) end),
	-- miscellaneous
	awful.key({                   }, "Print",                 function () awful.util.spawn("scrot -b") end),
	awful.key({                   }, "XF86Calculator",        function () awful.util.spawn("speedcrunch") end),
	awful.key({ modkey, "Shift"   }, "x",                     function () awful.util.spawn("xkill") end),
	awful.key({ modkey, "Shift"   }, "l",                     function () awful.util.spawn(terminal .. " -e slock") end),
	awful.key({ modkey            }, "F8",                    function () awful.util.spawn("truecrypt") end),
	awful.key({ modkey, "Shift" }, "t",                     function () naughty.notify({ text = "" .. colbyel .. "────────────────────────────────── World Clock ─────────────────────────────────" .. coldef .. colblk .."\nOOO      OOOO             OO                                     OOOOO  OOOOOOOO\nOO " .. coldef .. colyel .. "London" .. coldef .. colblk .. "             O  OOOOOOOOOOO  O                    OOOO O OO O    OOOOOO\n  O" .. coldef .. colbyel .. time_utc() .. coldef .. colblk .. "OO OO OOOOOOOOOOOOOOOOOOOOOOOOO  OOOOOOOOOOOOOOOOOOOO OO    OO\n      OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO    O        OOO  OOOOOOOOOO   OOO\n    OOOOO" .. coldef .. colyel .. "Düsseldorf" .. coldef .. colblk .. "OOOOOOOOOOOOOOOOOO               " .. coldef .. colyel .. "Vancouver" .. coldef .. colblk .. "OOOOOOOOOO\n  OOOOO  " .. coldef .. colbyel .. time_cet() .. coldef .. colblk .. "OOOOOOOOOOOOOOOO O             " .. coldef .. colbyel .. time_pst() .. coldef .. colblk .. "OOO\n       OO      OOOOOOOOOOOOOOOOOOO O O                     OOOOOOOO" .. coldef .. colyel .. "Woods Hole" .. coldef .. colblk .. "\n     OOOOOOOOOOOOOOOOOOOOOOOOOOOOO                           OOOO  " .. coldef .. colbyel .. time_est() .. coldef .. colblk .. "\n    OOOOOOOOOOOO OOOO  OOOO OOOOO                               OO\n   OOOOOOOOOOOOO O      O    OO                                   OO\n     OOOOOOOOOOOOO                O                                  OOOO\n         OOOOO O              O OOO                                 OOOOOOO\n          OOOOOO               O      OO          " .. coldef .. colyel .. "Rarotonga" .. coldef .. colblk .. "        OOOOOOOOO\n          OOOOOO                    O O           " .. coldef .. colbyel .. time_ckt() .. coldef .. colblk .. "     OOOOOOOO\n          OOOOO  O              OOOOOOOO                            OOOOOO\n           OOO                  OOOOOOOOO                            OOOO\n            O                         OO  " .. coldef .. colyel .. "Tauranga" .. coldef .. colblk .. "                   OOOO\n                                          " .. coldef .. colbyel .. time_nzst() .. coldef .. colblk .. "               OO\n                                                                     O" .. coldef .. "", border_color = "#1a1a1a", timeout = 20, hover_timeout = 0.5 }) end),
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
	awful.key({  modkey           }, "XF86HomePage",          function () awful.util.spawn("firefox") end),
	awful.key({                   }, "XF86HomePage",          function () awful.util.spawn("luakit") end),
	awful.key({                   }, "XF86Mail",              function () awful.util.spawn(terminal .. " -e mutt") end),
	awful.key({ modkey,           }, "i",                     function () awful.util.spawn(terminal .. " -e irssi") end),
	awful.key({ modkey,           }, "d",                     function () awful.util.spawn(terminal .. " -e wicd-curses") end),
--	awful.key({ modkey, "Shift"   }, "d",                     function () awful.util.spawn(terminal .. " -e sudo wvdial optus") end),
	awful.key({ modkey,           }, "F12",                   function () awful.util.spawn(terminal .. " -e rtorrent") end),
	awful.key({ modkey,           }, "c",                     function () awful.util.spawn(terminal .. " -e canto -u") end),
	-- file managers
	awful.key({ modkey,           }, "r",                     function () awful.util.spawn(terminal .. " -e ranger") end),
	awful.key({ modkey,           }, "t",                     function () awful.util.spawn("thunar") end),

	-- Layouts
	awful.key({ modkey, "Shift"   }, "Right",                 function () awful.client.swap.byidx(  1) end),
	awful.key({ modkey, "Shift"   }, "Left",                  function () awful.client.swap.byidx( -1) end),
--	awful.key({ modkey, "Control" }, "Right",                 function () awful.screen.focus_relative( 1) end),
--	awful.key({ modkey, "Control" }, "Left",                  function () awful.screen.focus_relative(-1) end),
	awful.key({ modkey,           }, "u",                     awful.client.urgent.jumpto),

	-- Awesome
	awful.key({ modkey,           }, "space",                 function () awful.layout.inc(layouts,  1) end),
	awful.key({ modkey, "Shift"   }, "space",                 function () awful.layout.inc(layouts, -1) end),

	-- Prompts
	awful.key({ modkey, "Control", "Shift" }, "r",            function () mypromptbox[mouse.screen]:run() end),
	awful.key({ modkey, "Shift"   }, "x",                     function ()
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
		end
	end),
	awful.key({ modkey,           }, "f",                    function (c)
				c.maximized_horizontal = not c.maximized_horizontal c.maximized_vertical = not c.maximized_vertical
	end))

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
