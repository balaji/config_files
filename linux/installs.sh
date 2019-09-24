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

sudo apt update

sudo apt install haskell-stack zsh emacs i3 git volumeicon-alsa \
maven apt-transport-https ca-certificates google-cloud-sdk vlc \
kubectl google-cloud-sdk-cbt software-properties-common docker-ce golang \
ttf-mscorefonts-installer chromium-browser fonts-open-sans \
cargo ocaml mit-scheme xbacklight libssl-dev pm-utils openssl1.0 \
fonts-hack compton feh blueman autoconf openjdk-11-jdk openjdk-8-jdk \
'ubuntu-wallpapers-*' redshift-gtk racket tree tmux py3status \
libx11-dev libxi-dev libxcb-util-dev libx11-xcb-dev libxcb-randr0-dev asciidoc rofi \
fonts-hack-ttf fonts-font-awesome

sudo snap install code --classic

sudo snap install spotify bitwarden

go get -u github.com/GoogleCloudPlatform/docker-credential-gcr

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P ~/Downloads/
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.15.5387.tar.gz -P ~/Downloads/

cargo install i3-style

cd $HOME/github
git clone https://github.com/Airblader/xedgewarp
cd xedgewarp
make
sudo make install

sudo usermod -a -G video $LOGNAME
sudo usermod -a -G docker $LOGNAME

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

cd $HOME/Downloads
curl -O "https://download.visualstudio.microsoft.com/download/pr/c624c5d6-0e9c-4dd9-9506-6b197ef44dc8/ad61b332f3abcc7dec3a49434e4766e1/dotnet-sdk-3.0.100-preview7-012821-linux-x64.tar.gz"
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-3.0.100-preview7-012821-linux-x64.tar.gz -C $HOME/dotnet
