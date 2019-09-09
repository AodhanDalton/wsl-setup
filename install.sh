#!/bin/sh
set -e

cd ~/.wsl-setup

sh ./basic.sh
sh shell/fish.sh
sh extras/terraform.sh
sh extras/terragrunt.sh

cat conf-scripts/fish.conf > ~/.config/fish/fish.conf
sudo sh -c 'cat ~/.wsl-setup/conf-scripts/wsl.conf > /etc/wsl.conf'

echo "¬(0_0¬) Installed successfully ¬(0_0¬)"
