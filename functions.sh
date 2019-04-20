#!/bin/bash

declare -r PASSWD_FILE=/etc/passwd
user=$(whoami)
input=junk

function display_groups()
{
	break	
}

function display_users()
{
	# User defined user account have a UID of 1000 and higher
	# /etc/passwd format:
	# username:password:UID:GID:GECOS:/home/dir:shell
	
	while IFS= read -r line ; do
			echo $line
	done < $PASSWD_FILE
}

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
