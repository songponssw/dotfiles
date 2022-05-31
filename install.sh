#!/bin/bash

OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release);

packages="vim curl tmux git";

<<<"
if [ "$OS" == '"Ubuntu"' ];
then
    echo "apt-get install $packages"
    sudo apt-get -y update 
    sudo apt-get install -y $packages
else
    echo "yum install $packages"
    sudo um -y update
    sudo yum install -y $packages
fi
"

mv vim .vim
ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/tmux ~/.tmux.conf
tmux source-file ~/.tmux.conf
