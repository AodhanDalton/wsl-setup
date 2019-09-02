#installing fish
sudo apt-get install fish -y
fish
chsh -s /usr/bin/fish
sudo mkdir -p ~/.config/fish

#installing omf & setting theme
curl -L https://get.oh-my.fish | fish
omf install lambda
