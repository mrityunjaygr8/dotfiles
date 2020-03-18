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
theme.dir                                       = themes_path .. "/my_first_theme/"
theme.icons					= icon_dir
theme.wallpaper                                 = pywal.wallpaper
theme.font                                      = "Iosevka 12"
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
theme.tasklist_bg_focus                         = theme.bg_focus
theme.titlebar_bg_focus                         = theme.bg_focus
theme.titlebar_bg_normal                        = theme.bg_normal
theme.titlebar_fg_focus                         = theme.fg_focus
theme.titlebar_close_button 			= "true"
theme.menu_height                               = dpi(30)
theme.menu_width                                = dpi(200)
theme.tasklist_plain_task_name                  = false
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 5

-- Icon Theme
theme.icon_theme				= "Papirus"

-- Layout Icons
theme.layout_max				= theme.icons .. 'layouts/max.svg'
theme.layout_tile				= theme.icons .. 'layouts/tile.svg'
theme.layout_dwindle 				= theme.icons .. 'layouts/dwindle.svg'
theme.layout_floating 				= theme.icons .. 'layouts/floating.svg'
return theme
