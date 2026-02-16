local wezterm = require 'wezterm'

local act = wezterm.action
local config = wezterm.config_builder()
local mux = wezterm.mux
local hostname = wezterm.hostname()

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
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_max_width = 32
config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top/bottom of the tabs
    background = '#1e1e2e',

    -- The active tab (The one you're on)
    active_tab = {
      bg_color = '#89b4fa',
      fg_color = '#1e1e2e',
      intensity = 'Bold',
    },

    -- Inactive tabs
    inactive_tab = {
      bg_color = '#313244',
      fg_color = '#cdd6f4',
    },

    -- Hovering over a tab
    inactive_tab_hover = {
      bg_color = '#45475a',
      fg_color = '#f5e0dc',
    },
  },
}
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = 'NONE'

wezterm.on('update-status', function(window, pane)
  local cells = {}
  local ARROW = utf8.char(0xe0b0)
  local ARROW_LEFT = utf8.char(0xe0b2)

  local blue_bg = '#005fff'
  local grey_bg = '#3a3a3a'
  local white_fg = '#ffffff'

  window:set_left_status(wezterm.format{
    { Background = { Color = blue_bg } },
    { Foreground = { Color = white_fg } },
    { Text = '  ' .. window:active_workspace() .. '  ' },

    { Foreground = { Color = blue_bg } },
    { Background = { Color = grey_bg } },
    { Text = ARROW },

    { Foreground = { Color = white_fg } },
    { Text = ' ' .. wezterm.hostname() .. ' ' },

    { Foreground = { Color = grey_bg } },
    { Background = { Color = 'none' } },
    { Text = ARROW },
  })

  local date = wezterm.strftime('%b %d %H:%M')
  local time = wezterm.strftime('%H:%M %z')

  local success, stdout, stderr = wezterm.run_child_process({ 'uptime', '-p' })
  local uptime = success and stdout:gsub('^up ', ''):gsub('\n', '') or '?'

  window:set_right_status(wezterm.format({
    -- Uptime Segment
    { Foreground = { Color = '#3a3a3a' } },
    { Text = ARROW_LEFT },
    { Background = { Color = '#3a3a3a' } },
    { Foreground = { Color = '#ffffff' } },
    { Text = ' ' .. uptime .. ' ' },

    { Foreground = { Color = '#8a8a8a' } },
    { Background = { Color = '#3a3a3a' } },
    { Text = ARROW_LEFT },
    { Background = { Color = '#8a8a8a' } },
    { Foreground = { Color = '#1c1c1c' } },
    { Text = ' ' .. date .. ' ' },

    { Foreground = { Color = '#8a8a8a' } },
    { Background = { Color = '#3a3a3a' } },
    { Text = ARROW_LEFT },
    { Background = { Color = '#8a8a8a' } },
    { Foreground = { Color = '#1c1c1c' } },
    { Text = ' ' .. time .. ' ' },
  }))

  if window:leader_is_active() then
    table.insert(cells, { Background = { Color = '#fab387' } })
    table.insert(cells, { Foreground = { Color = '#1e1e2e' } })
    table.insert(cells, { Text = ' ' .. utf8.char(0x1f47e) .. ' ' })
  end

  if window:active_pane():is_zoomed() then
    table.insert(cells, { Background = { Color = '#f38ba8' } })
    table.insert(cells, { Text = ' ZOOM ' })
  end
end)

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local ARROW_RIGHT = utf8.char(0xe0b0) -- 
  local edge_background = '#1e1e2e' -- Match your main terminal bg
  local background = '#3a3a3a'
  local foreground = '#8a8a8a'

  if tab.is_active then
      background = '#005f87'
      foreground = '#ffffff'
  end

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = ' ' .. tab.tab_index + 1 .. ': ' .. tab.active_pane.title .. ' ' },
    { Background = { Color = edge_background } },
    { Foreground = { Color = background } },
    { Text = ARROW_RIGHT },
  }
end)

wezterm.log_info('Attempting to load config for host: ' .. hostname)

local success, err = pcall(require, 'host-' .. hostname)

if not success then
  wezterm.log_error('failed to load host config: ' .. tostring(err))
end


return config
