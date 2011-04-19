---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "terminus 8"

theme.bg_normal     = "#ffffff"
theme.bg_focus      = "#ffffff"
theme.bg_urgent     = "#b23535"
theme.bg_minimize   = "#ffffff"

theme.fg_normal     = "#4c4c4c"
theme.fg_focus      = "#be6e00"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#cccccc"

theme.border_width  = "1"
theme.border_normal = "#eeeeee"
theme.border_focus  = "#cccccc"
theme.border_marked = "#a4a4a4"

-- TAGLIST
theme.taglist_squares_sel   = "/home/jack/.config/awesome/themes/day/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/jack/.config/awesome/themes/day/taglist/squarew.png"

-- TASKLIST
theme.tasklist_floating_icon = "/home/jack/.config/awesome/themes/day/tasklist/floatingw.png"

-- MENU
theme.menu_submenu_icon = "/home/jack/.config/awesome/themes/day/submenu.png"
theme.menu_border_color = "#eeeeee"
theme.menu_height = "14"
theme.menu_width  = "90"

-- WALLPAPER
--theme.wallpaper_cmd = { "awsetbg /home/jack/.background/bg.png" }
theme.wallpaper_cmd = { "imlibsetroot -s /home/jack/.background/bgday.png" }
return theme
