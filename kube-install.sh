#!/bin/sh
#######################################################################
#                       Aodhan Dalton
#                   installation of kubernetes tools v 0.3
#######################################################################

# install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# install for kns for kubernetes
curl https://raw.githubusercontent.com/blendle/kns/master/bin/kns -o /usr/local/bin/kns
sudo chmod +x /usr/local/bin/kns

# install for ktx for kubernetes
sudo curl https://raw.githubusercontent.com/blendle/kns/master/bin/ktx -o /usr/local/bin/ktx
sudo chmod +x /usr/local/bin/ktx 

# install for fzf for kubernetes
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf 
 ~/.fzf/install

# stern
sudo curl https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64 -o /usr/local/bin/stern
sudo chmod +x /usr/local/bin/stern


# helm 
curl -fsSL https://get.helm.sh/helm-v2.13.1-linux-amd64.tar.gz -o helm
tar zxvf helm
sudo mv linux-amd64/helm /usr/local/bin/
rm -rf linux-amd64