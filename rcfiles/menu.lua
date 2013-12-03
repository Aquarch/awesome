-- Libs
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
require("freedesktop.utils")
require("freedesktop.menu")

-- {{{ Menu

-- Freedesktop
menu_items = freedesktop.menu.new()

-- Create a laucher widget and a main menu
myawesomemenu = {
   { "Manual", terminal .. " -e man awesome" },
   { "Configurações", editor_cmd .. " " .. awesome.conffile },
   { "Reiniciar", awesome.restart },
   { "Sair", awesome.quit }
}

table.insert(menu_items, { "awesome", myawesomemenu, beautiful.awesome_icon })
table.insert(menu_items, { "Terminal", terminal, freedesktop.utils.lookup_icon({icon = 'terminal'}) })

mymainmenu = awful.menu.new({ items = menu_items })

mylauncher = awful.widget.launcher({ image = beautiful.arch_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Create an exit menu
exitmenu = {
	{ "Sair", awesome.quit },
	{ "Reiniciar", "sudo shutdown -r now" },
	{ "Desligar", "sudo shutdown -h now" }
}
myexitmenu = awful.menu.new({ items = exitmenu })

exitlauncher = awful.widget.launcher({ image = "/home/aqua/.config/awesome/themes/Utopia/exit.png",
					menu = myexitmenu })

exitlauncher:set_resize(false)
