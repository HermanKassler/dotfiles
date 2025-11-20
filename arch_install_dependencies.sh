echo "Installing nvim..."
sudo pacman -S neovim

echo "Installing yay..."
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git ~/Downloads/yay
cd ~/Downloads/yay
makepkg -si

echo "installing ssh..."
sudo pacman -S openssh

echo "installing zsh..."
sudo pacman -S zsh
chsh -s $(which zsh)

echo "Installing fzf..."
sudo pacman -S fzf
echo "eval \"$(fzf --zsh)\""

echo "installing bat..."
sudo pacman -S bat 
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

echo "installing fdfind..."
sudo pacman -S fd
sudo ln -s /bin/fd /bin/fdfind

echo "installing terminals..."
sudo pacman -S ghostty
sudo pacman -S kitty # For backup in case ghostty breaks

echo "installing eza..."
sudo pacman -S eza

echo "installing fastfetch..."
sudo pacman -S fastfetch

echo "installing atuin..."
sudo pacman -S atuin
# echo "bind -x '\"\C-r\": __atuin_history'" >> ~/.bashrc

echo "installing btop..."
sudo pacman -S btop

echo "installing nemo..."
sudo pacman -S nemo

echo "installing zathura..."
sudo pacman -S zathura

echo "installing lazygit..."
sudo pacman -S lazygit

echo "installing yazi..."
sudo pacman -S yazi

echo "installing croc..."
sudo pacman -S croc

echo "installing qrcp..."
sudo pacman -S qrcp

echo "installing arch wiki"
sudo pacman -S arch-wiki-docs

sudo pacman -S sshfs
sudo pacman -S ethersync
sudo pacman -S teeldear
# sudo pacman -S 

echo "--------------APPLICATIONS---------------"
sudo pacman -S discord
sudo pacman -S spotify-launcher
sudo pacman -S vlc
yay -S zen-browser


echo "-------------HYPERLAND---------------"
sudo pacman -S hyprpaper
sudo pacman -S hyprlock
sudo pacman -S hypridle
sudo pacman -S waybar
sudo pacman -S swaync
yay -S hyprshot
sudo pacman -S hyprpicker
pacman -S xdg-desktop-portal-hyprland
sudo pacman -S hyprpolkitagent
sudo pacman -S qt6-wayland
sudo pacman -S qt5-wayland
yay -S ags-hyprpanel-git



