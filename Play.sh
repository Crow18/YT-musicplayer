#!/bin/bash

install-dependencies()
{
	sudo apt install -y mpv youtube-dl
}

PlayFromYT()
{
	if [[ -z "$1" ]]
	then
	       	echo "Enter a song to search as first arg"
       	else 
		mpv "$(youtube-dl --default-search 'ytsearch1:' \"$1\" --get-url | tail -1)"
	fi
}

if [ $(dpkg-query -Wf='${Status}' mpv youtube-dl 2> /dev/null | grep -c "installed") -eq 0 ]
then
	install-dependencies
else
	PlayFromYT $1
fi
