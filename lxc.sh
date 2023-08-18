#!/bin/bash
nstart=71
nstop=90
name="mc"
#name="device"

loop_driver(){
  for (( i=$nstart; i<=$nstop; i++ ));
	do
    echo "$1 $name-$i $2"
    cmd="$1 $name-$i $2"
    $cmd
	done
}

limit_cpu_driver(){
  hop=$3
  idx=0
  for (( i=$nstart; i<=$nstop; i++ ));
  do
	  # No Hyperthread
	  echo "$1 $name-$i $2 $((idx))-$((idx))"
	  $1 $name-$i $2 $((idx))-$((idx))

	  # Hyperthread
	  # $1 $name-$i $2 $((idx)),$((idx + $(( $hop )) ))   # For hyper thread
	  #$1 $name-$i $2 $((i - 1)),$((i + $((ntop +1)) ))

	  idx=$(( idx +1 ))
  done;
}

reset-cpu(){
  loop_driver "lxc config set" 'limits.cpu ""'
}

pin-cpu-10(){
  limit_cpu_driver "lxc config set" "limits.cpu" "10"
}

clone(){
  loop_driver "lxc copy mc-test"
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

send-cmd(){
  target_cmd=`echo $@ | cut -d " " -f 2-`
  loop_driver "lxc exec" "-- $target_cmd"
}

shell(){
  echo "lxc exec "$2" -- su - thor"
  lxc exec "$2" -- su - thor
}

link-storage-pubsub(){
  proj_name="pisces"
  source_dir="/storage/plato-pisces"
  dest_dir="/home/thor/plato-pisces"
  loop_driver "lxc config device add" "$proj_name disk source=$source_dir  path=$dest_dir"
}

link-storage-dataset(){
  proj_name="dataset"
  source_dir="/storage/dataset"
  dest_dir="/home/thor/dataset"
  loop_driver "lxc config device add" "$proj_name disk source=$source_dir  path=$dest_dir"
}

ip(){
  lxc list $name -c "n4" -f csv | cut -d " " -f1 | cut -d "," -f2 | awk '{print "\047"$1"\047"","}' | tr -d '\n'
}

ip-name(){
  lxc list $name -c "n4"
}







test-dir(){
	ssh_cmd="ssh -oStrictHostKeyChecking=no"
	readarray IPS < ip_71-90
	for i in ${IPS[@]};
	do
		sshpass -p "1zqa2xws" $ssh_cmd $i 'hostname; ls ~/dataset'
	done

}

set-env(){
	ssh_cmd="ssh -oStrictHostKeyChecking=no"
	readarray IPS < ip_21-80
	for i in ${IPS[@]};
	do
    sshpass -p "1zqa2xws" $ssh_cmd thor@$i 'echo "export DEVICE_GROUPS=coconut" > ~/.fl_group;'
    sshpass -p "1zqa2xws" $ssh_cmd thor@$i 'echo "source ~/.fl_group" >> ~/.bashrc'
	done

}


Help(){
 echo "This help"
 echo "send_cmd: ./command.sh send_cmd nstart nstop 'ls /home/thor'"
}

if [ -z "$1" ]
then
  echo  "Syntax: ./command start|stop|restart"
else
  len=$#
  if [ $len -le 2 ]; then
    nstart=71
    nstop=90
    $1 $@
  elif [ $len -ge 3 ]; then
    nstart=$2
    nstop=$3
    echo "$nstart $nstop"
    $1 ${@:4}
  fi
fi
