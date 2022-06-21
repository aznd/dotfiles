local apps = {
    terminal = "st",
    launcher = "sh /home/user/.config/rofi/launch.sh",
    launcherext = "rofi -show run",
    notifications = require("widgets.volume-brightness-notifications"), 
    switcher = require("widgets.alt-tab"), 
    xrandr = "lxrandr", 
    screenshot = "scrot -p -e 'echo $f'", 
    volume = "pavucontrol", 
    appearance = "lxappearance", 
    browser = "firefox", 
    fileexplorer = "thunar",
}

user = {
    terminal = "st",
    floating_terminal = "st"
}

return apps
