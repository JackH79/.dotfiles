-- WIDGETS TOP
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
	require("remind")
	clockwidget:add_signal('mouse::enter', function () cal_remt = { naughty.notify({ text = cal_gett(), border_color = "" .. blk .. "", timeout = 0, hover_timeout = 0.5 }) } end)
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
