#  _____                 _       __        __          _                
# |_   _|__   __ _  __ _| | ___  \ \      / /_ _ _   _| |__   __ _ _ __ 
#   | |/ _ \ / _` |/ _` | |/ _ \  \ \ /\ / / _` | | | | '_ \ / _` | '__|
#   | | (_) | (_| | (_| | |  __/   \ V  V / (_| | |_| | |_) | (_| | |   
#   |_|\___/ \__, |\__, |_|\___|    \_/\_/ \__,_|\__, |_.__/ \__,_|_|   
#            |___/ |___/                         |___/                  
#

if [ -f ~/.cache/hyprpanel-disabled ] ;then
    rm ~/.cache/hyprpanel-disabled
else
    touch ~/.cache/hyprpanel-disabled
fi
~/.config/hyprpanel/scripts/launch.sh &
