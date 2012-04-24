local colour = 0

if colour == 0 then
	-- STRIP COLOURS
	local function cal_gett()
		local fp = io.popen("remind /home/jack/.reminders")
		local rem = fp:read("*a")
		fp:close()
			rem = string.gsub(rem, "\027%[0m", "")
			rem = string.gsub(rem, "\027%[0;30m", "")
			rem = string.gsub(rem, "\027%[0;31m", "")
			rem = string.gsub(rem, "\027%[0;32m", "")
			rem = string.gsub(rem, "\027%[0;33m", "")
			rem = string.gsub(rem, "\027%[0;34m", "")
			rem = string.gsub(rem, "\027%[0;35m", "")
			rem = string.gsub(rem, "\027%[0;36m", "")
			rem = string.gsub(rem, "\027%[0;37m", "")
			rem = string.gsub(rem, "\027%[1;30m", "")
			rem = string.gsub(rem, "\027%[1;31m", "")
			rem = string.gsub(rem, "\027%[1;32m", "")
			rem = string.gsub(rem, "\027%[1;33m", "")
			rem = string.gsub(rem, "\027%[1;34m", "")
			rem = string.gsub(rem, "\027%[1;35m", "")
			rem = string.gsub(rem, "\027%[1;36m", "")
			rem = string.gsub(rem, "\027%[1;37m", "")
		return rem
	end
	
	print (cal_gett())
else
	-- PANGO
	local function cal_gett()
		local fp = io.popen("remind /home/jack/.reminders")
		local rem = fp:read("*a")
		fp:close()
			rem = string.gsub(rem, "\027%[0m", "</span>")
			rem = string.gsub(rem, "\027%[0;30m", "<span color='#262626'>")
			rem = string.gsub(rem, "\027%[0;31m", "<span color='#b23535'>")
			rem = string.gsub(rem, "\027%[0;32m", "<span color='#60801f'>")
			rem = string.gsub(rem, "\027%[0;33m", "<span color='#be6e00'>")
			rem = string.gsub(rem, "\027%[0;34m", "<span color='#1f6080'>")
			rem = string.gsub(rem, "\027%[0;35m", "<span color='#8f46b2'>")
			rem = string.gsub(rem, "\027%[0;36m", "<span color='#73afb4'>")
			rem = string.gsub(rem, "\027%[0;37m", "<span color='#b2b2b2'>")
			rem = string.gsub(rem, "\027%[1;30m", "<span color='#333333'>")
			rem = string.gsub(rem, "\027%[1;31m", "<span color='#ff4b4b'>")
			rem = string.gsub(rem, "\027%[1;32m", "<span color='#9bcd32'>")
			rem = string.gsub(rem, "\027%[1;33m", "<span color='#d79b1e'>")
			rem = string.gsub(rem, "\027%[1;34m", "<span color='#329bcd'>")
			rem = string.gsub(rem, "\027%[1;35m", "<span color='#cd64ff'>")
			rem = string.gsub(rem, "\027%[1;36m", "<span color='#9bcdff'>")
			rem = string.gsub(rem, "\027%[1;37m", "<span color='#ffffff'>")
		return rem
	end
	print (cal_gett())
end
