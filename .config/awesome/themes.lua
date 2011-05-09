-- THEMES
local f = io.open("/home/jack/.config/awesome/themes/theme_to_use", "r")
local r = f:read("*a")
if r == "day" then
	themeset = "themeday"
	f:close()
elseif r == "night" then
	themeset = "themenight"
	f:close()
else
	local tod = os.date("%H")
	if tod >= "07" and tod <="17" then
		themeset = "themeday"
	else
		themeset = "themenight"
	end
	f:close()
end

require(themeset)

-- reset switch
local f = io.open("/home/jack/.config/awesome/themes/theme_to_use", "w")
	f:write("")
	f:close()
