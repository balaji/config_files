#!/bin/sh

cd $HOME

mkdir .emacs.d
mkdir .config/i3
mkdir .config/polybar
mkdir github
mkdir bin

git clone https://github.com/balaji/config_files ~/github/config_files

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cd $HOME/.emacs.d
ln -s ~/github/config_files/emacs/init.el init.el

cd $HOME/.config/i3
ln -s ~/github/config_files/i3/config config

cd $HOME/.config/polybar
ln -s ~/github/config_files/i3/polybar-config config
ln -s ~/github/config_files/i3/launch.sh launch.sh

cd $HOME
ln -s ~/github/config_files/i3/.i3status.conf .i3status.conf
ln -s ~/github/config_files/zsh/.profile .profile
ln -s ~/github/config_files/zsh/.zshrc .zshrc
ln -s ~/github/config_files/zsh/.zprofile .zprofile
ln -s ~/github/config_files/linux/.Xresources .Xresources
ln -s ~/github/config_files/linux/.fonts.font .fonts.conf
ln -s ~/github/config_files/vim/.vimrc .vimrc

cd $HOME/bin
ln -s ~/github/config_files/i3/monitors.sh monitors
ln -s ~/github/config_files/i3/single-monitor.sh single-monitor
ln -s ~/github/config_files/i3/spotify_status.py spotify_status.py

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

git clone https://github.com/balaji/zsh-git-prompt.git ~/github/zsh-git-prompt

cd $HOME/github/zsh-git-prompt
stack setup && stack build && stack install

cd $HOME
git config --global core.editor 'emacsclient -t'
git config --global user.name "Balaji Damodaran"
