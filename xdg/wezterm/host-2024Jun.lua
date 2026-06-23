local wezterm = require 'wezterm'
local mux = wezterm.mux

wezterm.log_info('Loaded host config file')

local wezterm = require 'wezterm'

wezterm.on('mux-startup', function()
    wezterm.log_info('mux-startup: building layout')

    local tab1, pane1, window = mux.spawn_window({})

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
        top_level = true
    }
    p3_right:split { direction = 'Bottom', size = 0.2 }

    tab1:activate()
end)

wezterm.on('gui-attached', function(domain)
    wezterm.log_info('gui-attached: maximizing window')
    for _, window in ipairs(mux.all_windows()) do
        local gui_win = window:gui_window()
        if gui_win then
            gui_win:maximize()
        end
    end
end)

