-- REMIND
require("themes")
require(themeset)

function cal_gett()
	local fp = io.popen("remind /home/jack/.reminders")
	local rem = fp:read("*a")
	fp:close()
		rem = string.gsub(rem, "\027%[0m", "</span>")
		rem = string.gsub(rem, "\027%[0;30m", "<span color='" .. blk .. "'>") --black    #1a1a1a
		rem = string.gsub(rem, "\027%[0;31m", "<span color='" .. red .. "'>") --red      #b23535
		rem = string.gsub(rem, "\027%[0;32m", "<span color='" .. gre .. "'>") --green    #60801f
		rem = string.gsub(rem, "\027%[0;33m", "<span color='" .. yel .. "'>") --yellow   #be6e00
		rem = string.gsub(rem, "\027%[0;34m", "<span color='" .. blu .. "'>") --blue     #1f6080
		rem = string.gsub(rem, "\027%[0;35m", "<span color='" .. mag .. "'>") --magenta  #8f46b2
		rem = string.gsub(rem, "\027%[0;36m", "<span color='" .. cya .. "'>") --cyan     #73afb4
		rem = string.gsub(rem, "\027%[0;37m", "<span color='" .. whi .. "'>") --white    #b2b2b2
		rem = string.gsub(rem, "\027%[1;30m", "<span color='" .. brblk .. "'>") --br-black    #4c4c4c
		rem = string.gsub(rem, "\027%[1;31m", "<span color='" .. brred .. "'>") --br-red      #ff4b4b
		rem = string.gsub(rem, "\027%[1;32m", "<span color='" .. brgre .. "'>") --br-green    #9bcd32
		rem = string.gsub(rem, "\027%[1;33m", "<span color='" .. bryel .. "'>") --br-yellow   #d79b1e
		rem = string.gsub(rem, "\027%[1;34m", "<span color='" .. brblu .. "'>") --br-blue     #329bcd
		rem = string.gsub(rem, "\027%[1;35m", "<span color='" .. brmag .. "'>") --br-magenta  #cd64ff
		rem = string.gsub(rem, "\027%[1;36m", "<span color='" .. brcya .. "'>") --br-cyan     #9bcdff
		rem = string.gsub(rem, "\027%[1;37m", "<span color='" .. brwhi .. "'>") --br-white    #ffffff
	return rem
end
