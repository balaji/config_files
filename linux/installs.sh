#!/bin/sh

sudo apt update && sudo apt install curl wget

sudo add-apt-repository ppa:linuxuprising/java

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable"

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

sudo apt update

sudo apt install haskell-stack zsh vim emacs i3 git rxvt-unicode volumeicon-alsa maven oracle-java11-installer apt-transport-https ca-certificates google-cloud-sdk kubectl google-cloud-sdk-cbt software-properties-common docker-ce golang ttf-mscorefonts-installer fonts-inconsolata google-chrome-stable

sudo snap install vscode --classic

sudo snap install spotify bitwarden