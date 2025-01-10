echo "Installing fzf..."
sudo apt install fzf

echo "installing bat..."
sudo apt install bat 
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

echo "installing fdfind..."
sudo apt install fd-find

echo "installing eza..."
sudo apt install eza


echo "installing tmux..."
sudo apt install tmux

echo "installing i3..."
sudo apt install i3
sudo apt install rofi
sudo apt install flameshot
sudo apt install polybar


sudo apt install brightnessctl
#usermod -a -G video ${USER}
