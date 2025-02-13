
echo "Installing nvim..."
sudo pacman -S neovim

echo "Installing yay..."
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git ~/Downloads/yay
cd ~/Downloads/yay
makepkg -si

echo "installing ssh..."
sudo pacman -S openssh

echo "Installing fzf..."
sudo pacman -S fzf
echo "eval \"$(fzf --bash)\""

echo "installing bat..."
sudo pacman -S bat 
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

echo "installing fdfind..."
sudo pacman -S fd
sudo ln -s /bin/fd /bin/fdfind

echo "installing starship..."
sudo pacman -S starship
echo "eval \"$(starship init bash)\"" >> ~/.bashrc
echo "export STARSHIP_CONFIG=~/.config/starship/starship.toml" >> ~/.bashrc

echo "installing eza..."
sudo pacman -S eza

echo "installing neofetch..."
sudo pacman -S neofetch

echo "installing atuin..."
sudo pacman -S atuin
echo "bind -x '\"\C-r\": __atuin_history'" >> ~/.bashrc


echo "installing btop..."
sudo pacman -S btop

echo "installing nemo..."
sudo pacman -S nemo

echo "installing zathura..."
sudo pacman -S zathura

echo "--------------APPLICATIONS---------------"
sudo pacman -S discord
sudo pacman -S spotify-launcher


echo "-------------HYPERLAND---------------"
echo "installing waybar..."
sudo pacman -S hyprpaper
sudo pacman -S hyprlock
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



