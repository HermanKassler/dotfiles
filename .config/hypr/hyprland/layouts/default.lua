--####################
--## LOOK AND FEEL ###
--####################

DEFAULT = {
	general = {
		gaps_in = 5,
		gaps_out = 9,
		border_size = 3,
		col = {
			active_border = { colors = { "rgba(b2bb26ff)", "rgba(458588ff)", angle = 45 } },
			-- col.active_border =  rgba(689d6aff) ,
			-- col.active_border =  rgba(8ec07cff) ,
			inactive_border = "rgba(595959aa)",
		},
		resize_on_border = true,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 10,
		active_opacity = 1.0,
		inactive_opacity = 0.8,

		shadow = {
			enabled = true,
			range = 5,
			--offset = -3 2,
			render_power = 11,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = true,
			size = 5,
			passes = 3,
			noise = 0.1,
			vibrancy = 0.2696,
			vibrancy_darkness = 0.1,
		},
	},
	dwindle = {
		preserve_split = true,
		force_split = 2,
	},
	misc = {
		focus_on_activate = true,
		vrr = 1,
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
	group = {
		groupbar = {
			rounding = 5,
			gaps_out = 10,
			gaps_in = 4,
			round_only_edges = false,
			enabled = true,
			height = 0,
			indicator_height = 15,
		},
	},
}
hl.config(DEFAULT)
