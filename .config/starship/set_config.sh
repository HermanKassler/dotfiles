
echo "Choose new config:"
read conf
rm ~/.config/starship/starship.toml
ln -s ~/.config/starship/"$conf" ~/.config/starship/starship.toml
