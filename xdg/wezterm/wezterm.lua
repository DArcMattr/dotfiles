local wezterm = require 'wezterm'

local act = wezterm.action
local config = wezterm.config_builder()
local mux = wezterm.mux
local hostname = wezterm.hostname()
-- must build with `LIBSSH2_SYS_USE_PKG_CONFIG=1 cargo build --release`
local tabline = wezterm.plugin.require('https://github.com/michaelbrusegard/tabline.wez')

config.color_scheme = 'Campbell (Gogh)'
config.exit_behavior = 'CloseOnCleanExit'
config.default_cursor_style = 'BlinkingBlock'
config.enable_scroll_bar = true
config.disable_default_key_bindings = true
config.font = wezterm.font_with_fallback{'Maple Mono', 'Twemoji'}
config.font_size = 9.0
config.hide_tab_bar_if_only_one_tab = false
config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.5,
}
config.keys = {
  { key = 'a', mods = 'LEADER|CTRL',  action=act{SendString='\x01'}},
  { key = '-', mods = 'LEADER',       action=act{SplitVertical={domain='CurrentPaneDomain'}}},
  { key = '\\',mods = 'LEADER',       action=act{SplitHorizontal={domain='CurrentPaneDomain'}}},
  { key = '%', mods = 'LEADER|SHIFT', action=act{SplitHorizontal={domain='CurrentPaneDomain'}}},
  { key = '"', mods = 'LEADER|SHIFT', action=act{SplitHorizontal={domain='CurrentPaneDomain'}}},
  { key = 's', mods = 'LEADER',       action=act{SplitVertical={domain='CurrentPaneDomain'}}},
  { key = 'v', mods = 'LEADER',       action=act{SplitHorizontal={domain='CurrentPaneDomain'}}},
  { key = 'o', mods = 'LEADER',       action='TogglePaneZoomState' },
  { key = 'z', mods = 'LEADER',       action='TogglePaneZoomState' },
  { key = 'c', mods = 'LEADER',       action=act{SpawnTab='CurrentPaneDomain'}},
  { key = 'h', mods = 'LEADER',       action=act{ActivatePaneDirection='Left'}},
  { key = 'j', mods = 'LEADER',       action=act{ActivatePaneDirection='Down'}},
  { key = 'k', mods = 'LEADER',       action=act{ActivatePaneDirection='Up'}},
  { key = 'l', mods = 'LEADER',       action=act{ActivatePaneDirection='Right'}},
  { key = 'LeftArrow',  mods = 'LEADER',  action=act{ActivatePaneDirection='Left'}},
  { key = 'DownArrow',  mods = 'LEADER',  action=act{ActivatePaneDirection='Down'}},
  { key = 'UpArrow',    mods = 'LEADER', action=act{ActivatePaneDirection='Up'}},
  { key = 'RightArrow', mods = 'LEADER', action=act{ActivatePaneDirection='Right'}},
  { key = 'PageUp',   mods = 'ALT',   action=act.ActivateTabRelative(1)},
  { key = 'PageDown', mods = 'ALT',   action=act.ActivateTabRelative(-1)},
  { key = 'H', mods = 'LEADER|SHIFT', action=act{AdjustPaneSize={'Left', 5}}},
  { key = 'J', mods = 'LEADER|SHIFT', action=act{AdjustPaneSize={'Down', 5}}},
  { key = 'K', mods = 'LEADER|SHIFT', action=act{AdjustPaneSize={'Up', 5}}},
  { key = 'L', mods = 'LEADER|SHIFT', action=act{AdjustPaneSize={'Right', 5}}},
  { key = 'P', mods = 'LEADER|SHIFT', action=act.ActivateCommandPalette },
  { key = '&', mods = 'LEADER|SHIFT', action=act{CloseCurrentTab={confirm=true}}},
  { key = 'd', mods = 'LEADER',       action=act{CloseCurrentPane={confirm=true}}},
  { key = 'x', mods = 'LEADER',       action=act{CloseCurrentPane={confirm=true}}},
  { key = '[', mods = 'LEADER',       action='ActivateCopyMode'},
  { key = 'p', mods = 'LEADER',       action=act.PasteFrom 'Clipboard'},
  { key = 'y', mods = 'LEADER',       action=act.CopyTo 'Clipboard'},
  { key = '=', mods = 'CTRL',         action=act.IncreaseFontSize},
  { key = '-', mods = 'CTRL',         action=act.DecreaseFontSize},
  { key = '0', mods = 'LEADER|CTRL',  action=act.ResetFontSize},
}
for i = 0, 9 do
  table.insert(config.keys, {
    key = tostring((i + 1) % 10),
    mods = 'LEADER',
    action = wezterm.action.ActivateTab(i),
  })
end
config.leader = { key='b', mods='ALT' }
config.default_workspace = 'Main'
config.enable_scroll_bar = true
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = 'NONE'

local OPACITY_FOCUSED = 1
local OPACITY_UNFOCUSED = 0.6666

wezterm.on('window-focus-changed', function(window, pane)
    local overrides = window:get_config_overrides() or {}

    if window:is_focused() then
        overrides.window_background_opacity = OPACITY_FOCUSED
        overrides.inactive_pane_hsb = { brightness = 0.8, saturation = 1.0 }
    else
        overrides.window_background_opacity = OPACITY_UNFOCUSED
        overrides.inactive_pane_hsb = { brightness = 0.4, saturation = 0.6 }
    end

    window:set_config_overrides(overrides)
end)

wezterm.log_info('Attempting to load config for host: ' .. hostname)

local success, err = pcall(require, 'host-' .. hostname)

if not success then
  wezterm.log_error('failed to load host config: ' .. tostring(err))
end

tabline.setup({
  options = {
    theme = config.colorscheme,
  },
  sections = {
    tabline_y = {
      'datetime',
      style = '%Y-%m-%d %H:%M %Z',
    },
  },
})

return config
