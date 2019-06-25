#!/bin/sh

cd $HOME

mkdir .emacs.d
mkdir .config/i3
mkdir github

git clone https://github.com/balaji/config_files ~/github/config_files

cd $HOME/.emacs.d
ln -s ~/github/config_files/emacs/init.el init.el

cd $HOME/.config/i3
ln -s ~/github/config_files/i3/config config

cd $HOME
ln -s ~/github/config_files/i3/.i3status.conf .i3status.conf
ln -s ~/github/config_files/zsh/.profile .profile
ln -s ~/github/config_files/zsh/.zshrc .zshrc
ln -s ~/github/config_files/zsh/.zprofile .zprofile
ln -s ~/github/config_files/xmonad/.Xresources .Xresources
ln -s ~/github/config_files/xmonad/.fonts.font .fonts.conf

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

git clone https://github.com/balaji/zsh-git-prompt.git ~/github/zsh-git-prompt

cd $HOME/github/zsh-git-prompt
stack setup && stack build && stack install

cd $HOME
