hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.3, -0.3 }, { 0, 1 } } })
hl.curve("wind2", { type = "bezier", points = { { 0.46, 0.73 }, { 0.33, 1.12 } } })

hl.curve("rubber", { type = "spring", mass = 1, stiffness = 70, dampening = 15 })

hl.animation({ leaf = "global", enabled = 1, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = 1, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = 1, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsMove", enabled = 1, speed = 2.5, spring = "rubber" })
hl.animation({ leaf = "windowsIn", enabled = 1, speed = 2.5, spring = "rubber", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = 1, speed = 2.5, spring = "rubber", style = "slide" })
-- hl.animation({ leaf = "windowsMove", enabled = 1, speed = 2.5, bezier = "md3_decel" })
-- hl.animation({ leaf = "windowsIn", enabled = 1, speed = 2.5, bezier = "wind2", style = "slide" })
-- hl.animation({ leaf = "windowsOut", enabled = 1, speed = 4.79, bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "fadeIn", enabled = 1, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = 1, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = 1, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = 1, speed = 3.81, bezier = "easeOutQuint" })
-- hl.animation({leaf = "layersIn, 1", enabled =  3.79, speed =  easeOutQuint, bezier = "fade"})
hl.animation({ leaf = "layersIn", enabled = 1, speed = 3.79, bezier = "wind" })
hl.animation({ leaf = "layersOut", enabled = 1, speed = 5.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "fadeLayersIn", enabled = 1, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = 1, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = 1, speed = 1.94, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = 0, speed = 1.21, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = 0, speed = 1.94, bezier = "almostLinear", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = 1, speed = 3, bezier = "easeOutQuint", style = "slidevert" })

hl.layer_rule({
	name = "slide_rofi",
	animation = "slide bottom",
	match = { namespace = "rofi" },
})

hl.layer_rule({
	name = "slide_hyprpanel",
	animation = "slide bottom",
	match = { namespace = ".*menu" },
})

hl.layer_rule({
	name = "vicinae",
	animation = "slide bottom",
	match = { namespace = "vicinae" },
})

hl.layer_rule({
	name = "notificationmenu",
	animation = "slide right",
	match = { namespace = "notificationsmenu" },
})
