local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font_size = 11
-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold" })
config.font = wezterm.font("JetBrainsMono Nerd Font")

config.treat_east_asian_ambiguous_width_as_wide = false
config.line_height = 1.1

config.colors = {
  cursor_bg = "white",
  cursor_border = "white"
}

config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0
}

config.window_background_opacity = 0.5
config.macos_window_background_blur = 30

config.max_fps = 120
config.prefer_egl = true

return config
