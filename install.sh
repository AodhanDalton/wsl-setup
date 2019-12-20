#######################################################################
#                       Aodhan Dalton
#                   Full wsl setup v 0.3
#######################################################################
  #!/bin/sh

main_install() {
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
}

omf_install() {
        chsh -s /usr/bin/fish

        dir=~/.config/fish
        if [ ! -d $dir ]
        then
            mkdir $dir
        else
            echo "Directory exists"  
        fi

        # Installing omf & setting theme
        curl -L https://get.oh-my.fish
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
        alias tm k="tmux kill-session"
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

}


kube_install() {
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
}


# running the functions
    main_install
    fish_install
    kube_install
