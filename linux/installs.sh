#!/bin/sh
apt update && apt install -y curl wget software-properties-common apt-transport-https ca-certificates

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg |  apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub |  apt-key add -
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add -

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" |  tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add -
sudo add-apt-repository 'deb https://apt.corretto.aws stable main'

# bionic image for some packages.
add-apt-repository -y \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   bionic \
   stable"

add-apt-repository -y ppa:nextcloud-devs/client

curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft-archive-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'


apt-get install -y \
haskell-stack zsh emacs i3 tmux tree volumeicon-alsa \
java-common java-11-amazon-corretto-jdk maven google-cloud-sdk kubectl google-cloud-sdk-cbt docker-ce \
ttf-mscorefonts-installer fonts-inconsolata fonts-open-sans fonts-hack-ttf fonts-font-awesome \
xbacklight libssl-dev pm-utils openssl compton feh blueman vlc nextcloud-client \
'ubuntu-wallpapers-*' redshift-gtk rxvt-unicode py3status rofi \
libx11-dev libxi-dev libxcb-util-dev libx11-xcb-dev libxcb-randr0-dev asciidoc \
fonts-cascadia-code fonts-cantarell golang cargo autoconf git code spotify-client

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
