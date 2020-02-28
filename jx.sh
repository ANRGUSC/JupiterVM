#!/bin/bash

#adding jason's name here

#adding another comment

#adding third cmoment

#adding fourth comment

vmname = $1
vm=`VBoxManage list runningvms | grep $1`

if [ -z "$vm" ]
	then
	echo "VM not running"
	echo "Starting VM.. ."
	VBoxManage startvm "$1" --type headless
	for i in {1..20}
	do
		printf "$i "
		nc -zv -w1 "$1" 22 >> /dev/null 2>&1
	done

	echo "sshing..."
	sleep 3
else
	echo "VM running"
fi

if [ $1 == "j1" ]
then
sshport=2221
fi

if [ $1 == "j2" ]
then
sshport=2222
fi

if [ $1 == "j3" ]
then
sshport=2223
fi

ssh -C -p$sshport $1@localhost
