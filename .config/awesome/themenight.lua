-- THEMENIGHT
-- background
beautiful.init("/home/jack/.config/awesome/themes/night/theme.lua")

-- xdefaults
local x = io.open("/home/jack/.config/Xcolours/colours", "w")
x:write('#include "/home/jack/.config/Xcolours/night"')
x:close()

-- gtk
local t = io.open("/home/jack/.gtkrc-2.0.mine", "w")
t:write('gtk-theme-name="ACYL_Night"\ngtk-icon-theme-name="ACYL_Icons_Night"')
t:close()

-- Spacer widget
spacerwidget = widget({ type = "imagebox" })
	spacerwidget.image = image("/home/jack/.config/awesome/themes/night/spacer.png")

-- colours
require("coloursnight")

coldef  = "</span>"
colblk  = "<span color='" .. blk .. "'>"
colred  = "<span color='" .. red .. "'>"
colgre  = "<span color='" .. gre .. "'>"
colyel  = "<span color='" .. yel .. "'>"
colblu  = "<span color='" .. blu .. "'>"
colmag  = "<span color='" .. mag .. "'>"
colcya  = "<span color='" .. cya .. "'>"
colwhi  = "<span color='" .. whi .. "'>"
colbblk = "<span color='" .. brblk .. "'>"
colbred = "<span color='" .. brred .. "'>"
colbgre = "<span color='" .. brgre .. "'>"
colbyel = "<span color='" .. bryel .. "'>"
colbblu = "<span color='" .. brblu .. "'>"
colbmag = "<span color='" .. brmag .. "'>"
colbcya = "<span color='" .. brcya .. "'>"
colbwhi = "<span color='" .. brwhi .. "'>"
