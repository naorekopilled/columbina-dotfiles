local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_schemes = {
  ['Columbina Night'] = {
    foreground = '#e2d6ff',
    background = '#0e1929',
    cursor_bg = '#c9508f',
    cursor_border = '#c9508f',
    cursor_fg = '#0b1624',
    selection_bg = '#c9508f',
    selection_fg = '#ffffff',
    ansi = { '#1a2c47', '#e85c6e', '#78d6aa', '#f0b46e', '#7fa8e8', '#c9508f', '#aed3e2', '#dce5f2' },
    brights = { '#2c4c70', '#f07a8a', '#9ae6c2', '#f6c98e', '#a3c2f0', '#e07ab0', '#c8e4ef', '#ffffff' },
    tab_bar = {
      background = '#0b1624',
      active_tab = { bg_color = '#1a2c47', fg_color = '#dce5f2' },
      inactive_tab = { bg_color = '#0b1624', fg_color = '#6b7d9c' },
      inactive_tab_hover = { bg_color = '#111d2f', fg_color = '#acabf2' },
      new_tab = { bg_color = '#0b1624', fg_color = '#6b7d9c' },
      new_tab_hover = { bg_color = '#111d2f', fg_color = '#c9508f' },
    },
  },
}
config.color_scheme = 'Columbina Night'

config.font = wezterm.font_with_fallback { 'JetBrains Mono', 'FantasqueSansM Nerd Font Mono' }
config.font_size = 11.5

-- see-through without blur: X11 mode below has no blur option that works without a warning
config.window_background_opacity = 0.9

config.window_padding = { left = 14, right = 14, top = 10, bottom = 10 }
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
-- X11 mode: KDE draws its title bar and WezTerm adds its own buttons to the tab row
config.enable_wayland = false
config.integrated_title_button_style = 'Windows'
config.window_frame = {
  active_titlebar_bg = '#0b1624',
  inactive_titlebar_bg = '#0b1624',
}

return config
