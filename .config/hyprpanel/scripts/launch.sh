#                    __           
#  _    _____ ___ __/ /  ___ _____
# | |/|/ / _ `/ // / _ \/ _ `/ __/
# |__,__/\_,_/\_, /_.__/\_,_/_/   
#            /___/                
# 
# ----------------------------------------------------- 
# Quit all running waybar instances
# ----------------------------------------------------- 
hyprpanel -q




# ----------------------------------------------------- 
# Loading the configuration
# ----------------------------------------------------- 
# config_file="config.jsonc"
# style_file="style.css"


# Check if waybar-disabled file exists
if [ ! -f $HOME/.cache/hyprpanel-disabled ] ;then 
    hyprpanel 
fi

