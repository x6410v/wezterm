-- This is needed for Wezterm API 
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Necessities
-- Font
config.font = wezterm.font('JetBrains Mono', { weight = 'DemiBold' })
config.font_size = 15
-- Window 
config.window_decorations = "RESIZE"
-- System
config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

-- optional
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10
config.color_scheme = 'Catppuccin Mocha'

-- Keybindings
config.keys = {
  -- Vertical split with CTRL+SHIFT+ALT+' (single quote key)
  {
    key = '"',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Horizontal split with CTRL+SHIFT+ALT+'-' (dash key)
  {
    key = '|',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}

return config
