-- WIDGETS TOP
-- Right
-- Calendar widget
calwidget = wibox.widget.textbox()
	function dayth()
		local osd = os.date("%d")
		if osd == "01" or osd == "21" or osd == "31" then
			return "<span font='profont 6'><sup>st</sup></span>"
		elseif osd == "02" or osd == "22" then
			return "<span font='profont 6'><sup>nd</sup></span>"
		elseif osd == "03" or osd == "23" then
			return "<span font='profont 6'><sup>rd</sup></span>"
		else
			return "<span font='profont 6'><sup>th</sup></span>"
		end
	end
vicious.register(calwidget, vicious.widgets.date, "" .. colcya .. " %a, %d" .. dayth() .. " %B" .. coldef .. "")

-- Clock widget
local function fuzzyclock()
	-- get variables
	local hr  = os.date("%H")
	local min = os.date("%M")
	-- set daytime switch
	if     hr >= "00" and hr <= "03" then dt = 5
	elseif hr >= "04" and hr <= "06" then dt = 1
	elseif hr >= "07" and hr <= "11" then dt = 2
	elseif hr >= "12" and hr <= "17" then dt = 3
	elseif hr >= "18" and hr <= "21" then dt = 4
	elseif hr >= "22" and hr <= "23" then dt = 5 end
	-- keep 24 hr clock to distinguish between noon and midnight
	local nm = hr
	-- to do some easy math
	local hr = tonumber(hr)
	-- only need 12 hr clock for calling of time
	if hr >= 13 then hr = hr - 12 end
	-- midnight is twelve, not zero
	if hr == 00 then hr = 12 end
	-- times that are 'to' the hour need a plus one
	if hr >= 00 and hr <= 11 then hrp = hr + 1 else hrp = hr - 11 end
	-- get words
	local hours   = { "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "noon", "midnight" }
	local minutes = { "o'clock", "five", "ten", "quarter", "twenty", "twenty-five", "half" }
	local daytime = { "in the early morning", "in the morning", "in the afternoon", "in the evening", "at night" }
	-- set vars local
	local clock = "N/A"
	local tod   = ""

	-- set the words according to time of the hour and day
	if     min >= "00" and min <= "02" and nm == "00" then         clock = ""                               .. hours[14] ..  ""
	elseif min >= "00" and min <= "02" and nm == "12" then         clock = ""                               .. hours[13] ..  ""
	elseif min >= "00" and min <= "02"                then min = 1 clock = ""   .. hours[hr] .. " "       .. minutes[min] .. "" tod = "" .. daytime[dt] .. ""
	elseif min >= "03" and min <= "07" and nm == "00" then min = 2 clock = ""   .. minutes[min] .. " past " .. hours[14] ..  ""
	elseif min >= "03" and min <= "07"                then min = 2 clock = ""   .. minutes[min] .. " past " .. hours[hr] ..  "" tod = "" .. daytime[dt] .. ""
	elseif min >= "08" and min <= "12" and nm == "00" then min = 3 clock = ""   .. minutes[min] .. " past " .. hours[14] ..  ""
	elseif min >= "08" and min <= "12"                then min = 3 clock = ""   .. minutes[min] .. " past " .. hours[hr] ..  "" tod = "" .. daytime[dt] .. ""
	elseif min >= "13" and min <= "17" and nm == "00" then min = 4 clock = ""   .. minutes[min] .. " past " .. hours[14] ..  ""
	elseif min >= "13" and min <= "17"                then min = 4 clock = "a " .. minutes[min] .. " past " .. hours[hr] ..  "" tod = "" .. daytime[dt] .. ""
	elseif min >= "18" and min <= "22" and nm == "00" then min = 5 clock = ""   .. minutes[min] .. " past " .. hours[14] ..  ""
	elseif min >= "18" and min <= "22"                then min = 5 clock = ""   .. minutes[min] .. " past " .. hours[hr] ..  "" tod = "" .. daytime[dt] .. ""
	elseif min >= "23" and min <= "27" and nm == "00" then min = 6 clock = ""   .. minutes[min] .. " past " .. hours[14] ..  ""
	elseif min >= "23" and min <= "27"                then min = 6 clock = ""   .. minutes[min] .. " past " .. hours[hr] ..  "" tod = "" .. daytime[dt] .. ""
	elseif min >= "28" and min <= "32" and nm == "00" then min = 7 clock = ""   .. minutes[min] .. " past " .. hours[14] ..  ""
	elseif min >= "28" and min <= "32"                then min = 7 clock = ""   .. minutes[min] .. " "      .. hours[hr] ..  "" tod = "" .. daytime[dt] .. ""
	elseif min >= "33" and min <= "37" and nm == "23" then min = 6 clock = ""   .. minutes[min] .. " to "   .. hours[14] ..  ""
	elseif min >= "33" and min <= "37"                then min = 6 clock = ""   .. minutes[min] .. " to "   .. hours[hrp] .. "" tod = "" .. daytime[dt] .. ""
	elseif min >= "38" and min <= "42" and nm == "23" then min = 5 clock = ""   .. minutes[min] .. " to "   .. hours[14] ..  ""
	elseif min >= "38" and min <= "42"                then min = 5 clock = ""   .. minutes[min] .. " to "   .. hours[hrp] .. "" tod = "" .. daytime[dt] .. ""
	elseif min >= "43" and min <= "47" and nm == "23" then min = 4 clock = ""   .. minutes[min] .. " to "   .. hours[14] ..  ""
	elseif min >= "43" and min <= "47"                then min = 4 clock = "a " .. minutes[min] .. " to "   .. hours[hrp] .. "" tod = "" .. daytime[dt] .. ""
	elseif min >= "48" and min <= "52" and nm == "23" then min = 3 clock = ""   .. minutes[min] .. " to "   .. hours[14] ..  ""
	elseif min >= "48" and min <= "52"                then min = 3 clock = ""   .. minutes[min] .. " to "   .. hours[hrp] .. "" tod = "" .. daytime[dt] .. ""
	elseif min >= "53" and min <= "57" and nm == "23" then min = 2 clock = ""   .. minutes[min] .. " to "   .. hours[14] ..  ""
	elseif min >= "53" and min <= "57"                then min = 2 clock = ""   .. minutes[min] .. " to "   .. hours[hrp] .. "" tod = "" .. daytime[dt] .. ""
	elseif min >= "58" and min <= "59" and nm == "23" then         clock = ""                               .. hours[14] ..  ""
	elseif min >= "58" and min <= "59" and nm == "11" then         clock = ""                               .. hours[13] ..  ""
	elseif min >= "58" and min <= "59"                then min = 1 clock = ""   .. hours[hrp] .. " "      .. minutes[min] .. "" tod = "" .. daytime[dt] .. ""
	end
	return { clock, tod }
end
clockwidget = wibox.widget.textbox()
	vicious.register(clockwidget, fuzzyclock, "" .. colwhi .. " at " .. coldef .. colbblu .. "$1 " .. coldef .. colwhi .. "$2" .. coldef .. "")
	clockwidget:connect_signal('mouse::enter', function () cal_remt = { naughty.notify({ text = cal_gett(), border_color = "" .. blk .. "", timeout = 0 }) } end)
	clockwidget:connect_signal('mouse::leave', function () naughty.destroy(cal_remt[1]) end)

-- Weather widget
weatherwidget = wibox.widget.textbox()
	vicious.register(weatherwidget, vicious.widgets.weather,
	function (widget, args)
		if args["{tempc}"] == "N/A" then
			return ""
		else
--			weatherwidget:add_signal('mouse::enter', function () weather_n = { naughty.notify({ title = "" .. colblu .. "───────────── Weather ─────────────" .. coldef .. "", text = "" .. colbblu .. "Wind    : " .. args["{windkmh}"] .. " km/h " .. args["{wind}"] .. "\nHumidity: " .. args["{humid}"] .. " %\nPressure: " .. args["{press}"] .. " hPa" .. coldef .. "", border_color = "#1a1a1a" }) } end)
--			weatherwidget:add_signal('mouse::leave', function () naughty.destroy(weather_n[1]) end)
			return "" .. colcya .. " weather " .. coldef .. colwhi .. string.lower(args["{sky}"]) .. ", " .. args["{tempc}"] .. "°C" .. coldef .. ""
		end
	end, 1200, "YBTL" )
weatherwidget:buttons(awful.util.table.join(awful.button({}, 3, function () awful.util.spawn ( browser .. " http://www.weatherzone.com.au/qld/lower-burdekin/townsville") end)))
