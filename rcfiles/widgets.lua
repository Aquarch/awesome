-- Libs
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")
vicious = require("vicious")
local lain = require("lain")

-- {{{ Wibox

bullets = wibox.widget.textbox("<span color='#0990ff'> ··· </span>")
spacer = wibox.widget.textbox("<span color='#0990ff'> </span>")
lwall = wibox.widget.textbox("<span color='#0990ff'>[</span>")
rwall = wibox.widget.textbox("<span color='#0990ff'> ]</span>")

-- Create a textclock widget
mytextclock = awful.widget.textclock()
lain.widgets.calendar:attach(mytextclock, { font_size = 8 })

-- MPD buttons
-- Play
playicon = wibox.widget.imagebox()
playicon:set_image("/home/aqua/.config/awesome/themes/Utopia/icons/png/play.png")
playicon:set_resize(false)
playicon:buttons(awful.util.table.join(
	awful.button({ }, 1, function () awful.util.spawn_with_shell("ncmpcpp play") end)
))

-- Pause
pauseicon = wibox.widget.imagebox()
pauseicon:set_image("/home/aqua/.config/awesome/themes/Utopia/icons/png/pause.png")
pauseicon:set_resize(false)
pauseicon:buttons(awful.util.table.join(
	awful.button({ }, 1, function () awful.util.spawn_with_shell("ncmpcpp pause") end)
))

-- Stop
stopicon = wibox.widget.imagebox()
stopicon:set_image("/home/aqua/.config/awesome/themes/Utopia/icons/png/stop.png")
stopicon:set_resize(false)
stopicon:buttons(awful.util.table.join(
	awful.button({ }, 1, function() awful.util.spawn_with_shell("ncmpcpp stop") end)
))

-- Next
nexticon = wibox.widget.imagebox()
nexticon:set_image("/home/aqua/.config/awesome/themes/Utopia/icons/png/next.png")
nexticon:set_resize(false)
nexticon:buttons(awful.util.table.join(
	awful.button ({ }, 1, function () awful.util.spawn_with_shell("ncmpcpp next") end)
))

-- Prev
previcon = wibox.widget.imagebox()
previcon:set_image("/home/aqua/.config/awesome/themes/Utopia/icons/png/prev.png")
previcon:set_resize(false)
previcon:buttons(awful.util.table.join(
	awful.button ({ }, 1, function () awful.util.spawn_with_shell("ncmpcpp prev") end)
))

-- MPD widget/
mpdwidget = wibox.widget.textbox()
vicious.register(mpdwidget, vicious.widgets.mpd,
	function (mpdwidget, args)
		if args["{state}"] == "Stop" then 
			return " (Parado) "
		else 
			return args["{Artist}"]..' - '.. args["{Title}"]
        end
end, 10)
mpdicon = wibox.widget.imagebox()
mpdicon:set_image("/home/aqua/.config/awesome/themes/Utopia/icons/png/note.png")
mpdicon:set_resize(false)

-- Volume widget
volwidget = wibox.widget.textbox()
vicious.register(volwidget, vicious.widgets.volume, "<span color='#333333'>$1 %</span>", 1, "Master")
volicon = wibox.widget.imagebox()
volicon:set_image("/home/aqua/.config/awesome/themes/Utopia/icons/png/spkr_01.png")
volicon:set_resize(false)

-- Battery widget
batwidget = wibox.widget.textbox()
vicious.register(batwidget, vicious.widgets.bat, "<span color='#333333'>$2 % $1</span>", 60, "BAT1")
baticon = wibox.widget.imagebox()
baticon:set_image("/home/aqua/.config/awesome/themes/Utopia/icons/png/bat_full_01.png")
baticon:set_resize(false)

-- Net widget
wifiwidget = wibox.widget.textbox()
vicious.register(wifiwidget, vicious.widgets.wifi, "<span color='#333333'>${linp} %</span>", 10, "wlp2s0")
wificon = wibox.widget.imagebox()
wificon:set_image("/home/aqua/.config/awesome/themes/Utopia/icons/png/wifi_01.png")
wificon:set_resize(false)

-- CPU usage widget
cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, "<span color='#333333'>$1 %</span>", 3)
cpuicon = wibox.widget.imagebox()
cpuicon:set_image("/home/aqua/.config/awesome/themes/Utopia/icons/png/cpu.png")
cpuicon:set_resize(false)

-- Memory usage widget
memwidget = wibox.widget.textbox()
vicious.register(memwidget, vicious.widgets.mem, "<span color='#333333'>$1 %</span>", 3)
memicon = wibox.widget.imagebox()
memicon:set_image("/home/aqua/.config/awesome/themes/Utopia/icons/png/mem.png")
memicon:set_resize(false)

-- Create a wibox for each screen and add it
mywibox = {}
mybottomwibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", height = "16", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    right_layout:add(mytextclock)
    right_layout:add(exitlauncher)
    right_layout:add(spacer)

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)

    -- Create the bottom wibox
    mybottomwibox[s] = awful.wibox({ position = "bottom", height = "14", screen = s })

    -- Widgets that are aligned in the left
    local bottom_left_layout = wibox.layout.fixed.horizontal()
    bottom_left_layout:add(bullets)
    bottom_left_layout:add(previcon)
    bottom_left_layout:add(stopicon)
    bottom_left_layout:add(pauseicon)
    bottom_left_layout:add(playicon)
    bottom_left_layout:add(nexticon)
    bottom_left_layout:add(lwall)
    bottom_left_layout:add(mpdicon)
    bottom_left_layout:add(mpdwidget)
    bottom_left_layout:add(rwall)

    -- Widgets that are aligned in the right
    local bottom_right_layout = wibox.layout.fixed.horizontal()
    bottom_right_layout:add(lwall)
    bottom_right_layout:add(volicon)
    bottom_right_layout:add(volwidget)
    bottom_right_layout:add(rwall)
    bottom_right_layout:add(spacer)
    bottom_right_layout:add(lwall)
    bottom_right_layout:add(baticon)
    bottom_right_layout:add(batwidget)
    bottom_right_layout:add(rwall)
    bottom_right_layout:add(spacer)
    bottom_right_layout:add(lwall)
    bottom_right_layout:add(wificon)
    bottom_right_layout:add(wifiwidget)
    bottom_right_layout:add(rwall)
    bottom_right_layout:add(spacer)
    bottom_right_layout:add(lwall)
    bottom_right_layout:add(cpuicon)
    bottom_right_layout:add(cpuwidget)
    bottom_right_layout:add(rwall)
    bottom_right_layout:add(spacer)
    bottom_right_layout:add(lwall)
    bottom_right_layout:add(memicon)
    bottom_right_layout:add(memwidget)
    bottom_right_layout:add(rwall)
    bottom_right_layout:add(mylayoutbox[s])
    bottom_right_layout:add(bullets)

    -- Now bring bottom wibox together
    local bottom_layout = wibox.layout.align.horizontal()
    bottom_layout:set_left(bottom_left_layout)
    bottom_layout:set_right(bottom_right_layout)
    mybottomwibox[s]:set_widget(bottom_layout)

end
-- }}}

