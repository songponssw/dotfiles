#!/bin/bash

OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release);
packages="vim curl tmux git";
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

git clone https://github.com/songponssw/vim.git ~/.vim
bash ~/.vim/install.sh
ln -sf ~/.vim/vimrc ~/.vimrc
