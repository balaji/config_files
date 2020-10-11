#!/bin/sh

cd $HOME
rm .profile
mkdir .emacs.d
mkdir .config/i3
mkdir github
mkdir bin
mkdir -p .config/systemd/user

git clone https://github.com/balaji/config_files ~/github/config_files

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd $HOME/.emacs.d
ln -s ~/github/config_files/emacs/init.el init.el

cd $HOME/.config/i3
ln -s ~/github/config_files/i3/config config

cd $HOME
ln -s ~/github/config_files/i3/.i3status.conf .i3status.conf
ln -s ~/github/config_files/zsh/.profile .profile
ln -s ~/github/config_files/tmux/.tmux.conf .tmux.conf
ln -s ~/github/config_files/zsh/.zshrc .zshrc
ln -s ~/github/config_files/zsh/.zprofile .zprofile
ln -s ~/github/config_files/linux/.Xresources .Xresources
ln -s ~/github/config_files/linux/.fonts.conf .fonts.conf
ln -s ~/github/config_files/vim/.vimrc .vimrc

cd $HOME/bin
ln -s ~/github/config_files/i3/monitors.sh mrs
ln -s ~/github/config_files/i3/spotify_status.py spotify_status.py

cd $HOME/.config/systemd/user
ln -s ~/github/config_files/linux/startup-services/emacs.service emacs.service
ln -s ~/github/config_files/linux/startup-services/urxvtd.service urxvtd.service

mkdir $HOME/.config/dunst
cd $HOME/.config/dunst
ln -s ~/github/config_files/i3/dunstrc dunstrc

systemctl --user enable emacs.service
systemctl --user enable urxvtd.service

systemctl --user start emacs.service
systemctl --user start urxvtd.service

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

git clone https://github.com/balaji/zsh-git-prompt.git ~/github/zsh-git-prompt

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source .tmux.conf

cd $HOME/github/zsh-git-prompt
stack setup && stack build && stack install

cd $HOME
git config --global core.editor 'emacsclient -t'
git config --global user.name "Balaji Damodaran"
git config --global --add hub.host ghe.spotify.net
git config --global user.email "balaji@spotify.com"

source $HOME/.zshrc
