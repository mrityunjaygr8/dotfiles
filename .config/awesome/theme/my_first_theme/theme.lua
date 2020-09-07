local gears = require("gears")
local awful = require("awful")
local os = { getenv = os.getenv }
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local pywal = require ("theme.my_first_theme.pywal")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local theme                                     = {}
local gfs = require("gears.filesystem")
local themes_path = gfs.get_configuration_dir() .. "/theme"
local icon_dir					= themes_path .. "/icons/"
local titlebar_theme = "stoplight"
local titlebar_icon_path = icon_dir .. "titlebar/" .. titlebar_theme .. '/'
local tip = titlebar_icon_path

theme.dir                                       = themes_path .. "/my_first_theme/"
theme.icons					                            = icon_dir
theme.wallpaper                                 = pywal.wallpaper
theme.font                                      = "SF Pro Display 11"
theme.fg_normal                                 = pywal.special.foreground
theme.fg_focus                                  = pywal.colors.color0
theme.fg_urgent                                 = pywal.colors.color0
theme.bg_normal                                 = pywal.colors.color0
theme.bg_focus                                  = pywal.colors.color13
theme.bg_urgent                                 = pywal.colors.color8
theme.border_width                              = dpi(1)
theme.border_normal                             = pywal.colors.color0
theme.border_focus                              = pywal.colors.color13
theme.border_marked                             = pywal.colors.color8
theme.tasklist_bg_focus                         = pywal.colors.color13
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.taglist_fg_focus                          = pywal.colors.color0
theme.taglist_fg_occupied                       = pywal.colors.color0
theme.taglist_fg_urgent                         = pywal.colors.color0
theme.taglist_fg_empty                          = pywal.colors.color0
theme.taglist_bg_focus                          = pywal.colors.color2
theme.taglist_bg_occupied                       = pywal.colors.color1
theme.taglist_bg_urgent                         = pywal.colors.color3
theme.taglist_bg_empty                          = pywal.colors.color13
-- theme.taglist_spacing                           = 2
theme.titlebar_close_button 			              = "true"
theme.menu_height                               = dpi(30)
theme.menu_width                                = dpi(200)
theme.tasklist_plain_task_name                  = false
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 5

-- Icon Theme
theme.icon_theme				= "Papirus"

-- Layout Icons
theme.layout_max			        = gears.color.recolor_image(theme.icons .. 'layouts/max.svg', pywal.colors.color0)
theme.layout_tile				      = gears.color.recolor_image(theme.icons .. 'layouts/tile.svg', pywal.colors.color0)
theme.layout_dwindle 				  = gears.color.recolor_image(theme.icons .. 'layouts/dwindle.svg', pywal.colors.color0)
theme.layout_floating 				= gears.color.recolor_image(theme.icons .. 'layouts/floating.svg', pywal.colors.color0)


-- Titlebar icons
-- Titlebar
	
theme.titlebar_size = dpi(34)
--theme.titlebar_bg_focus = beautiful.gtk.get_theme_variables().bg_color:sub(1,7) .. '66'
--theme.titlebar_bg_normal = beautiful.gtk.get_theme_variables().base_color:sub(1,7) .. '66'
--theme.titlebar_fg_focus = beautiful.gtk.get_theme_variables().fg_color .. '00'
--theme.titlebar_fg_normal = beautiful.gtk.get_theme_variables().fg_color .. '00'
--
-- Close Button
theme.titlebar_close_button_normal = tip .. "close_normal.svg"
theme.titlebar_close_button_focus  = tip .. "close_focus.svg"

-- Minimize Button
theme.titlebar_minimize_button_normal = tip .. "minimize_normal.svg"
theme.titlebar_minimize_button_focus  = tip .. "minimize_focus.svg"

-- Ontop Button
theme.titlebar_ontop_button_normal_inactive = tip .. "ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive  = tip .. "ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = tip .. "ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active  = tip .. "ontop_focus_active.svg"

-- Sticky Button
theme.titlebar_sticky_button_normal_inactive = tip .. "sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive  = tip .. "sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = tip .. "sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active  = tip .. "sticky_focus_active.svg"

-- Floating Button
theme.titlebar_floating_button_normal_inactive = tip .. "floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive  = tip .. "floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = tip .. "floating_normal_active.svg"
theme.titlebar_floating_button_focus_active  = tip .. "floating_focus_active.svg"

-- Maximized Button
theme.titlebar_maximized_button_normal_inactive = tip .. "maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive  = tip .. "maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = tip .. "maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active  = tip .. "maximized_focus_active.svg"

-- Hovered Close Button
theme.titlebar_close_button_normal_hover = tip .. "close_normal_hover.svg"
theme.titlebar_close_button_focus_hover  = tip .. "close_focus_hover.svg"

-- Hovered Minimize Buttin
theme.titlebar_minimize_button_normal_hover = tip .. "minimize_normal_hover.svg"
theme.titlebar_minimize_button_focus_hover  = tip .. "minimize_focus_hover.svg"

-- Hovered Ontop Button
theme.titlebar_ontop_button_normal_inactive_hover = tip .. "ontop_normal_inactive_hover.svg"
theme.titlebar_ontop_button_focus_inactive_hover  = tip .. "ontop_focus_inactive_hover.svg"
theme.titlebar_ontop_button_normal_active_hover = tip .. "ontop_normal_active_hover.svg"
theme.titlebar_ontop_button_focus_active_hover  = tip .. "ontop_focus_active_hover.svg"

-- Hovered Sticky Button
theme.titlebar_sticky_button_normal_inactive_hover = tip .. "sticky_normal_inactive_hover.svg"
theme.titlebar_sticky_button_focus_inactive_hover  = tip .. "sticky_focus_inactive_hover.svg"
theme.titlebar_sticky_button_normal_active_hover = tip .. "sticky_normal_active_hover.svg"
theme.titlebar_sticky_button_focus_active_hover  = tip .. "sticky_focus_active_hover.svg"

-- Hovered Floating Button
theme.titlebar_floating_button_normal_inactive_hover = tip .. "floating_normal_inactive_hover.svg"
theme.titlebar_floating_button_focus_inactive_hover  = tip .. "floating_focus_inactive_hover.svg"
theme.titlebar_floating_button_normal_active_hover = tip .. "floating_normal_active_hover.svg"
theme.titlebar_floating_button_focus_active_hover  = tip .. "floating_focus_active_hover.svg"

-- Hovered Maximized Button
theme.titlebar_maximized_button_normal_inactive_hover = tip .. "maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = tip .. "maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_normal_active_hover = tip .. "maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_focus_active_hover  = tip .. "maximized_focus_active_hover.svg"
return theme
