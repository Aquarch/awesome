--------------------------
-- Utopia awesome theme --
--------------------------

-- Default colors
-- Bg: #c6c6c6
-- Black: #000000
-- White: #ffffff
-- Blue: #0990ff
-- Pink: #c66cff

theme = {}

theme.font          = "DejaVu Sans Mono Book 7.5"

theme.bg_normal     = "#C6C6C6"
theme.bg_focus      = theme.bg_normal
theme.bg_urgent     = theme.bg_normal
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#666666"
theme.fg_focus      = theme.fg_normal
theme.fg_urgent     = theme.fg_normal
theme.fg_minimize   = "#999999"

theme.border_width  = 0
theme.border_normal = "#000000"
theme.border_focus  = "#ffffff"
theme.border_marked = "#cccccc"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Taglist
theme.taglist_bg_focus = theme.bg_focus
theme.taglist_bg_urgent = theme.bg_urgent

theme.taglist_fg_focus = "#0990ff"
theme.taglist_fg_urgent = "#0000ff"

-- Tasklist
theme.tasklist_bg_focus = theme.bg_focus
theme.tasklist_bg_urgent = theme.bg_urgent

theme.tasklist_fg_focus = "#333333"
theme.tasklist_fg_urgent = "#0a0a0a"

-- Display the taglist squares
theme.taglist_squares_sel   = "/home/aqua/.config/awesome/themes/Utopia/taglist/squarefw.png"
theme.taglist_squares_unsel = "/home/aqua/.config/awesome/themes/Utopia/taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/home/aqua/.config/awesome/themes/Utopia/submenu.png"
theme.menu_height = 18
theme.menu_width  = 150
theme.menu_bg_normal = "#c6c6c6"
theme.menu_bg_focus = "#9e9e9e"
theme.menu_fg_normal = theme.fg_normal
theme.menu_fg_focus = "#0990ff"
theme.menu_border_color = "#000000"
theme.menu_border_width = 0

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"

theme.wallpaper = "/home/aqua/.config/awesome/themes/Utopia/wallpaper.png"

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/aqua/.config/awesome/themes/Utopia/layouts/fairh.png"
theme.layout_fairv = "/home/aqua/.config/awesome/themes/Utopia/layouts/fairv.png"
theme.layout_floating  = "/home/aqua/.config/awesome/themes/Utopia/layouts/floating.png"
theme.layout_magnifier = "/home/aqua/.config/awesome/themes/Utopia/layouts/magnifier.png"
theme.layout_max = "/home/aqua/.config/awesome/themes/Utopia/layouts/max.png"
theme.layout_fullscreen = "/home/aqua/.config/awesome/themes/Utopia/layouts/fullscreen.png"
theme.layout_tilebottom = "/home/aqua/.config/awesome/themes/Utopia/layouts/tilebottom.png"
theme.layout_tileleft   = "/home/aqua/.config/awesome/themes/Utopia/layouts/tileleft.png"
theme.layout_tile = "/home/aqua/.config/awesome/themes/Utopia/layouts/tile.png"
theme.layout_tiletop = "/home/aqua/.config/awesome/themes/Utopia/layouts/tiletop.png"
theme.layout_spiral  = "/home/aqua/.config/awesome/themes/Utopia/layouts/spiral.png"
theme.layout_dwindle = "/home/aqua/.config/awesome/themes/Utopia/layouts/dwindle.png"

theme.useless_gap_width = 10

theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"
theme.arch_icon =  "/home/aqua/.config/awesome/themes/Distopia/menu.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
