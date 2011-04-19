---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "terminus 8"

theme.bg_normal     = "#000000"
theme.bg_focus      = "#000000"
theme.bg_urgent     = "#b23535"
theme.bg_minimize   = "#000000"

theme.fg_normal     = "#4c4c4c"
theme.fg_focus      = "#be6e00"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#1a1a1a"

theme.border_width  = "1"
theme.border_normal = "#050505"
theme.border_focus  = "#313233"
theme.border_marked = "#a4a4a4"

-- TAGLIST
theme.taglist_squares_sel   = "/home/jack/.config/awesome/themes/jack2/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/jack/.config/awesome/themes/jack2/taglist/squarew.png"

-- TASKLIST
theme.tasklist_floating_icon = "/home/jack/.config/awesome/themes/jack2/tasklist/floatingw.png"

-- MENU
theme.menu_submenu_icon = "/home/jack/.config/awesome/themes/jack2/submenu.png"
theme.menu_border_color = "#0a0a0a"
theme.menu_height = "14"
theme.menu_width  = "90"

-- WALLPAPER
theme.wallpaper_cmd = { "awsetbg /home/jack/.config/awesome/background/bg.png" }

return theme
