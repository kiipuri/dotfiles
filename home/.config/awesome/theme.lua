local dpi = require"beautiful.xresources".apply_dpi

local theme = {}

theme.border_width      = dpi(3)
theme.border_normal     = "#333333"
theme.border_focus      = "#1dd6ff"
theme.fg_normal         = "#caccfa"
theme.bg_normal         = "#1A1B26"
theme.bg_widget         = "#303245"
theme.taglist_bg_focus  = "#accaac"
theme.taglist_fg_focus  = "#000000"

theme.useless_gap = 10
theme.font = "JetBrainsMono Nerd Font Regular 10"

return theme
