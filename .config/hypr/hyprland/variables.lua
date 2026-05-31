hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("NVD_BACKEND", "direct")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__GL_VRR_ALLOWED", "1")
hl.env("WLR_DRM_NO_ATOMIC", "1")
hl.env("GTK_IM_MODULE", "simple")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")

hl.config({ ecosystem = {
	no_donation_nag = true,
} })

--##################
--##   PROGRAMS  ###
--##################

terminal = "ghostty --gtk-single-instance=true"
fileManager = "nemo"
menu = "vicinae toggle"
-- menu = "rofi -show drun"
browser = "zen-browser"
