-- BINDINGS
-- Rat rules
root.buttons(awful.util.table.join(
	awful.button({ }, 3, function () mymainmenu:toggle() end),
	awful.button({ }, 4, awful.tag.viewnext),
	awful.button({ }, 5, awful.tag.viewprev)
))

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Global
globalkeys = awful.util.table.join(
	-- Awesome
	awful.key({ modkey, "Shift"   }, "q",			 awesome.quit             ),
	awful.key({ modkey, "Shift"   }, "r",			 awesome.restart          ),
	awful.key({ modkey,           }, "w",			 function () mymainmenu:show({keygrabber=true, coords={x=0, y=14} }) end),

	-- Tags
	awful.key({ modkey,           }, "Prior",                awful.tag.viewprev       ),
	awful.key({ modkey,           }, "Next",                 awful.tag.viewnext       ),
	awful.key({ modkey, "Shift"   }, "Prior",                shifty.shift_prev        ),
	awful.key({ modkey, "Shift"   }, "Next",                 shifty.shift_next        ),
	awful.key({ modkey            }, "z",                    shifty.del ),
	awful.key({ modkey,           }, "Escape",               awful.tag.history.restore),
	awful.key({ modkey,           }, "Right",		 function ()
		awful.client.focus.byidx( 1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey,           }, "Left",		 function ()
		awful.client.focus.byidx(-1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey,           }, "Tab",			 function ()
		awful.client.focus.byidx( 1)
		if client.focus then
			client.focus:raise()
		end
	end),
	awful.key({ modkey, "Control" }, "Right",                function () awful.tag.incmwfact( 0.05) end),
	awful.key({ modkey, "Control" }, "Left",                 function () awful.tag.incmwfact(-0.05) end),

	-- Programs
	-- launchers
	awful.key({ modkey,           }, "p",                    function () awful.util.spawn("dmenu_run -fn -*-terminus-*-*-*-*-12-*-*-*-*-*-*-* -nb '#1a1a1a' -nf '#b2b2b2' -sb '#1a1a1a' -sf '#2222ff'") end),
	awful.key({ modkey,           }, "Return",               function () awful.util.spawn("urxvtc -e tmux") end),
	-- miscellaneous
	awful.key({ modkey, "Shift"   }, "x",                    function () awful.util.spawn("xkill") end),
	awful.key({ modkey, "Shift"   }, "l",                    function () awful.util.spawn(terminal .. " -e slock") end),
	awful.key({ modkey,           }, "grave",                function () awful.util.spawn(terminal .. " -e htop") end),
	  -- remind output
	awful.key({ modkey, "Control" }, "r",                    function () naughty.notify({ text = cal_gett(), border_color = brblk, timeout = 20, hover_timeout = 0.5 }) end),
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
	awful.key({  modkey           }, "o",                    function () awful.util.spawn("opera") end),
	awful.key({  modkey           }, "f",                    function () awful.util.spawn("firefox") end),
	awful.key({ modkey,           }, "d",                    function () awful.util.spawn(terminal .. " -e wicd-curses") end),
	-- file managers
	awful.key({ modkey,           }, "r",                    function () awful.util.spawn(terminal .. " -e ranger") end),

	-- Layouts
	awful.key({ modkey, "Shift"   }, "Right",                function () awful.client.swap.byidx(  1) end),
	awful.key({ modkey, "Shift"   }, "Left",                 function () awful.client.swap.byidx( -1) end),
	awful.key({ modkey,           }, "u",                    awful.client.urgent.jumpto),

	-- Awesome
	awful.key({ modkey,           }, "space",                function () awful.layout.inc(layouts,  1) end),
	awful.key({ modkey, "Shift"   }, "space",                function () awful.layout.inc(layouts, -1) end),

	-- Prompts
	awful.key({ modkey, "Control", "Shift" }, "r",           function () mypromptbox[mouse.screen]:run() end),
	awful.key({ modkey, "Control", "Shift" }, "x",           function ()
		awful.prompt.run({ prompt = "Run Lua code: " },
		mypromptbox[mouse.screen].widget,
		awful.util.eval, nil,
		awful.util.getdir("cache") .. "/history_eval")
	end)
)

-- Clients
clientkeys = awful.util.table.join(
	awful.key({ modkey, "Shift"   }, "f",		function (c) c.fullscreen = not c.fullscreen  end),
	awful.key({ modkey, "Shift"   }, "c",		function (c) c:kill()                         end),
	awful.key({ modkey, "Control" }, "space",	awful.client.floating.toggle                     ),
	awful.key({ modkey, "Control" }, "Return",	function (c) c:swap(awful.client.getmaster()) end),
	awful.key({ modkey,           }, "o",		awful.client.movetoscreen                        ),
	awful.key({ modkey,           }, "t",		function (c) c.ontop = not c.ontop            end),
	awful.key({ modkey,           }, "n",		function (c)
		c.minimized = true
	end),
	awful.key({ modkey,           }, "m",		function (c)
		c.maximized_horizontal = not c.maximized_horizontal
		c.maximized_vertical   = not c.maximized_vertical
	end)
)

-- Shifty tag manipulation
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
