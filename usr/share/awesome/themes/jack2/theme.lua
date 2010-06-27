---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "terminus 9"

theme.bg_normal     = "#1a1918"
theme.bg_focus      = "#333231"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#1a1918"

theme.fg_normal     = "#807b76"
theme.fg_focus      = "#9bcd32"
theme.fg_urgent     = "#f48a8a"
theme.fg_minimize   = "#333231"

theme.border_width  = "1"
theme.border_normal = "#050505"
theme.border_focus  = "#333231"
theme.border_marked = "#a4a4a4"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/usr/share/awesome/themes/jack2/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/jack2/taglist/squarew.png"

theme.tasklist_floating_icon = "/usr/share/awesome/themes/jack2/tasklist/floatingw.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/usr/share/awesome/themes/jack2/submenu.png"
theme.menu_height = "15"
theme.menu_width  = "100"

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/jack2/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/jack2/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/jack2/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/jack2/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/jack2/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/jack2/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/jack2/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/jack2/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/jack2/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/jack2/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/jack2/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/jack2/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/jack2/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/jack2/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/jack2/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/jack2/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/jack2/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/jack2/titlebar/maximized_focus_active.png"

-- You can use your own command to set your wallpaper
theme.wallpaper_cmd = { "awsetbg /home/jack/.config/awesome/background/bg.png" }

-- You can use your own layout icons like this:
theme.layout_fairh = "/usr/share/awesome/themes/jack2/layouts/fairhw.png"
theme.layout_fairv = "/usr/share/awesome/themes/jack2/layouts/fairvw.png"
theme.layout_floating  = "/usr/share/awesome/themes/jack2/layouts/floatingw.png"
theme.layout_magnifier = "/usr/share/awesome/themes/jack2/layouts/magnifierw.png"
theme.layout_max = "/usr/share/awesome/themes/jack2/layouts/maxw.png"
theme.layout_fullscreen = "/usr/share/awesome/themes/jack2/layouts/fullscreenw.png"
theme.layout_tilebottom = "/usr/share/awesome/themes/jack2/layouts/tilebottomw.png"
theme.layout_tileleft   = "/usr/share/awesome/themes/jack2/layouts/tileleftw.png"
theme.layout_tile = "/usr/share/awesome/themes/jack2/layouts/tilew.png"
theme.layout_tiletop = "/usr/share/awesome/themes/jack2/layouts/tiletopw.png"
theme.layout_spiral  = "/usr/share/awesome/themes/jack2/layouts/spiralw.png"
theme.layout_dwindle = "/usr/share/awesome/themes/jack2/layouts/dwindlew.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome16g.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
