hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__GL_VRR_ALLOWED", "1")
hl.env("WLR_DRM_NO_ATOMIC", "1")
hl.env("GTK_IM_MODULE", "simple")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")

-- This is an example Hyprland config file.
-- Refer to the wiki for more information.
-- https://wiki.hyprland.org/Configuring/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can split this configuration into multiple files
-- Create your files separately and then link them to this file like this:

--###############
--## MONITORS ###
--###############

-- See https://wiki.hyprland.org/Configuring/Monitors/

require("monitors")

--##################
--##   PROGRAMS  ###
--##################

-- See https://wiki.hyprland.org/Configuring/Keywords/

-- Set programs that you use
terminal = "ghostty"
fileManager = "nemo"
menu = "rofi -show drun"
browser = "zen-browser"

--################
--## AUTOSTART ###
--################
hl.on("hyprland.start", function()
	hl.exec_cmd("qs -c noctalia-shell")
	hl.exec_cmd(terminal) -- [workspace 1 silent]
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd(browser, { workspace = "2 silent" }) -- [workspace 2 silent]
	hl.exec_cmd("systemctl") --user start hyprpolkitagent
	hl.exec_cmd("discord ", { workspace = "3 silent" }) --no-startup-id #--start-minimized
	hl.exec_cmd("hypridle")
	hl.exec_cmd("wl-paste --type image --watch cliphist store") -- Stores only image data
	hl.exec_cmd("wl-paste --type text --watch cliphist store") -- Stores only text data
	hl.exec_cmd("vicinae")
	hl.exec_cmd("syncthing")
end)

--#############
--## CURSOR ###
--#############

hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "BreezeX-RoséPine")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")

hl.config({ cursor = {
	no_hardware_cursors = false,
} })

--#############
--## LAYOUT ###
--#############
require("hyprland.layouts.default")

-- https://wiki.hyprland.org/Configuring/Variables/#animations
-- ANIMATIONS
require("hyprland.animations")

-- Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/

-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
hl.config({ dwindle = {
	preserve_split = true,
	force_split = 2,
} })

-- https://wiki.hyprland.org/Configuring/Variables/#misc
hl.config({
	misc = {
		focus_on_activate = true,
		vrr = 1,
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

--############
--## INPUT ###
--############

-- https://wiki.hyprland.org/Configuring/Variables/#input
hl.config({
	input = {
		kb_layout = "se",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		touchpad = {
			natural_scroll = true,
			scroll_factor = 0.3,
		},
	},
})

-- https://wiki.hyprland.org/Configuring/Variables/#gestures
-- gestures {
--     workspace_swipe = false
-- }

-- Example per-device config
-- See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

hl.config({ ecosystem = {
	no_donation_nag = true,
} })

hl.config({
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
})

--##################
--## KEYBINDINGS ###
--##################
require("hyprland.keybinds")

--#############################
--## WINDOWS AND WORKSPACES ###
--#############################

-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
-- See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

require("hyprland.windowrules")
