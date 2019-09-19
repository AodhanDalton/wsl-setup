#!/bin/sh
set -e

cd ~/.wsl-setup

bash ./basic.sh &&
bash ./shell/fish.sh &&
bash ./shell/fish-conf.sh &&
bash ./extras/terraform.sh &&
bash ./extras/terragrunt.sh

cat ./conf-scripts/fish.conf > ~/.config/fish/conf.d/fish.conf
sudo sh -c 'cat ./conf-scripts/wsl.conf > /etc/wsl.conf'

echo "¬(0_0¬) Installed successfully ¬(0_0¬)"

exit 0
