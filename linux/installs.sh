#!/bin/sh
apt update && apt install -y curl wget software-properties-common apt-transport-https ca-certificates

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub |  apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add -

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" |  tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# bionic image for some packages.
add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable"

add-apt-repository -y ppa:nextcloud-devs/client

apt install -y \
haskell-stack zsh emacs i3 tmux tree volumeicon-alsa \
openjdk-11-jdk maven google-cloud-sdk kubectl google-cloud-sdk-cbt docker-ce \
ttf-mscorefonts-installer fonts-inconsolata fonts-open-sans fonts-hack-ttf fonts-font-awesome \
xbacklight libssl-dev pm-utils openssl compton feh blueman vlc nextcloud-client \
'ubuntu-wallpapers-*' redshift-gtk rxvt-unicode py3status rofi \
libx11-dev libxi-dev libxcb-util-dev libx11-xcb-dev libxcb-randr0-dev asciidoc \
snapd golang cargo autoconf git

snap install code --classic
snap install spotify bitwarden

go get -u github.com/GoogleCloudPlatform/docker-credential-gcr

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -P ~/Downloads/
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.16.6319.tar.gz -P ~/Downloads/

cargo install i3-style

git clone https://github.com/Airblader/xedgewarp $HOME/github/xedgewarp
cd $HOME/github/xedgewarp
make
make install

usermod -a -G video $LOGNAME
usermod -a -G docker $LOGNAME

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
git clone https://github.com/gcuisinier/jenv.git ~/.jenv
