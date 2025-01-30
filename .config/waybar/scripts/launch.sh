#                    __           
#  _    _____ ___ __/ /  ___ _____
# | |/|/ / _ `/ // / _ \/ _ `/ __/
# |__,__/\_,_/\_, /_.__/\_,_/_/   
#            /___/                
# 
# ----------------------------------------------------- 
# Quit all running waybar instances
# ----------------------------------------------------- 
killall waybar
pkill waybar
sleep 0.5





# ----------------------------------------------------- 
# Loading the configuration
# ----------------------------------------------------- 
config_file="config.jsonc"
style_file="style.css"


# Check if waybar-disabled file exists
if [ ! -f $HOME/.cache/waybar-disabled ] ;then 
    waybar -c ~/.config/waybar/$config_file -s ~/.config/waybar/$style_file &
fi

