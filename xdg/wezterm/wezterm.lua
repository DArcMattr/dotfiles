local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux

config.wsl_domains = wezterm.default_wsl_domains()
config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 0
config.window_decorations = "RESIZE"

config.font = wezterm.font_with_fallback {
  'Cascadia Code PL',
  -- 'Noto Emoji',
  -- 'Segoe UI Emoji',
  -- 'Twemoji',
}
config.font_size = 9.0
config.color_scheme = 'Campbell (Gogh)'
config.audible_bell = 'Disabled'
config.window_frame = {
  border_top_color = 'black',
  border_right_color = 'black',
  border_bottom_color = 'black',
  border_left_color = 'black',
}
config.window_decorations = 'NONE'
config.window_padding = {
  left = '0.5cell',
  right = '0.5cell',
  top = '0.5cell',
  bottom = '0.5cell',
}

wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
