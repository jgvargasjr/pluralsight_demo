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
	echo $(systemctl status firewalld)
}
function script_temp()
{
	printf "\nName of script: "
	read script_n
	printf "\nScript destination: "
	read dest
	
	script_path=$dest$script_n
	
	printf "\nScript preview: $script_path \nCreate this script?[y/n]"
	read ans
	if [ $ans == 'y'  ]
	then
		touch $script_path
		chmod u+x $script_path
		printf "\nScript '$script_path' has been created."
	else
		printf "\nScript discarded"
	fi
}

printf "Hello "$name", what would you like to do?"

while [ $input != 'q'  ];
do
	printf "\n1.) List kernel version\n2.) Show firewall status\n3.) Create script template"
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
	else
		printf "Invalid selection, try again\n"
	fi

done
printf "Exiting script, until next time '$name'\n"
