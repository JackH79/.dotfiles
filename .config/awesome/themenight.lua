-- BACKGROUND
beautiful.init("/home/jack/.config/awesome/themes/night/theme.lua")

local x = io.open("/home/jack/.config/Xcolours/colours", "w")
x:write('#include "/home/jack/.config/Xcolours/night"')
x:close()

local t = io.open("/home/jack/.gtkrc-2.0.mine", "w")
t:write('gtk-theme-name="Dark_Star"')
t:close()

-- COLOURS
coldef  = "</span>"
colblk  = "<span color='#1a1a1a'>"
colred  = "<span color='#b23535'>"
colgre  = "<span color='#60801f'>"
colyel  = "<span color='#be6e00'>"
colblu  = "<span color='#1f6080'>"
colmag  = "<span color='#8f46b2'>"
colcya  = "<span color='#73afb4'>"
colwhi  = "<span color='#b2b2b2'>"
colbblk = "<span color='#333333'>"
colbred = "<span color='#ff4b4b'>"
colbgre = "<span color='#9bcd32'>"
colbyel = "<span color='#d79b1e'>"
colbblu = "<span color='#329bcd'>"
colbmag = "<span color='#cd64ff'>"
colbcya = "<span color='#9bcdff'>"
colbwhi = "<span color='#ffffff'>"
