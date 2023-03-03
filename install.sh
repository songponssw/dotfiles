#!/bin/bash
OS=$(awk -F= '/^ID_LIKE/{print $2}' /etc/os-release);

vim_pkgs="vim curl tmux git"
nvim_pkgs="wget git build-essential ripgrep wl-clipboard luarocks python3 python3-pip npm"
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
  wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
  dpkg -i nvim-linux64.deb
}

sync(){
  cd dotfiles cp -r nvim  ~/.config/nvim
  ln -sf ~/.vim/tmux ~/.tmux.conf
  tmux source-file ~/.tmux.conf"
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
