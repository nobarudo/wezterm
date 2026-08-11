local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = require("wezterm").action

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

config.tab_max_width = 25

config.colors = {
	tab_bar = {
		background = "none",
	},
}

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = {
	{
		key = "5",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "3",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },
	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "h", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Left", 2 }) },
	{ key = "l", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Right", 2 }) },
	{ key = "k", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Up", 2 }) },
	{ key = "j", mods = "CTRL|SHIFT", action = act.AdjustPaneSize({ "Down", 2 }) },
	{
		mods = "CTRL|SHIFT",
		key = "s",
		action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }),
	},
	{
		-- Rename workspace
		mods = "CTRL|SHIFT",
		key = "$",
		action = act.PromptInputLine({
			description = "(wezterm) Set workspace title:",
			action = wezterm.action_callback(function(win, pane, line)
				if line then
					wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
				end
			end),
		}),
	},
	{
		key = "d",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
}

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = { theme = "nord" },
	sections = {
		tab_active = {
			"index",
			{ "process", padding = { left = 0, right = 1 } },
			"",
			{ "cwd", padding = { left = 1, right = 0 } },
			{ "zoomed", padding = 1 },
		},
		tab_inactive = {
			"index",
			{ "process", padding = { left = 0, right = 1 } },
			"󰉋",
			{ "cwd", padding = { left = 1, right = 0 } },
			{ "zoomed", padding = 1 },
		},
	},
})

tabline.apply_to_config(config)

return config
