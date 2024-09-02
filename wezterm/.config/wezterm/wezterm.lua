-- Pull in the wezterm API
local wezterm = require("wezterm")

local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Rosé Pine (Gogh)"
config.color_scheme = "catppuccin-frappe"

config.font = wezterm.font("JetBrainsMono Nerd Font")
-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
-- config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = false })

config.font = wezterm.font_with_fallback({
	"Fira Code",
	"DengXian",
	"Noto Color Emoji",
})

config.window_background_opacity = 1
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 5000
config.default_workspace = "home"

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "a", mods = "LEADER", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },

	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	{ key = "LeftArrow", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "LEADER", action = act.ActivatePaneDirection("Down") },

	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

	{ key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "l", mods = "LEADER", action = act.ShowTabNavigator },
}

config.use_fancy_tab_bar = true

config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 11.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#303446",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#303446",
}

config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#EBBCBA",
		active_tab = {
			bg_color = "#84A0E0",
			fg_color = "#303446",
		},
		inactive_tab = {
			bg_color = "#303446",
			fg_color = "#FFFFFF",
		},
		new_tab = {
			bg_color = "#303446",
			fg_color = "#FFFFFF",
		},
	},
}

config.tab_bar_at_bottom = true
-- and finally, return the configuration to wezterm
return config
