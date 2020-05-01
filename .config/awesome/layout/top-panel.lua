local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local pywal = require ("theme.my_first_theme.pywal")

local icons = require('theme.icons')
-- local theme = require('theme.')
local dpi = beautiful.xresources.apply_dpi

local clickable_container = require('widgets.clickable-container')
local task_list = require('widgets.task-list')



local TopPanel = function(s, offset)
	local offsetx = 0
	if offset == true then
		offsetx = dpi(45)
	end

	local panel = wibox
	{
		ontop = true,
		screen = s,
		type = 'dock',
		height = dpi(28),
		width = s.geometry.width - offsetx - dpi(10),
		x = s.geometry.x + offsetx + dpi(5),
		y = s.geometry.y + dpi(5),
		stretch = false,
		bg = "#ffffff00",
	}
	

	panel:struts
	{
		top = dpi(28),
		-- bottom = s.geometry.y - dpi(10)
	}


	panel:connect_signal(
		'mouse::enter',
		function() 
			local w = mouse.current_wibox
			if w then
				w.cursor = 'left_ptr'
			end
		end

	)


	s.add_button = wibox.widget {
		{
			{
				{
					{
						image = icons.plus,
						resize = true,
						widget = wibox.widget.imagebox
					},
					margins = dpi(4),
					widget = wibox.container.margin
				},
				widget = clickable_container
			},
			bg = beautiful.transparent,
			shape = gears.shape.circle,
			widget = wibox.container.background
		},
		margins = dpi(4),
		widget = wibox.container.margin
	}

	s.add_button:buttons(
		gears.table.join(
			awful.button(
				{},
				1,
				nil,
				function()
					awful.spawn(
						awful.screen.focused().selected_tag.defaultApp,
						{
							tag = mouse.screen.selected_tag,
							placement = awful.placement.bottom_right
						}
					)
				end
			)
		)
	)


	local layout_box = function(s)
		local layoutbox = wibox.widget {
			{
				awful.widget.layoutbox(s),
				margins = dpi(7),
				widget = wibox.container.margin,
			},
			widget = clickable_container,
			bg = pywal.colors.color13,
		}
		layoutbox:buttons(
			awful.util.table.join(
				awful.button(
					{},
					1,
					function()
						awful.layout.inc(1)
					end
				),
				awful.button(
					{},
					3,
					function()
						awful.layout.inc(-1)
					end
				),
				awful.button(
					{},
					4,
					function()
						awful.layout.inc(1)
					end
				),
				awful.button(
					{},
					5,
					function()
						awful.layout.inc(-1)
					end
				)
			)
		)
		return layoutbox
	end


	s.clock_widget = wibox.widget.textclock(
		'<span font="Iosevka Bold 11">%a %d-%m-%Y, %H:%M</span>',
		1
	)

	s.clock_widget = wibox.widget {
		{
			s.clock_widget,
			margins = dpi(7),
			widget = wibox.container.margin,
		},
		widget = clickable_container,
		bg = pywal.colors.color13,
		fg = pywal.colors.color0
	}


	s.clock_widget:connect_signal(
		'mouse::enter',
		function()
			local w = mouse.current_wibox
			if w then
				old_cursor, old_wibox = w.cursor, w
				w.cursor = 'hand1'
			end
		end
	)


	s.clock_widget:connect_signal(
		'mouse::leave',
		function()
			if old_wibox then
				old_wibox.cursor = old_cursor
				old_wibox = nil
			end
		end
	)

	s.clock_tooltip = awful.tooltip
	{
		objects = {s.clock_widget},
		mode = 'outside',
		delay_show = 1,
		preferred_positions = {'right', 'left', 'top', 'bottom'},
		preferred_alignments = {'middle'},
		margin_leftright = dpi(8),
		margin_topbottom = dpi(8),
		timer_function = function()
			local ordinal = nil

			local day = os.date('%d')
			local month = os.date('%B')

			local first_digit = string.sub(day, 0, 1) 
			local last_digit = string.sub(day, -1) 

			if first_digit == '0' then
			  day = last_digit
			end


			if last_digit == '1' and day ~= '11' then
			  ordinal = 'st'
			elseif last_digit == '2' and day ~= '12' then
			  ordinal = 'nd'
			elseif last_digit == '3' and day ~= '13' then
			  ordinal = 'rd'
			else
			  ordinal = 'th'
			end

			local date_str = 'Today is the ' ..
			'<b>' .. day .. ordinal .. 
			' of ' .. month .. '</b>.\n' ..
			'And it\'s fucking ' .. os.date('%A')

			return date_str

		end,
	}


	s.clock_widget:connect_signal(
		'button::press', 
		function(self, lx, ly, button)
			-- Hide the tooltip when you press the clock widget
			if s.clock_tooltip.visible and button == 1 then
				s.clock_tooltip.visible = false
			end
		end
	)


	s.month_calendar      = awful.widget.calendar_popup.month({
		start_sunday      = true,
		spacing           = dpi(5),
		font              = 'Iosevka 10',
		long_weekdays     = true,
		margin            = dpi(5),
		screen            = s,
		style_month       = { 
			border_width    = dpi(0), 
			padding         = dpi(20),
			shape           = function(cr, width, height)
				gears.shape.partially_rounded_rect(
					cr, width, height, true, true, true, true, beautiful.groups_radius
				)
			end
		},  
		style_header      = { 
			border_width    = 0, 
			bg_color        = beautiful.transparent
		},
		style_weekday     = { 
			border_width    = 0, 
			bg_color        = beautiful.transparent
		},

		style_normal      = { 
			border_width    = 0, 
			bg_color        = beautiful.transparent
		},
		style_focus       = { 
			border_width    = dpi(0), 
			border_color    = beautiful.fg_normal, 
			bg_color        = beautiful.accent, 
			shape           = function(cr, width, height)
				gears.shape.partially_rounded_rect(
					cr, width, height, true, true, true, true, dpi(4))
			end,
		},
	})


	s.month_calendar:attach(
		s.clock_widget, 
		'tc', 
		{ 
			on_pressed = true,
			on_hover = false 
		}
	)


	s.systray = wibox.widget {
		visible = false,
		base_size = 20,
		horizontal = true,
		screen = 'primary',
		widget = wibox.widget.systray,
		bg = pywal.colors.color13
	}


