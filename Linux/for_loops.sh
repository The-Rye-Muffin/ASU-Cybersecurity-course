 #!/bin/bash

states=( 'California' 'Hawaii' 'Washington' 'Michigan' 'Arizona' )

for state in ${states[@]}
do
	if [ $state == 'California' ];
	then echo  "SoCal is the best!"
	else echo "I'm not fond of SoCal"
	fi
done

for user in  $(ls /home);
do
	for item in $(find /home/$user -iname '*.sh' 2> /dev/null);
	do
		echo -e "Found a script in $user's home folder! \n$item"
	done
done

