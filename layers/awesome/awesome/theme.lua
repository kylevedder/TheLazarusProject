------------------------------------------------
--    "Zenburn" awesome theme                 --
--    By Adrian C. (anrxc)                    --
--    Modified by Kyle Vedder (kylevedder)    --
------------------------------------------------
local awful = require("awful")
local lain  = require("lain")
local gears = require("gears")
local themes_path = require("gears.filesystem").get_themes_dir()
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
theme.confdir = awful.util.getdir("config")
theme.wallpaper = function(s)
  local w = tonumber(s.geometry.width)
  local h = tonumber(s.geometry.height)
  if w < h then
    -- Vertical
    return (theme.confdir .. "/black.png")
  end
  -- Horizontal
  return (theme.confdir .. "/black.png")
end

-- }}}

-- {{{ Styles
theme.font      = "Iosevka 10"

-- {{{ Colors
theme.fg_normal  = "#FFFFFF"
theme.fg_focus   = "#FFFFFF"
theme.fg_urgent  = "#FF0000"
theme.bg_normal  = "#000000"
theme.bg_focus   = "#222222"
theme.bg_urgent  = "#550000"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = dpi(0)
theme.border_width  = dpi(1)
theme.border_normal = "#888888"
theme.border_focus  = "#FFFFFF"
theme.border_marked = "#000000"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#FF0000"
theme.titlebar_bg_normal = "#FF0000"
-- }}}


-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_fg_empty = "#555555"
theme.taglist_fg_focus = "#FFFFFF"
theme.taglist_fg_occupied = "#888888"
theme.taglist_font = "Iosevka 10"
-- }}}

theme.notification_border_width = dpi(2)
theme.notification_border_color = "#FFFFFF"

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}
theme.cpu_color = "#FFFFFF"
theme.up_color = "#FFFFFF"
theme.down_color = "#FFFFFF"
-- theme.memory_color = "#e0da37"
theme.memory_color = "#FFFFFF"
theme.battery_color = "#FFFFFF"
theme.date_color = "#FFFFFF"

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(15)
theme.menu_width  = dpi(150)
-- }}}

-- {{{ Icons
-- {{{ Taglist
--theme.taglist_squares_sel   = themes_path .. "zenburn/taglist/squarefz.png"
--theme.taglist_squares_unsel = themes_path .. "zenburn/taglist/squarez.png"
--theme.taglist_squares_resize = "false"

theme.widget_temp                               = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                            = theme.confdir .. "/icons/dish.png"
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                = theme.confdir .. "/icons/mem.png"
theme.widget_note                               = theme.confdir .. "/icons/note.png"
theme.widget_note_on                            = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                              = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                               = theme.confdir .. "/icons/mail.png"
theme.widget_batt                               = theme.confdir .. "/icons/battery.png"
theme.widget_clock                              = theme.confdir .. "/icons/clock.png"
theme.widget_vol                                = theme.confdir .. "/icons/spkr.png"
theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
-- }}}

-- {{{ Misc
-- theme.awesome_icon           = themes_path .. "zenburn/awesome-icon.png"
-- theme.menu_submenu_icon      = themes_path .. "default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle = theme.confdir .. "/icons/dwindle.png"
theme.layout_max = theme.confdir .. "/icons/max.png"
theme.layou_fullscreen = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating = theme.confdir .. "/icons/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themes_path .. "zenburn/titlebar/titlebutton-close@2.png"
theme.titlebar_close_button_normal = themes_path .. "zenburn/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = themes_path .. "zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "zenburn/titlebar/ontop_focus_inactive2.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_path .. "zenburn/titlebar/titlebutton-maximize@2.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "zenburn/titlebar/titlebutton-maximize@2.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "zenburn/titlebar/titlebutton-maximize@2.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "zenburn/titlebar/titlebutton-maximize@2.png"

theme.titlebar_floating_button_focus_active  = themes_path .. "zenburn/titlebar/titlebutton-close@2.png"
theme.titlebar_floating_button_normal_active = themes_path .. "zenburn/titlebar/titlebutton-close@2.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "zenburn/titlebar/titlebutton-close@2.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_path .. "zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "zenburn/titlebar/titlebutton-minimize@2.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "zenburn/titlebar/titlebutton-minimize@2.png"
-- }}}
-- }}}

return theme