--	s.tray_toggler  = require('widget.tray-toggler')
--	s.updater 		= require('widget.package-updater')()
	s.screen_rec 	= require('widgets.screen-recorder')()
--	s.music       	= require('widget.music')()
	s.bluetooth   	= require('widgets.bluetooth')()
	s.wifi        	= require('widgets.wifi')()
	s.battery     	= require('widgets.battery')()
--	s.search      	= require('widget.search-apps')()
--	s.r_dashboard 	= require('widget.right-dashboard')()
	s.volume 	= require('widgets.volume.volume-slider')
	volume_bar_widget = require("awesome-wm-widgets.volumebar-widget.volumebar")()
s.mytaglist = awful.widget.taglist {
	screen  = s,
	filter  = awful.widget.taglist.filter.all,
	buttons = taglist_buttons,
	bg = "#ffffff",
	fg = "#000000"
}

	panel : setup {
		layout = wibox.layout.align.horizontal,
		expand = "none",
		fg = pywal.colors.color13,
		{
			layout = wibox.layout.fixed.horizontal,
			s.mytaglist,
		}, 
		s.clock_widget,
		{
			layout = wibox.layout.fixed.horizontal,
			-- spacing = dpi(5),
			{
				s.systray,
				margins = dpi(5),
				widget = wibox.container.margin,
			},
			-- s.volume,
			-- volume_bar_widget,
			{
				wibox.container.margin(volume_bar_widget, dpi(5), dpi(5)),
				widget = clickable_container,
				bg = pywal.colors.color13
			},
			s.screen_rec,
			s.bluetooth,
			s.wifi,
			s.battery,				
			layout_box(s),
		}
	}

	return panel
end


return TopPanel

