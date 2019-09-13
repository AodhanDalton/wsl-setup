#!/bin/sh
set -e

cd ~/.wsl-setup

./basic.sh &&
./shell/fish.sh &&
./shell/fish-conf.sh &&
./extras/terraform.sh &&
./extras/terragrunt.sh

cat ./conf-scripts/fish.conf > ~/.config/fish/conf.d/fish.conf
sudo sh -c 'cat ./conf-scripts/wsl.conf > /etc/wsl.conf'

echo "¬(0_0¬) Installed successfully ¬(0_0¬)"
