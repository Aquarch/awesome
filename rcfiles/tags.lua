-- Libs
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
local lain = require("lain")

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
--	lain.layout.termfair,
--	lain.layout.centerfair,
	lain.layout.centerwork,
	lain.layout.uselessfair,
	lain.layout.uselesstile,
	lain.layout.uselesspiral,
    awful.layout.suit.floating,
    awful.layout.suit.tile,
--  awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
--  awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
--  awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
       names = { "terminal", "web", "arquivo", "mídia", "etc"},
       layout = { layouts[1], layouts[5], layouts[2], layouts[11], layouts[3] }
       }
for s = 1, screen.count() do
   tags[s] = awful.tag(tags.names, s, tags.layout)
end
