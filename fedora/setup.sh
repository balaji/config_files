#!/bin/sh
dnf install -y git wget curl

# corretto
rpm --import https://yum.corretto.aws/corretto.key
curl -L -o /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo

# docker
dnf -y install dnf-plugins-core
dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

# google-cloud-sdk
tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM

# google-chrome
cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF

# vs code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
cat << EOF > /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF

# dnf installs
dnf install -y zsh tmux cabextract google-chrome-stable \
cascadia-fonts-all fontawesome-fonts liberation-fonts \
docker-ce docker-ce-cli containerd.io \
i3 volumeicon blueman xbacklight feh rofi py3status rxvt-unicode \
code emacs vim-enhanced \
java-11-amazon-corretto-devel golang erlang \
maven conda google-cloud-sdk cargo stack \
openfortivpn NetworkManager-fortisslvpn NetworkManager-fortisslvpn-gnome plasma-nm-fortisslvpn breeze-gtk

# microsoft core fonts
rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm


# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# brew installs
brew install hub fzf kubectx nvm jenv

# backlight for i3
sudo cp ~/github/config_files/linux/devices/20-intel.conf /usr/share/X11/xorg.conf.d/
