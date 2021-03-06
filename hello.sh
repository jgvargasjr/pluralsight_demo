#!/bin/bash

### Variable Declarations ###
name=$(whoami)
input=junk

. functions.sh

## Main code body ###
#####################

spacing="\n-----------------------------------"

printf "$spacing\nHello "$name", what would you like to do?"

while [ $input != 'q'  ];
do

	printf "$spacing\nSelect from the following ---------\n1.) List kernel version\n2.) Show firewall status\n3.) Create script template\n4.) Backup config files\n5.)List users\n6.) List groups $spacing"
	
	printf "Type: 'h' for help and 'q' to quit\n"
	
	read -r input
	input=$input

	if [ $input == 1 ]
	then
		kernel_version
	elif [ $input == 2 ]
	then
		system_status
	elif [ $input == 3 ]
	then	
		script_temp
	elif [ $input == 4  ]
	then
		backup_config_files
	elif [ $input == 5 ]
	then
		display_users
	elif [ $input == 6 ]
	then
		display_groups
	else
		printf "Invalid selection, try again\n"
	fi

done
printf "Exiting script, until next time '$name'\n"
