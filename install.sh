#!/bin/sh
set -e

cd ~/.wsl-setup

source basics.sh
source shell/fish.sh
source extras/terraform.sh
source extras/terragrunt.sh

cat conf-scripts/fish.conf > /.configure/fish/fish.conf
cat conf-scripts/wsl.conf > /etc/wsl.conf

echo "¬(0_0¬) Installed successfully ¬(0_0¬)"