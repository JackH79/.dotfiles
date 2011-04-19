-- BACKGROUND
beautiful.init("/home/jack/.config/awesome/themes/day/theme.lua")

local x = io.open("/home/jack/.config/Xcolours/colours", "w")
x:write('#include "/home/jack/.config/Xcolours/day"')
x:close()

local t = io.open("/home/jack/.gtkrc-2.0.mine", "w")
t:write('gtk-theme-name="Azel"')
t:close()

-- COLOURS
coldef  = "</span>"
colblk  = "<span color='#222222'>"
colred  = "<span color='#b22222'>"
colgre  = "<span color='#37451e'>"
colyel  = "<span color='#886100'>"
colblu  = "<span color='#00457f'>"
colmag  = "<span color='#8800cc'>"
colcya  = "<span color='#007f7f'>"
colwhi  = "<span color='#999999'>"
colbblk = "<span color='#454545'>"
colbred = "<span color='#ff4e3b'>"
colbgre = "<span color='#9acd32'>"
colbyel = "<span color='#daa520'>"
colbblu = "<span color='#0055ed'>"
colbmag = "<span color='#da00d2'>"
colbcya = "<span color='#00cbcb'>"
colbwhi = "<span color='#cccccc'>"
