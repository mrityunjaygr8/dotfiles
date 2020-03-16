local gears = require("gears")
local awful = require("awful")
local os = { getenv = os.getenv }
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility
local pywal = require ("themes.my_first_theme.pywal")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local theme                                     = {}
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/my_first_theme/"
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
theme.titlebar_close_button = "true"
theme.menu_height                               = dpi(15)
theme.menu_width                                = dpi(100)
theme.tasklist_plain_task_name                  = false
theme.tasklist_disable_icon                     = false
theme.useless_gap                               = 5

return theme
