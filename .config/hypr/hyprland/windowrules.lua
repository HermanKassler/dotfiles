-- Example windowrule v1
-- windowrule = float, ^(kitty)$
hl.window_rule({
	name = "calculator",
	float = true,
	match = { class = "^org.gnome.Calculator$" },
})

hl.window_rule({
	name = "windowrule-2",
	float = true,
	match = { class = "^(blueman-manager)$" },
})

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
	name = "windowrule-3",
	suppress_event = "maximize",
	match = { class = ".*" },
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name = "windowrule-4",
	no_focus = true,
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
})

--nvim-wl-anywhere
hl.window_rule({
	name = "windowrule-5",
	float = true,
	match = { class = "^nvim.wl.anywhere$" },
})

hl.window_rule({
	name = "airctl",
	float = true,
	match = { class = "io.github.airctl" },
})

hl.window_rule({
	name = "nmgui",
	float = true,
	match = { class = "com.network.manager" },
})

-- windowrule = rounding 0, floating:0, onworkspace:f[1]windowrulev2 = float, class:nvim-wl-anywhere
-- windowrulev2 = pin, class:nvim-wl-anywhere
-- windowrulev2 = stayfocused, class:nvim-wl-anywhere
-- windowrulev2 = size 70% 70%, class:nvim-wl-anywhere

-- smart gaps
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })

-- windowrule = float,initialtitle:^(Open File)$
hl.window_rule({
	name = " windowrule-8",
	float = true,
	match = { initial_title = "^(Open File)$" },
})

hl.window_rule({
	name = " windowrule-9",
	float = true,
	match = { title = "^(Choose Files)$" },
})

hl.window_rule({
	name = " windowrule-10",
	float = true,
	match = { title = "^(Save As)$" },
})

hl.window_rule({
	name = " windowrule-11",
	float = true,
	match = { title = "^(Ctrue,firm to replace files)$" },
})

hl.window_rule({
	name = " windowrule-12",
	float = true,
	match = { title = "^(File Operation Progress)$" },
})

hl.window_rule({
	name = "suppress_discord",
	match = { class = "^(discord)*" },
	no_initial_focus = true,
	workspace = 3,
})

hl.window_rule({
	name = "suppress_zen",
	match = { class = "zen" },
	focus_on_activate = false,
})

hl.window_rule({
	name = "albert",
	match = { class = "albert" },
	border_size = 0,
	no_blur = true,
	no_shadow = true,
})

hl.window_rule({
	name = "Ulauncher",
	match = { class = "Ulauncher", title = "^(Ulauncher - Application Launcher)*" },
	border_size = 0,
	no_blur = true,
	no_shadow = true,
})

hl.window_rule({
	name = "zoom",
	match = { title = "^(zoom)*", class = "zoom" },
	border_size = 0,
	float = true,
	no_blur = true,
	no_shadow = true,
})

-- exec-once = sleep 10; hyprctl keyword 'windowrule[suppress_zen]:focus_on_activate on'
-- exec-once = sleep 20; hyprctl keyword 'windowrule[suppress_discord]:enable false'
