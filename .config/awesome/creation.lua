-- CREATION
<<<<<<< HEAD
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
=======
-- WIBOX
mywibox = {}
infobox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({        }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({        }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({        }, 4, awful.tag.viewnext),
                    awful.button({        }, 5, awful.tag.viewprev)
                    )
shifty.taglist = mytaglist

mytasklist = {}
mytasklist.buttons = awful.util.table.join(
	awful.button({ }, 1, function (c)
		if c == client.focus then
			c.minimized = true
		else
			if not c:isvisible() then
				awful.tag.viewonly(c:tags()[1])
			end
			-- This will also un-minimize the client, if needed
			client.focus = c
			c:raise()
		end
>>>>>>> 84376952260f4610cd857d8eee54fff1c4f27c22
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
<<<<<<< HEAD
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
		netupwidget, netdownwidget, netwidget,
		wifiupwidget, wifidownwidget, wifiwidget,
		fshwidget, fsrwidget,
		memwidget,
		tempwidget,
		cputwidget,
		layout = awful.widget.layout.horizontal.rightleft }
--	if infoswitch == 0 then
--		infobox[s].visible = false
--	else
--		infobox[s].visible = true
--	end
=======
		if client.focus then client.focus:raise() end
	end),
	awful.button({ }, 5, function ()
		awful.client.focus.byidx(-1)
		if client.focus then client.focus:raise() end
	end))

-- Create for each screen ...
for s = 1, screen.count() do
	-- a promptbox
	mypromptbox[s] = awful.widget.prompt()
	-- a taglist widget
	mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
	-- a tasklist widget
	mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)
	-- create wiboxes
	-- top
	mywibox[s] = awful.wibox({ position = "top", height = "14", screen = s })
		-- widgets left
		local left_layout = wibox.layout.fixed.horizontal()
			left_layout:add(mytaglist[s])
			left_layout:add(mypromptbox[s])
		-- widgets right
		local right_layout = wibox.layout.fixed.horizontal()
			if s == 1 then right_layout:add(wibox.widget.systray()) end
			right_layout:add(weatherwidget)
			right_layout:add(calwidget)
			right_layout:add(clockwidget)
	-- combine above elements
	local layout = wibox.layout.align.horizontal()
		layout:set_left(left_layout)
		layout:set_middle(mytasklist[s])
		layout:set_right(right_layout)
	mywibox[s]:set_widget(layout)
	-- bottom
	infobox[s] = awful.wibox({ position = "bottom", height = "14", screen = s })
		-- widgets left
		local left_layout = wibox.layout.fixed.horizontal()
			left_layout:add(mpdwidget)
		-- widgets right
		local right_layout = wibox.layout.fixed.horizontal()
--			right_layout:add(netdownwidget)
--			right_layout:add(netupwidget)
			right_layout:add(netwidget)
--			right_layout:add(wifidownwidget)
--			right_layout:add(wifiupwidget)
			right_layout:add(wifiwidget)
			right_layout:add(cpuwidget)
--			right_layout:add(tempwidget)
			right_layout:add(memwidget)
			right_layout:add(fsrwidget)
			right_layout:add(fshwidget)
			right_layout:add(batwidget)
			right_layout:add(volwidget)
	-- combine above elements
	local layout = wibox.layout.align.horizontal()
		layout:set_left(left_layout)
		layout:set_right(right_layout)
	infobox[s]:set_widget(layout)
>>>>>>> 84376952260f4610cd857d8eee54fff1c4f27c22
end
