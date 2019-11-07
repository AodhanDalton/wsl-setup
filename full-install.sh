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
sudo apt-get install fish -y

chsh -s /usr/bin/fish

dir=~/.config/fish
if [ ! -d $dir ]
then
     mkdir $dir
else
     echo "Directory exists"  
fi

# Installing omf & setting theme
curl -L https://get.oh-my.fish | fish
omf install lambda

# Setting up terraform
curl -sLO https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
unzip terraform_0.11.13_linux_amd64.zip
sudo mv terraform /usr/local/bin
rm -r terraform_0.11.13_linux_amd64.zip

# Setting up terragrunt
curl -sL https://github.com/gruntwork-io/terragrunt/releases/download/v0.18.3/terragrunt_linux_amd64 -o terragrunt
chmod +x terragrunt
sudo mv terragrunt /usr/local/bin

# Setting up packer
curl -sLO https://releases.hashicorp.com/packer/1.4.3/packer_1.4.3_linux_amd64.zip
unzip packer_1.4.3_linux_amd64.zip
sudo mv packer /usr/local/bin
rm -r packer_1.4.3_linux_amd64.zip

# Alias file for fish
echo 'direnv hook fish | source
export AWS_SHARED_CREDENTIALS_FILE=$USERPROFILE/.aws/credentials
alias gimme-aws-creds="docker run --rm -it -v $USERPROFILE/.aws/credentials:/root/.aws/credentials -v $USERPROFILE/.okta_aws_login_config:/root/.okta_aws_login_config rewardinsight/gimme-aws-creds:v1.1.5"
#General
alias c="clear"
alias projects="cd /c/projects"
alias dropbox="cd ~/dropbox"
alias sapt="sudo apt install"
#Directory movemenet aliases
alias ..="cd .."
alias ...="cd ../../../"
alias ....="cd ../../../../"
alias .....="cd ../../../../"
alias back="cd -"
alias l="ls -al"
alias user="cd $USERPROFILE"
export DOCKER_HOST=tcp://localhost:2375

if test -f /home/aodhan/.autojump/share/autojump/autojump.fish; . /home/aodhan/.autojump/share/autojump/autojump.fish; end' | sudo tee ~/.config/fish/config.fish

source  ~/.config/fish/config.fish

# Wsl configuration file to set c as root instead of mnt
echo '# Enable extra metadata options by default
[automount]
enabled = true
root = /
options = "metadata,umask=22,fmask=11"
mountFsTab = false

# Enable DNS – even though these are turned on by default, we’ll specify here just to be explicit.
[network]
generateHosts = true
generateResolvConf = true' | sudo tee /etc/wsl.conf


echo "¬(*_*¬) Installed successfully ¬(*_*¬)"
fish
exit 0



