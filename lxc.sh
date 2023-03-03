#!/bin/bash
# This script made for iterate lxc conmand in loop
nstart=1
nstop=1

loop_driver(){
  for (( i=$nstart; i<=$nstop; i++ ));
	do
    echo "$1 device-$i"
    $1 device-$i $2
	done
}

set-resource(){
  loop_driver "lxc config set" "limits.cpu 1"
}
clone(){
  loop_driver "lxc copy device-21"
}

delete(){
  loop_driver "lxc delete"
}

start(){
  loop_driver "lxc start"
}

stop(){
  loop_driver "lxc stop"
}

reboot(){
  loop_driver "lxc restart"
}

disable-start(){
  loop_driver "lxc config set" "boot.autostart false"
}

ip(){
  lxc list -c "n4" -f csv | cut -d " " -f1 | cut -d "," -f2 | awk '{print "\047"$1"\047"","}' | tr -d '\n'
}



if [ -z "$1" ]
then
  echo  "Syntax: ./command start|stop|restart"
  exit 0
fi

if [ ! -z "$2" ] && [ ! -z "$3" ]
then
  nstart=$2
  nstop=$3
  echo "set nstart"
fi

$1
