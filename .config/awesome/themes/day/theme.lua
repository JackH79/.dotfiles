-- THEME DAY
require("coloursday")

theme = {}

theme.font          = "terminus 8"

theme.bg_normal     = trwhi
theme.bg_focus      = trwhi
theme.bg_urgent     = brred
theme.bg_minimize   = trwhi

theme.fg_normal     = brblk
theme.fg_focus      = brgre
theme.fg_urgent     = trwhi
theme.fg_minimize   = brwhi

theme.border_width  = "1"
theme.border_normal = trwhi
theme.border_focus  = brgre
theme.border_marked = red

-- TAGLIST
theme.taglist_squares_sel   = "/home/jack/.config/awesome/themes/day/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/jack/.config/awesome/themes/day/taglist/squarew.png"

-- TASKLIST
theme.tasklist_floating_icon = "/home/jack/.config/awesome/themes/day/tasklist/floatingw.png"

-- MENU
theme.menu_submenu_icon = "/home/jack/.config/awesome/themes/day/submenu.png"
theme.menu_border_color = brwhi 
theme.menu_height = "14"
theme.menu_width  = "90"

-- WALLPAPER
theme.wallpaper_cmd = { "imlibsetroot -s /home/jack/.background/bgday.png" }
return theme
