#######################################################################
#                       Aodhan Dalton
#                   Full wsl setup v 0.3
#######################################################################

#!/bin/sh
set -x

# Install basic packages
sudo apt update
sudo apt upgrade -y

#break
#check if the packages are previously installed if not install them
dpkg -l | grep -qw docker || sudo apt-get install docker -y
dpkg -l | grep -qw docker.io || sudo apt-get install docker.io -y
dpkg -l | grep -qw python || sudo apt-get install python -y
dpkg -l | grep -qw python-pip || sudo apt-get install python-pip -y
dpkg -l | grep -qw unzip || sudo apt-get install unzip -y
dpkg -l | grep -qw direnv || sudo apt-get install direnv -y

#break

sudo pip install awscli

#break

#run wslconfig.exe /l to get a list of all installed distros
wslconfig.exe  /s legacy

# Creating an environmental variable for the user profile
setx.exe WSLENV "USERPROFILE/p"

# Installing fish
sudo apt-get install fish -y | fish
exit 0



