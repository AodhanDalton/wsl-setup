#!/bin/sh
set -e

cd ~/.wsl-setup

nohup bash ./basic.sh &&
nohup bash ./shell/fish.sh &&
nohup bash ./shell/fish-conf.sh &&
nohup bash ./extras/terraform.sh &&
nohup bash ./extras/terragrunt.sh

cat ./conf-scripts/fish.conf > ~/.config/fish/conf.d/fish.conf
sudo sh -c 'cat ./conf-scripts/wsl.conf > /etc/wsl.conf'

echo "¬(0_0¬) Installed successfully ¬(0_0¬)"
