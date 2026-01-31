local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = 'Campbell (Gogh)'
config.exit_behavior = 'CloseOnCleanExit'
config.default_cursor_style = 'BlinkingBlock'
config.enable_scroll_bar = true
config.disable_default_key_bindings = true
config.font = wezterm.font_with_fallback{'Cascadia Code PL', 'Twemoji'}
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
  { key = 'p', mods = 'LEADER',       action=act.ActivateCommandPalette },
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
  { key = '&', mods = 'LEADER|SHIFT', action=act{CloseCurrentTab={confirm=true}}},
  { key = 'd', mods = 'LEADER',       action=act{CloseCurrentPane={confirm=true}}},
  { key = 'x', mods = 'LEADER',       action=act{CloseCurrentPane={confirm=true}}},
  { key = '[', mods = 'LEADER',       action='ActivateCopyMode'},
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
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = 'NONE'

wezterm.on("update-status", function(window, _)
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

return config
