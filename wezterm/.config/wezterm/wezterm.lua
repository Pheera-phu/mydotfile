local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.font_size = 12
config.font = wezterm.font("JetBrains Mono", { weight = "Bold" })

config.colors = {
  cursor_bg = "white",
  cursor_border = "white"
}

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0
}

config.background = {
  {
    source = {
      File = "/.config/wezterm/assets/a_triangle_shaped_object_with_a_blue_and_white_light.png",
    },
    hsb = {
      hue = 1.0,
      saturation = 1.02,
      brightness = 0.25
    },
    width = "100%",
    height = "100%"
  },
  {
    source = {
      Color = "#282c35"
    },
    width = "100%",
    height = "100%",
    opacity = 0.55
  }
}

config.max_fps = 120
config.prefer_egl = true

return config
