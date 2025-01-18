echo "Installing nvim..."
sudo pacman -S neovim

echo "Installing fzf..."
sudo pacman -S fzf

echo "installing bat..."
sudo pacman -S bat 
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

echo "installing fdfind..."
sudo pacman -S fd
sudo ln -s /bin/fd /bin/fdfind

echo "installing eza..."
sudo pacman -S eza


echo "HYPERLAND"
echo "installing waybar..."
sudo pacman -S hyprpaper
sudo pacman -S hyprlock
sudo pacman -S waybar


echo "installing nemo..."
sudo pacman -S nemo

echo "installing ssh..."
sudo pacman -S openssh
