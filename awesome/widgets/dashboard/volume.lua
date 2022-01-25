-------------------------------------------------
-- Volume Arc Widget for Awesome Window Manager
-- Shows the current volume level
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/volumearc-widget

-- @author Pavel Makhov
-- @copyright 2018 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local beautiful = require("beautiful")
local spawn = require("awful.spawn")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local gears = require("gears")

local GET_VOLUME_CMD = 'amixer -D pulse sget Master'
local INC_VOLUME_CMD = 'amixer -D pulse sset Master 5%+'
local DEC_VOLUME_CMD = 'amixer -D pulse sset Master 5%-'
local TOG_VOLUME_CMD = 'amixer -D pulse sset Master toggle'

local widget = {}

local function worker(args)

    local args = args or {}

    local main_color = beautiful.blue
    local mute_color = beautiful.misc2
    
    local height = 4
    local image_size = 28

    local icon =  wibox.widget {
        image = beautiful.volume_up_grey_icon, 
        forced_height = image_size, 
        forced_width = image_size,
        widget = wibox.widget.imagebox
    }

    local progressbar = wibox.widget {
        value         = 1,
        color		  = main_color,
        background_color = mute_color,
        shape = function(cr, width, height)
            gears.shape.rounded_rect(cr, width, height, 6)
        end,
        forced_height = height,
        widget        = wibox.widget.progressbar
    }

    local progressbar_container = wibox.widget {
        nil,
        {
            {
                progressbar, 
                direction     = 'east',
                layout        = wibox.container.rotate,
            },
            left = 4, 
            right = 4, 
            bottom = 8,
            widget = wibox.container.margin
        }, 
        icon, 
        layout = wibox.layout.align.vertical
    }

    local update_bar = function(widget, stdout, _, _, _)
        local mute = string.match(stdout, "%[(o%D%D?)%]")   -- \[(o\D\D?)\] - [on] or [off]
        local volume = string.match(stdout, "(%d?%d?%d)%%") -- (\d?\d?\d)\%)
        volume = tonumber(string.format("% 3d", volume))

        widget.value = volume / 100;

        if mute == 'off' then
            icon.image = beautiful.volume_off_grey_icon
        elseif volume > 60 then
            icon.image = beautiful.volume_up_grey_icon
        elseif volume > 15 then 
            icon.image = beautiful.volume_down_grey_icon
        else
            icon.image = beautiful.volume_mute_grey_icon
        end

    end

    progressbar:connect_signal("button::press", function(_, _, _, button)
        if (button == 4) then awful.spawn(INC_VOLUME_CMD, false)
        elseif (button == 5) then awful.spawn(DEC_VOLUME_CMD, false)
        elseif (button == 1) then awful.spawn(TOG_VOLUME_CMD, false)
        end

        spawn.easy_async(GET_VOLUME_CMD, function(stdout, stderr, exitreason, exitcode)
            update_bar(progressbar, stdout, stderr, exitreason, exitcode)
        end)
    end)

    watch(GET_VOLUME_CMD, 1, update_bar, progressbar)

    return progressbar_container
end

return setmetatable(widget, { __call = function(_, ...) return worker(...) end })