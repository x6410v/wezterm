-- Pull in WezTerm API
local wezterm = require 'wezterm'

-- Helper function:
-- returns color scheme dependant on operating system theme setting (dark/light)
local function color_scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Tokyo Night"
  else
    return "Catppuccin Mocha"
  end
end

-- Initialize config with proper error handling
local config = wezterm.config_builder and wezterm.config_builder() or {}

-- Wezterm update settings
config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

-- Appearance
config.font = wezterm.font_with_fallback({
  'JetBrains Mono',
})
config.font_size = 14.0
config.color_scheme = color_scheme_for_appearance(wezterm.gui.get_appearance())
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = false
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

-- Add tab bar styling for better visibility with transparency
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- Keybindings
config.keys = {
  -- Default QuickSelect keybind (CTRL-SHIFT-Space) gets captured by something
  -- else on my system
  {
    key = 'A',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.QuickSelect,
  },
}

-- Return config to WezTerm
return config
