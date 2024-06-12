-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "rose-pine"

config.font = wezterm.font("JetBrainsMono Nerd Font")
-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
-- config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = false })

config.font = wezterm.font_with_fallback({
	"Fira Code",
	"DengXian",
	"Noto Color Emoji",
})

-- and finally, return the configuration to wezterm
return config
