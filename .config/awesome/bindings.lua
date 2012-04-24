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
	-- Awesome
	-- start/stop
	awful.key({ modkey, "Shift"   }, "q",                    awesome.quit             ),
	awful.key({ modkey, "Shift"   }, "r",                    awesome.restart          ),
	-- theme switcher
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
	-- tags
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
	-- layouts
	awful.key({ modkey,           }, "space",                 function () awful.layout.inc(layouts,  1) end),
	awful.key({ modkey, "Shift"   }, "space",                 function () awful.layout.inc(layouts, -1) end),
	awful.key({ modkey, "Shift"   }, "Right",                 function () awful.client.swap.byidx(  1) end),
	awful.key({ modkey, "Shift"   }, "Left",                  function () awful.client.swap.byidx( -1) end),
	-- prompts
	awful.key({ modkey, "Control", "Shift" }, "r",            function () mypromptbox[mouse.screen]:run() end),
	awful.key({ modkey, "Shift"   }, "x",                     function ()
		awful.prompt.run({ prompt = "Run Lua code: " },
		mypromptbox[mouse.screen].widget,
		awful.prompt.run({ prompt = "Run Lua code: " },
		mypromptbox[mouse.screen].widget,
		awful.util.eval, nil,
		awful.util.getdir("cache") .. "/history_eval"))
	end),
	-- Programs
	-- launchers
	awful.key({ modkey,           }, "w",                     function () mainmenu:show({keygrabber=true, coords={x=0, y=14} }) end),
	awful.key({ modkey,           }, "p",                     function () awful.util.spawn("dmenu_run -fn 'terminus' -nb '#000000' -nf '#4c4c4c' -sb '#000000' -sf '#be6e00'") end),
	awful.key({ modkey, "Shift"   }, "Return",                function () awful.util.spawn(terminal) end),
	-- miscellaneous
	awful.key({ modkey, "Shift"   }, "x",                     function () awful.util.spawn("xkill") end),
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
	-- web
	awful.key({  modkey           }, "f",		          function () awful.util.spawn("firefox") end),
	awful.key({  modkey           }, "k", 		          function () awful.util.spawn("kontact") end),
	-- file managers
	awful.key({ modkey,           }, "r",                     function () awful.util.spawn(terminal .. " -e ranger") end),
	awful.key({ modkey,           }, "d",                     function () awful.util.spawn("dolphin") end)
)

-- Clients
clientkeys = awful.util.table.join(
	awful.key({ modkey, "Shift"   }, "o",                    function (c) c.fullscreen = not c.fullscreen  end),
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
	awful.key({ modkey, "Shift"   }, "f",                    function (c)
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
