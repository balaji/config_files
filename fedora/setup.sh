#!/bin/sh

dnf group install @development-tools
dnf group install sway-desktop-environment
dnf builddep emacs

dnf install -y git wget curl zsh tmux mako fuzzel brightnessctl pamixer \
    playerctl ripgrep fd-find gimp pamixer pasystray fzf nextcloud-client \
    nm-applet
