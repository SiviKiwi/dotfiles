-- Standard awesome library
local awful = require("awful")


-- Start compositor
awful.spawn.with_shell("picom")

-- Set wallpaper
awful.spawn.with_shell("nitrogen --restore")
