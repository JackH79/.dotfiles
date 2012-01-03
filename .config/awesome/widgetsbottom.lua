-- WIDGETS BOTTOM
-- Left
-- MPD widget
mpdwidget = wibox.widget.textbox()
	vicious.register(mpdwidget, vicious.widgets.mpd,
		function (widget, args)
			if args["{state}"] == "Stop" then
				return ""
			elseif args["{state}"] == "Play" then
				return "" .. colcya .. "mpd " .. coldef .. colbwhi .. args["{Artist}"] .. " - " .. args["{Album}"] .. " - " .. args["{Title}"] .. coldef .. ""
			elseif args["{state}"] == "Pause" then
				return "" .. colcya .. "mpd " .. coldef .. colbyel .. "paused" .. coldef .. ""
			end
		end, refresh_delay )
	mpdwidget:buttons(
		awful.util.table.join(
			awful.button({}, 1, function () awful.util.spawn("mpc toggle", false) end),
			awful.button({}, 2, function () awful.util.spawn( terminal .. " -e ncmpcpp")   end),
			awful.button({}, 4, function () awful.util.spawn("mpc prev", false) end),
			awful.button({}, 5, function () awful.util.spawn("mpc next", false) end)
		)
	)

-- Right (from left to right)
-- Net widgets
-- eth
netdownwidget = wibox.widget.textbox()
	vicious.cache(vicious.widgets.net)
	vicious.register(netdownwidget, vicious.widgets.net, "" .. colcya .. "down " ..coldef .. colbwhi .. "${eth0 down_kb} " .. coldef .. "")

netupwidget = wibox.widget.textbox()
	vicious.register(netupwidget, vicious.widgets.net, "" .. colcya .. "up " .. coldef .. colbwhi .. "${eth0 up_kb} " .. coldef .. "")

netwidget = wibox.widget.textbox()
	vicious.register(netwidget, vicious.widgets.net,
	function (widget, args)
		function ip_addr()
			local ip = io.popen("ip addr show eth0 | grep 'inet '")
			local addr = ip:read("*a")
			ip:close()
			addr = string.match(addr, "%d+.%d+.%d+.%d+")
			return addr
		end
		if ip_addr() == nil then
			netdownwidget.visible = false
			netupwidget.visible = false
			return ""
		else
			netdownwidget.visible = true
			netupwidget.visible = true
			return "" .. colcya .. "eth0 " .. coldef .. colbwhi .. ip_addr() .. coldef .. " "
		end
	end, refresh_delay, "eth0")

-- wlan
wifidownwidget = wibox.widget.textbox()
	vicious.register(wifidownwidget, vicious.widgets.net, "" .. colcya .. "down " .. coldef .. colbwhi .. "${wlan0 down_kb} " .. coldef .. "")

wifiupwidget = wibox.widget.textbox()
	vicious.register(wifiupwidget, vicious.widgets.net, "" .. colcya .. "up " .. coldef .. colbwhi .. "${wlan0 up_kb} " .. coldef .. "")

wifiwidget = wibox.widget.textbox()
	vicious.register(wifiwidget, vicious.widgets.wifi,
	function (widget, args)
		function ip_addr()
			local ip = io.popen("ip addr show wlan0 | grep 'inet '")
			local addr = ip:read("*a")
			ip:close()
			addr = string.match(addr, "%d+.%d+.%d+.%d+")
			return addr
		end
		if args["{link}"] == 0 then
			wifidownwidget.visible = false
			wifiupwidget.visible = false
			return ""
		else
			wifidownwidget.visible = true
			wifiupwidget.visible = true
			if args["{link}"]/70*100 <= 50 then
				return "" .. colcya .. "wlan " .. coldef .. colbwhi .. ip_addr() .. coldef .. colwhi .. " on " .. coldef .. colbwhi .. args["{ssid}"] .. coldef .. colred .. " at " .. coldef .. colbred .. string.format("[%i%%]", args["{link}"]/70*100) .. coldef .. " "
			elseif args["{link}"]/70*100 > 50 and args["{link}"]/70*100 <=75 then
				return "" .. colcya .. "wlan " .. coldef .. colbwhi .. ip_addr() .. coldef .. colwhi .. " on " .. coldef .. colbwhi .. args["{ssid}"] .. coldef .. colyel .. " at " .. coldef .. colbyel .. string.format("[%i%%]", args["{link}"]/70*100) .. coldef .. " "
			else
				return "" .. colcya .. "wlan " .. coldef .. colbwhi .. ip_addr() .. coldef .. colwhi .. " on " .. coldef .. colbwhi .. args["{ssid}"] .. coldef .. colwhi .. " at " .. coldef .. colbwhi .. string.format("[%i%%]", args["{link}"]/70*100) .. coldef .. " "
			end
		end
	end, refresh_delay, "wlan0" )

-- CPU widget
cpuwidget = wibox.widget.textbox()
	vicious.register(cpuwidget, vicious.widgets.cpu,
	function (widget, args)
		if  args[1] >= 50 and args[1] <= 75 then
			return "" .. colyel .. "cpu " .. coldef .. colbyel .. args[1] .. "% " .. coldef .. ""
		elseif args[1] > 75 then
			return "" .. colred .. "cpu " .. coldef .. colbred .. args[1] .. "% " .. coldef .. ""
		else
			return "" .. colcya .. "cpu " .. coldef .. colbwhi .. args[1] .. "% " .. coldef .. ""
		end
	end )
cpuwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( terminal .. " -e htop --sort-key PERCENT_CPU") end ) ) )

-- -- CPU temp widget
-- tempwidget = wibox.widget.textbox()
-- 	vicious.register(tempwidget, vicious.widgets.thermal,
-- 	function (widget, args)
-- 		if  args[1] >= 65 and args[1] < 75 then
-- 			return "" .. colyel .. "temp " .. coldef .. colbyel .. args[1] .. "°C " .. coldef .. ""
-- 		elseif args[1] >= 75 and args[1] < 80 then
-- 			return "" .. colred .. "temp " .. coldef .. colbred .. args[1] .. "°C " .. coldef .. ""
-- 		elseif args[1] > 80 then
-- 			naughty.notify({ title = "Temperature Warning", text = "Running hot! " .. args[1] .. "°C!\nTake it easy.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
-- 			return "" .. colred .. "temp " .. coldef .. colbred .. args[1] .. "°C " .. coldef .. "" 
-- 		else
-- 			return "" .. colcya .. "temp " .. coldef .. colbwhi .. args[1] .. "°C " .. coldef .. ""
-- 		end
-- 	end, 19, "cooling_device0" )

-- Ram widget
memwidget = wibox.widget.textbox()
	vicious.cache(vicious.widgets.mem)
	vicious.register(memwidget, vicious.widgets.mem, "" .. colcya .. "ram " .. coldef .. colbwhi .. "$1% ($2 MiB) " .. coldef .. "", 59)

-- Filesystem widgets
-- root
fsrwidget = wibox.widget.textbox()
	vicious.register(fsrwidget, vicious.widgets.fs,
	function (widget, args)
		if  args["{/ used_p}"] >= 93 and args["{/ used_p}"] < 97 then
			return "" .. colyel .. "root " .. coldef .. colbyel .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/ used_p}"] >= 97 and args["{/ used_p}"] < 99 then
			return "" .. colred .. "root " .. coldef .. colbred .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/ used_p}"] >= 99 and args["{/ used_p}"] <= 100 then
			naughty.notify({ title = "Hard drive Warning", text = "No space left on root!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "" .. colred .. "root " .. coldef .. colbred .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. "" 
		else
			return "" .. colcya .. "root " .. coldef .. colbwhi .. args["{/ used_p}"] .. "% used (" .. args["{/ avail_gb}"] .. " GiB free) " .. coldef .. ""
		end
	end, 621)

-- /home
fshwidget = wibox.widget.textbox()
	vicious.register(fshwidget, vicious.widgets.fs,
	function (widget, args)
		if  args["{/home used_p}"] >= 97 and args["{/home used_p}"] < 98 then
			return "" .. colyel .. "/home " .. coldef .. colbyel .. args["{/home used_p}"] .. "% used (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/home used_p}"] >= 98 and args["{/home used_p}"] < 99 then
			return "" .. colred .. "/home " .. coldef .. colbred .. args["{/home used_p}"] .. "% used (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
		elseif args["{/home used_p}"] >= 99 and args["{/home used_p}"] <= 100 then
			naughty.notify({ title = "Hard drive Warning", text = "No space left on /home!\nMake some room.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "" .. colred .. "/home " .. coldef .. colbred .. args["{/home used_p}"] .. "% used (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. "" 
		else
			return "" .. colcya .. "/home " .. coldef .. colbwhi .. args["{/home used_p}"] .. "% used (" .. args["{/home avail_gb}"] .. " GiB free) " .. coldef .. ""
		end
	end, 622)

-- Battery widget
batwidget = wibox.widget.textbox()
	vicious.register(batwidget, vicious.widgets.bat,
	function (widget, args)
		if args[2] >= 20 and args[2] < 30 and args[1] == "-" then
			return "" .. colyel .. "bat " .. coldef .. colbyel .. args[1] .. " " .. args[2] .. "% " .. coldef .. ""
		elseif args[2] >= 10 and args[2] < 20 and args[1] == "-" then
			return "" .. colred .. "bat " .. coldef .. colbred .. args[1] .. " " .. args[2] .. "% " .. coldef .. ""
		elseif args[2] < 10 and args[1] == "-" then
			naughty.notify({ title = "Battery Warning", text = "Battery low! "..args[2].."% left!\nBetter get some power.", timeout = 10, position = "top_right", fg = beautiful.fg_urgent, bg = beautiful.bg_urgent })
			return "" .. colred .. "bat " .. coldef .. colbred .. args[1] .. " " .. args[2] .. "% " .. coldef .. ""
		elseif args[2] < 10 then 
			return "" .. colred .. "bat " .. coldef .. colbred .. args[1] .. " " .. args[2] .. "% " .. coldef .. ""
		else
			return "" .. colcya .. "bat " .. coldef .. colbwhi .. args[1] .. " " .. args[2] .. "% " .. coldef .. ""
		end
	end, 236, "BAT0" )

-- Volume widget
volwidget = wibox.widget.textbox()
	vicious.register(volwidget, vicious.widgets.volume,
		function (widget, args)
			if args[1] == 0 or args[2] == "♩" then
				return "" .. colcya .. "vol " .. coldef .. colbred .. "mute" .. coldef .. "" 
			else
				return "" .. colcya .. "vol " .. coldef .. colbwhi .. args[1] .. "% " .. coldef .. ""
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
