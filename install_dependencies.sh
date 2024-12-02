echo "Installing fzf..."
sudo apt install fzf

echo "installing bat..."
sudo apt install bat 
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

echo "installing eza..."
sudo apt install eza


echo "installing tmux..."
sudo apt install tmux

