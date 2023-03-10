#!/bin/bash
OS=$(awk -F= '/^ID_LIKE/{print $2}' /etc/os-release);

vim_pkgs="vim curl tmux git"
nvim_pkgs="wget git tmux  build-essential ripgrep wl-clipboard luarocks python3 python3-pip npm"
cmd_header=""

apt-get(){
  echo "$cmd_header apt install -y $@"
  $cmd_header apt install -y $@
}

vim(){
  apt-get $vim_pkgs
  ln -sf ~/.vim/vimrc vimrc
}

nvim(){
  apt-get $nvim_pkgs
  wget -O nvim.deb https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
  $cmd_header dpkg -i nvim.deb
  cp -r nvim  ~/.config/nvim
}

sync(){
  ln -sf tmux ~/.tmux.conf
  #ln -sf ~/.tmux.conf tmux
  tmux source-file ~/.tmux.conf
}


if [ -z "$2" ]
then
  echo  "Syntax: ./install vim|nvim root|sudo"
else
  if [ "$2" == "root" ]
  then
    cmd_header=""
  elif [ "$2" == "sudo" ]
  then
    cmd_header="sudo"
  else
    echo "Error user mode"
    exit 0
  fi

  $1 $2
  sync
  echo "Install Successfully"
fi
