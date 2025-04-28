-- wezterm.lua - Simple, Customizable, Documented WezTerm Config

local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

-- ###########################
-- ## 1. FONT CONFIGURATION ##
-- ###########################

-- Change your font and size here:
config.font = wezterm.font("MesloLGS Nerd Font")  -- Pick any installed font
config.font_size = 18.0                           -- Adjust for your eyes
config.line_height = 1.2                          -- Space between lines

-- ###########################
-- ## 2. COLOR SCHEME      ##
-- ###########################

-- Pick your favorite color scheme here:
config.color_scheme = 'Gruvbox Dark (Gogh)'

-- ###########################
-- ## 3. TAB BAR SETTINGS  ##
-- ###########################

config.hide_tab_bar_if_only_one_tab = true    -- Hide tab bar if only one tab
config.use_fancy_tab_bar = false              -- Set to true for default look
config.tab_max_width = 24                     -- Max width of each tab

-- ###########################
-- ## 4. WINDOW DECORATION ##
-- ###########################

config.window_decorations = "RESIZE"          -- "NONE", "RESIZE", "TITLE", "INTEGRATED_BUTTONS"
config.window_padding = { left = 5, right = 5, top = 0, bottom = 0 }  -- Padding around terminal

-- ###########################
-- ## 5. INACTIVE PANE STYLE##
-- ###########################

config.inactive_pane_hsb = {
  saturation = 0.6,   -- Lower = more gray
  brightness = 0.7,   -- Lower = dimmer
}

-- ###########################
-- ## 6. CUSTOM COLORS      ##
-- ###########################

-- Gruvbox palette for easy tab styling tweaks
local gruvbox = {
  bg0_h  = "#1d2021",
  bg1    = "#282828",
  bg2    = "#32302f",
  fg1    = "#ebdbb2",
  yellow = "#fabd2f",
  orange = "#fe8019",
  gray   = "#a89984",
}

config.window_frame = {
  active_titlebar_bg = gruvbox.bg0_h,
  inactive_titlebar_bg = gruvbox.bg1,
}

config.colors = {
  tab_bar = {
    background = gruvbox.bg1,
    active_tab = {
      bg_color = gruvbox.bg0_h,
      fg_color = gruvbox.yellow,
      intensity = "Bold",
      underline = "None",
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = gruvbox.bg1,
      fg_color = gruvbox.gray,
    },
    inactive_tab_hover = {
      bg_color = gruvbox.bg2,
      fg_color = gruvbox.orange,
      italic = true,
    },
    new_tab = {
      bg_color = gruvbox.bg1,
      fg_color = gruvbox.yellow,
    },
    new_tab_hover = {
      bg_color = gruvbox.bg2,
      fg_color = gruvbox.orange,
      italic = true,
    },
  },
}

-- ###########################
-- ## 7. KEYBINDINGS       ##
-- ###########################

-- Change or add keybindings below.
config.keys = {
  -- Vim-style pane navigation with ALT+h/j/k/l
  {key="h", mods="ALT", action=act.ActivatePaneDirection("Left")},
  {key="j", mods="ALT", action=act.ActivatePaneDirection("Down")},
  {key="k", mods="ALT", action=act.ActivatePaneDirection("Up")},
  {key="l", mods="ALT", action=act.ActivatePaneDirection("Right")},

  -- Chrome-style tab management
  {key="t", mods="CTRL|SHIFT", action=act.SpawnTab("CurrentPaneDomain")},
  {key="w", mods="CTRL|SHIFT", action=act.CloseCurrentTab{confirm=true}},
  {key="Tab", mods="CTRL|SHIFT", action=act.ActivateTabRelative(1)},
  {key="Tab", mods="CTRL|SHIFT|SHIFT", action=act.ActivateTabRelative(-1)},
}

-- ###########################
-- ## 8. EXPORT CONFIG     ##
-- ###########################

return config
