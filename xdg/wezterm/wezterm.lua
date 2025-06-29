local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local mux = wezterm.mux

config.hide_tab_bar_if_only_one_tab = true
config.scrollback_lines = 0
config.window_decorations = "RESIZE"

config.font = wezterm.font_with_fallback {
  -- 'Delugia',
  'Cascadia Code PL',
  -- 'codicon',
  -- 'Segoe UI Symbol',
  -- 'Segoe UI Emoji',
  -- 'Noto Color Emoji',
  -- 'Symbola',
  -- 'Twemoji',
}
config.font_size = 9.0
config.color_scheme = 'Campbell (Gogh)'
config.audible_bell = 'Disabled'
config.window_decorations = 'NONE'

wezterm.on('gui-startup', function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
