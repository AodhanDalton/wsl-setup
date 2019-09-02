#setting up terraform
curl -sLO https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip
unzip terraform_0.11.13_linux_amd64.zip
sudo mv terraform /usr/local/bin
rm -r terraform_0.11.13_linux_amd64.zip
