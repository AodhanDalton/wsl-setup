#install basic packages
sudo apt update
sudo apt upgrade -y
sudo apt install docker python python-pip docker.io unzip -y
sudo pip install awscli
sudo apt install direnv
wslconfig.exe  /s ubuntu

#creating an environmental variable for the user profile
setx.exe WSLENV "USERPROFILE/p"
