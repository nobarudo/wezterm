local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 基本設定
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = "BlinkingBar"
config.color_scheme = "Tokyo Night"

config.font_size = 10
config.use_ime = true

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

local keys = {}

table.insert(keys, {
	key = "d",
	mods = "CTRL|SHIFT",
	action = wezterm.action.CloseCurrentPane({ confirm = false }),
})

return config
