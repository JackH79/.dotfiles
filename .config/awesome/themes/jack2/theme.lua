---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "terminus 9"

theme.bg_normal     = "#1a1918"
theme.bg_focus      = "#1a1918"
theme.bg_urgent     = "#b23535"
theme.bg_minimize   = "#1a1918"

theme.fg_normal     = "#807b76"
theme.fg_focus      = "#9acd32"
theme.fg_urgent     = "#b2b2b2"
theme.fg_minimize   = "#333231"

theme.border_width  = "1"
theme.border_normal = "#050505"
theme.border_focus  = "#333231"
theme.border_marked = "#a4a4a4"

-- TAGLIST
theme.taglist_squares_sel   = "/home/jack/.config/awesome/themes/jack2/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/jack/.config/awesome/themes/jack2/taglist/squarew.png"

theme.tasklist_floating_icon = "/home/jack/.config/awesome/themes/jack2/tasklist/floatingw.png"

-- MENU
theme.menu_submenu_icon = "/home/jack/.config/awesome/themes/jack2/submenu.png"
theme.menu_height = "14"
theme.menu_width  = "100"

-- WALLPAPER
theme.wallpaper_cmd = { "awsetbg /home/jack/.config/awesome/background/bg.png" }

return theme
