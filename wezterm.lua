local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action
local mux = wezterm.mux

-- 基本設定
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = "BlinkingBar"
config.color_scheme = "Tokyo Night"

config.font_size = 10
config.use_ime = true

config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

return config
