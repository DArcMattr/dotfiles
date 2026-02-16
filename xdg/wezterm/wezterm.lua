local wezterm = require 'wezterm'

local act = wezterm.action
local config = wezterm.config_builder()
local mux = wezterm.mux

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
config.unix_domains = {
  {
    name = 'unix',
  },
}
config.default_gui_startup_args = { 'connect', 'unix' }
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = 'NONE'

wezterm.on('update-status', function(window, _)
    local SOLID_LEFT_ARROW = ""
    local prefix = ""
    local date = wezterm.strftime '%Y-%m-%d %H:%M:%S'

    -- Initialize with a default (empty string or specific color)
    -- so it's never nil when wezterm.format is called
    local ARROW_FOREGROUND = { Text = "" }

    if window:leader_is_active() then
        prefix = " " .. utf8.char(0x1f47e) .. " "
        SOLID_LEFT_ARROW = utf8.char(0xe0b2)

        if window:active_tab():tab_id() ~= 0 then
            ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
        else
            -- Using 'else' is cleaner than two 'if' statements for tab_id == 0
            ARROW_FOREGROUND = { Foreground = { Color = "#C6A0F6" } }
        end
    end

    window:set_left_status(wezterm.format{
        { Background = { Color = "#b7bdf8" } },
        { Text = prefix },
        ARROW_FOREGROUND, -- This is now guaranteed to be a valid table
        { Text = SOLID_LEFT_ARROW },
    })

    window:set_right_status(wezterm.format{
        { Background = { Color = "#dd3333" } },
        { Foreground = { Color = "#eeeeee" } },
        { Text = date },
        -- Removed the empty { } table that was causing the 0 keys error
    })
end)

wezterm.on('mux-startup', function()
  local workspace = 'Main'
  local windows = mux.all_windows()
  local window
  local tab1
  local pane1
  if #windows > 0 then
    window = windows[1]
    tab1 = window:active_tab()
    pane1 = tab1:active_pane()
  else
    tab1, pane1, window = mux.spawn_window { workspace = workspace }
  end
  window:set_workspace(workspace)
  tab1:set_title('Home')
  pane1:split { direction = 'Right', size = 0.5 }

  local tab2, _, _ = window:spawn_tab { args = { 'btop' } }
  tab2:set_title('btop')

  local handmade_dir = wezterm.home_dir .. '/projects/handmade'
  local tab3, pane3, _ = window:spawn_tab { cwd = handmade_dir }

  tab3:set_title('Handmade')
  local p3_right = pane3:split {
    direction = 'Right',
    size = 0.666,
    top_level = true,
  }

  p3_right:split {
    direction = 'Bottom',
    size = 0.2,
  }

  pane1:activate()
  p3_right:activate()
  tab1:activate()
end)

return config
