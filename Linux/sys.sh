#!/bin/bash
#This makes the reseaerch directory if it doesn't already exist.
sysinfo=~/research/sys_info.txt

if [! -d ~/research ]
  then mkdir ~/research
fi
#This if removes the current printout to replace it with the new one when run
if [ -f $sysinfo]
   then rm sys_info.txt
fi
#This is the basic system info section
echo This is the sys_info > $sysinfo
#this displays the date
date >> $sysinfo
#this displays the machine type
echo $MACHTYPE >> $sysinfo
#this displays the IP address
ip addr |head -9 | tail -1 >> $sysinfo
#this displays the host name
hostname >> $sysinfo
#This displays all files that are executable by all actors in the / directory
find / -perm 777 >> $sysinfo
#This shows the top memory using apps
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} >> $sysinfo
#this for loop checks the permissions on the Passwd and Shadow files
sens=('/etc/shadow' '/etc/passwd')
for sens in ${sens[@]};
do 
	ls -la $sens
done
#This displays the months
months=(
	'january'
	'february'
	'march'
	'april'
	'may'
	'june'
	'july'
	'august'
	'september'
	'october'
	'november'
	'december'
)
for month in ${months[@]};
do 
	echo $month
done
#This displays the days
days=('mon' 'tues' 'wed' 'thur' 'fri' 'sat' 'sun')

for day in ${days[@]};
do
	echo $day
done

