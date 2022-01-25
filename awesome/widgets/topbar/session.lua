local beautiful = require("beautiful")

local button = require("components.button")

local color = beautiful.blue
local color_hover = beautiful.blue_light

return button.create_text(color, color_hover, "Menu", "Fira Mono 14", function()
    awesome.emit_signal("dashboard::toggle")
end)
