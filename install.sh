#!/bin/sh
set -e

cd ~/.wsl-setup

sh ./basic.sh
sh shell/fish.sh
sh extras/terraform.sh
sh extras/terragrunt.sh

cat conf-scripts/fish.conf > /.configure/fish/fish.conf
cat conf-scripts/wsl.conf > /etc/wsl.conf

echo "¬(0_0¬) Installed successfully ¬(0_0¬)"