#!/bin/bash

i=0

if [ $(ls /usr/local/bin | grep -c "youtube-dl") -eq 1 ]
then
	echo data not found
	let "i++"
elif [ $(dpkg-query -Wf='${Status}' mpv  2> /dev/null | grep -c "installed") -eq 1 ]
then
	echo "data not found"
	let "i++"
else
	echo "yuh"
fi

echo $i

