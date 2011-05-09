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
	vicious.register(calwidget, vicious.widgets.date, "" .. colyel .. " %a, %d" .. dayth() .. " %B" .. coldef .. "")
	calendar2.addCalendarToWidget(calwidget, "" .. colyel .. "%s" .. coldef .. "")

-- Clock widget
local function fuzzyclock()
	-- Get variables
	local hr   = os.date("%H")
	local min  = os.date("%M")
	local ampm = os.date("%P")
	-- to do some easy math
	local hr   = tonumber(hr)
	-- using 24 hr clock to later implement noon, midnight, etc.
	if hr >= 12 then hr = hr - 12 end
	-- midnight is twelve
	if hr == 00 then hr = 12 end
	-- times that are 'to' the hour need a plus one
	local hrp = hr + 1
	-- set daytime switch
	if ampm == "am" then dt = 1 else dt = 2 end	
	
	-- Set words
	hours = { "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve" }
	minutes = { "o'clock", "five", "ten", "quarter", "twenty", "twenty-five", "half" }
	daytime = { "in the morning", "in the afternoon" }
	clock = "N/A"

	-- Set the words according to time of the hour			
	if     min >= "00" and min <= "02" then min = 1 return { ""   .. hours[hr] .. " "      .. minutes[min] .. " " .. daytime[dt] .. "" }
	elseif min >= "03" and min <= "07" then	min = 2	return { ""   .. minutes[min] .. " past " .. hours[hr] .. " " .. daytime[dt] .. "" }
	elseif min >= "08" and min <= "12" then min = 3	return { ""   .. minutes[min] .. " past " .. hours[hr] .. " " .. daytime[dt] .. "" }
	elseif min >= "13" and min <= "17" then	min = 4	return { "a " .. minutes[min] .. " past " .. hours[hr] .. " " .. daytime[dt] .. "" }
	elseif min >= "18" and min <= "22" then	min = 5 return { ""   .. minutes[min] .. " past " .. hours[hr] .. " " .. daytime[dt] .. "" }
	elseif min >= "23" and min <= "27" then	min = 6	return { ""   .. minutes[min] .. " past " .. hours[hr] .. " " .. daytime[dt] .. "" }
	elseif min >= "28" and min <= "32" then	min = 7	return { ""   .. minutes[min] .. " "      .. hours[hr] .. " " .. daytime[dt] .. "" }
	elseif min >= "33" and min <= "37" then	min = 6	return { ""   .. minutes[min] .. " to "  .. hours[hrp] .. " " .. daytime[dt] .. "" }
	elseif min >= "38" and min <= "42" then	min = 5 return { ""   .. minutes[min] .. " to "  .. hours[hrp] .. " " .. daytime[dt] .. "" }
	elseif min >= "43" and min <= "47" then	min = 4	return { "a " .. minutes[min] .. " to "  .. hours[hrp] .. " " .. daytime[dt] .. "" }
	elseif min >= "48" and min <= "52" then	min = 3	return { ""   .. minutes[min] .. " to "  .. hours[hrp] .. " " .. daytime[dt] .. "" }
	elseif min >= "53" and min <= "57" then	min = 2	return { ""   .. minutes[min] .. " to "  .. hours[hrp] .. " " .. daytime[dt] .. "" }
	elseif min >= "58" and min <= "59" then	min = 1	return { ""   .. hours[hrp] .. " "     .. minutes[min] .. " " .. daytime[dt] .. "" }
	end
end
clockwidget = widget({ type = "textbox" })
	vicious.register(clockwidget, fuzzyclock, "" .. colbblk .. " at " .. coldef .. colyel .. "$1" .. coldef .. "")
	require("remind")
	clockwidget:add_signal('mouse::enter', function () cal_remt = { naughty.notify({ text = cal_gett(), border_color = "" .. blk .. "", timeout = 0, hover_timeout = 0.5 }) } end)
	clockwidget:add_signal('mouse::leave', function () naughty.destroy(cal_remt[1]) end)

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
