-- See https://wiki.hyprland.org/Configuring/Keywords/
local mainMod = "SUPER + " -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " Q", hl.dsp.window.close())
hl.bind(mainMod .. " return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " N", hl.dsp.exec_cmd(" /home/tore/.config/nvim-wl-anywhere/nvim-wl-anywhere.sh"))
hl.bind(mainMod .. "D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. "SHIFT + D", hl.dsp.exec_cmd("vicinae toggle"))
hl.bind(mainMod .. "SHIFT + F", hl.dsp.exec_cmd(" ulauncher-toggle"))
-- hl.bind(mainMod .."P + pseudohl.dsp.exec_cmd(" "))-- dwindle
hl.bind(mainMod .. "S", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. "F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. "escape", hl.dsp.exec_cmd(" ~/.config/rofi/powermenu/type-5/powermenu.sh")) -- open power menu

-- Noctalia
local ipc = "qs -c noctalia-shell ipc call"

hl.bind(mainMod .. "SPACE", hl.dsp.exec_cmd(ipc .. "launcher toggle"))
hl.bind(mainMod .. "SHIFT + B", hl.dsp.exec_cmd(ipc .. " bar toggle"))
hl.bind(mainMod .. "period", hl.dsp.exec_cmd(ipc .. " launcher emoji"))
hl.bind(mainMod .. "SHIFT + C", hl.dsp.exec_cmd(ipc .. " controlCenter toggle"))
hl.bind(mainMod .. "SHIFT + W", hl.dsp.exec_cmd(ipc .. " wallpaper toggle"))
hl.bind(mainMod .. "comma", hl.dsp.exec_cmd(ipc .. " settings toggle"))

hl.env("HYPRSHOT_DIR", "Pictures/Screenshots/")
hl.bind(mainMod .. "SHIFT + S", hl.dsp.exec_cmd("hyprshot --freze -m region"))

hl.bind(mainMod .. "C", hl.dsp.exec_cmd("gnome-calculator"))
-- bind = $mainMod SHIFT, B,exec, ~/.config/waybar/scripts/toggle.sh # toggle waybar
-- bind = $mainMod SHIFT, B,exec,  ~/.config/hyprpanel/scripts/toggle.sh # toggle hyprpanel
hl.bind(mainMod .. "SHIFT + P", hl.dsp.exec_cmd("hyprpicker -g"))
hl.bind(mainMod .. "V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

hl.bind(mainMod .. "SHIFT + G ", function()
	local currentGaps = hl.get_config("general.gaps_out").top

	if currentGaps == 0 then
		require("hyprland.layouts.default")
		hl.config(DEFAULT)
	else
		require("hyprland.layouts.no-gaps")
		hl.config(NO_GAPS)
	end
end)

hl.bind(mainMod .. "", hl.dsp.exec_cmd(""))
-- Groups
hl.bind(mainMod .. "G", hl.dsp.group.toggle())
hl.bind(mainMod .. "TAB", hl.dsp.group.next())
hl.bind(mainMod .. "SHIFT + TAB", hl.dsp.group.prev())

-- Swap window in direction
hl.bind(mainMod .. " SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " SHIFT + J", hl.dsp.window.swap({ direction = "down" }))

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
local function focus_workspace(w)
	hl.bind(mainMod .. tostring(w), hl.dsp.focus({ workspace = w }))
end

hl.bind(mainMod .. "0", hl.dsp.focus({ workspace = 10 }))
for i = 1, 9 do
	focus_workspace(i)
end

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
local function move_to_workspace(w)
	hl.bind(mainMod .. tostring(w), hl.dsp.window.move({ workspace = tostring(w), follow = false }))
end

hl.bind(mainMod .. "0", hl.dsp.window.move({ workspace = 10, follow = false }))
for i = 1, 9 do
	move_to_workspace(i)
end

-- -- Example special workspace (scratchpad)
hl.bind(mainMod .. "A", hl.dsp.workspace.toggle_special())
hl.bind(mainMod .. "SHIFT + A", hl.dsp.window.move({ workspace = "special", follor = false }))

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true })

-- -- Scroll through existing workspaces with mainMod + scroll
-- bind = $mainMod, mouse_down, workspace, e+1
-- bind = $mainMod, mouse_up, workspace, e-1
--
-- -- Move/resize windows with mainMod + LMB/RMB and dragging
-- bindm = $mainMod, mouse:272, movewindow
-- bindm = $mainMod, mouse:273, resizewindow
