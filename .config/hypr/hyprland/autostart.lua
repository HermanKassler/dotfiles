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
	hl.exec_cmd("vicinae server")
	hl.exec_cmd("syncthing")
end)
