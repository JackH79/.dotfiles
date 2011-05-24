-- THEME NIGHT

require("coloursnight")

theme = {}

theme.font          = "terminus 8"

theme.bg_normal     = trblk
theme.bg_focus      = trblk
theme.bg_urgent     = red
theme.bg_minimize   = trblk

theme.fg_normal     = brblk
theme.fg_focus      = yel
theme.fg_urgent     = trwhi
theme.fg_minimize   = blk

theme.border_width  = "1"
theme.border_normal = trblk
theme.border_focus  = brblk
theme.border_marked = blu

-- TAGLIST
theme.taglist_squares_sel   = "/home/jack/.config/awesome/themes/night/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/jack/.config/awesome/themes/night/taglist/squarew.png"

-- TASKLIST
theme.tasklist_floating_icon = "/home/jack/.config/awesome/themes/night/tasklist/floatingw.png"

-- MENU
theme.menu_submenu_icon = "/home/jack/.config/awesome/themes/night/submenu.png"
theme.menu_border_color = blk
theme.menu_height = "14"
theme.menu_width  = "90"

-- WALLPAPER
--theme.wallpaper_cmd = { "awsetbg /home/jack/.background/bg.png" }
theme.wallpaper_cmd = { "imlibsetroot -s /home/jack/.background/bgnight.png" }
return theme
