#!/bin/bash

### Variable Declarations ###
name=$(whoami)
input=junk


### Functions #####
function kernel_version()
{
	echo $(uname -r)
}
function system_status()
{
	systemctl status firewalld
}
function script_temp()
{
	# User input for script 
	printf "\nName of script: "
	read script_n
	printf "\nScript destination: "
	read dest
	script_path=$dest$script_n
	
	printf "\nScript preview: $script_path \nCreate this script?[y/n]"
	read ans
	# Check if user accepts new script
	if [ $ans == 'y'  ]
	then
		touch $script_path
		chmod u+x $script_path
		echo '#!/bin/bash' >> $script_path
		printf "\nScript '$script_path' has been created."
	else
		printf "\nScript discarded"
	fi
}
function backup_config_files()
{
	cp /etc/*.conf /backup
	printf "Backup complete\n"
}

## Main code body ###
#####################

printf "Hello "$name", what would you like to do?"

while [ $input != 'q'  ];
do
	printf "\n-----------------------------------\nSelect from the following -----------\n1.) List kernel version\n2.) Show firewall status\n3.) Create script template\n4.) Backup config files\n"
	
	printf "Type: 'h' for help and 'q' to quit\n"
	
	#read -p '' input
	read input
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
	else
		printf "Invalid selection, try again\n"
	fi

done
printf "Exiting script, until next time '$name'\n"
