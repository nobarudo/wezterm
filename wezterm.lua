local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 基本設定
config.automatically_reload_config = true
config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = "BlinkingBar"
config.color_scheme = "nord"

config.font_size = 10.5
config.use_ime = true

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.window_decorations = "RESIZE"
config.initial_cols = 180
config.initial_rows = 40
config.window_background_opacity = 0.9

local keys = {}

table.insert(keys, {
	key = "d",
	mods = "CTRL|SHIFT",
	action = wezterm.action.CloseCurrentPane({ confirm = false }),
})

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = { theme = "nord" },
})
tabline.setup()

return config
