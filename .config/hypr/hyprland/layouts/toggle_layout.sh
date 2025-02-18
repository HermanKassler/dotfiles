if [ -f ~/.cache/hypr-gaps-disabled ] ;then
    ln -sf ~/.config/hypr/hyprland/layouts/default.conf ~/.config/hypr/hyprland/layouts/active.conf
    rm ~/.cache/hypr-gaps-disabled
else
    ln -sf ~/.config/hypr/hyprland/layouts/no-gaps.conf ~/.config/hypr/hyprland/layouts/active.conf
    touch ~/.cache/hypr-gaps-disabled
fi
