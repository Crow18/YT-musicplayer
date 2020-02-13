#!/bin/bash

install-dependencies()
{
	sudo apt install -y mpv wget
	sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
	sudo chmod a+rx /usr/local/bin/youtube-dl
}

SelectFromSearch()
{
	firtsarg=$1
	selection="youtube-dl --get-title --default-search ytsearch10:" 
	eval "$selection $1" | awk '{printf "%d %s\n", NR, $0}'
	echo which track would you like to hear?
	read num
}


PlayFromYT()
{
	if [[ -z "$1" ]]
	then
	       	echo "Enter a song to search as first arg"
       	else
		mpv "$(youtube-dl --default-search 'ytsearch:' \"$1\" --get-url | tail -1)"
	fi
}

if [ $(dpkg-query -Wf='${Status}' mpv youtube-dl 2> /dev/null | grep -c "installed") -eq 0 ]
then
	install-dependencies
#	PlayFromYT $1

else
#	PlayFromYT $1
	SelectFromSearch
fi
