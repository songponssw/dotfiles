#!/bin/bash
# This script made for KVM loop

nstart=01
nstop=20

start(){
  for (( i=1; i<=9; i++ ));
	do
		virsh start device-0$i
	done

  for (( i=10; i<=20; i++ ));
	do
		virsh start device-$i
	done
}

reboot(){
  for (( i=1; i<=9; i++ ));
	do
		virsh reboot device-0$i
	done

  for (( i=10; i<=20; i++ ));
	do
		virsh reboot device-$i
	done
}

shutdown(){
  for (( i=1; i<=9; i++ ));
	do
		virsh shutdown device-0$i
	done

  for (( i=10; i<=20; i++ ));
	do
		virsh shutdown device-$i
	done
}



ip(){
	virsh net-dhcp-leases default | awk '{ print $6"\t"$5 }' | sort  | cut -d "/" -f 1 | awk '{print $2}'
}

mount-dir(){
	ssh_cmd="ssh -oStrictHostKeyChecking=no"
	readarray IPS < ip_1-20
	for i in ${IPS[@]};
	do
		echo $i
		#sshpass -p "1zqa2xws" $ssh_cmd $i 'echo "1zqa2xws" | sudo -S mkdir ~/dataset'
		#sshpass -p "1zqa2xws" $ssh_cmd $i 'echo "1zqa2xws" | sudo -S -k chown -R 777 ~/dataset'
		sshpass -p "1zqa2xws" $ssh_cmd $i 'echo "1zqa2xws" | sudo -S -k mount -t 9p -o trans=virtio /dataset ~/dataset'
	done

}

test-dir(){
	ssh_cmd="ssh -oStrictHostKeyChecking=no"
	readarray IPS < ip_1-20
	for i in ${IPS[@]};
	do
		sshpass -p "1zqa2xws" $ssh_cmd $i 'hostname; ls ~/dataset'
	done

}

$1
