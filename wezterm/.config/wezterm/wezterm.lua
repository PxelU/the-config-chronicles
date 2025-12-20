-- WezTerm Config
-- Philosophy: Wezterm tabs for process isolation, Nvim for code navigation
-- Decision: Tab-heavy workflow, minimal splits (splits only for distinct processes)

local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()
local is_mac = string.find(wezterm.target_triple, "apple") ~= nil
local mod = is_mac and "CMD" or "ALT"


-- ###########################
-- ## FONT
-- ###########################

config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = is_mac and 18.0 or 14.0
config.line_height = 1

-- ###########################
-- ## COLOR SCHEME
-- ###########################

config.color_scheme = 'Catppuccin Mocha'

-- ###########################
-- ## TAB BAR
-- ###########################

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false

-- ###########################
-- ## WINDOW DECORATION
-- ###########################

config.window_decorations = "RESIZE"
config.window_padding = { left = 10, right = 10, top = 5, bottom = 5 }

-- ###########################
-- ## KEYBINDINGS
-- ###########################

config.keys = {
  {key="d", mods=mod, action=act.SplitHorizontal{domain="CurrentPaneDomain"}},
  {key="h", mods=mod, action=act.ActivatePaneDirection("Left")},
  {key="l", mods=mod, action=act.ActivatePaneDirection("Right")},

  {key="t", mods="CTRL|SHIFT", action=act.SpawnTab("CurrentPaneDomain")},
  {key="w", mods="CTRL|SHIFT", action=act.CloseCurrentTab{confirm=true}},
  {key="Tab", mods="CTRL|SHIFT", action=act.ActivateTabRelative(1)},
}

-- ###########################
-- ## MISC
-- ###########################

config.audible_bell = "Disabled"

-- ###########################
-- ## EXPORT
-- ###########################

return config
