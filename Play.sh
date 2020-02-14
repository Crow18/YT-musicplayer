#!/bin/bash

song=$1

install-dependencies()
{
	sudo apt install -y mpv wget
	sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
	sudo chmod a+rx /usr/local/bin/youtube-dl
}

SelectFromSearch()
{
	if [[ -z "$song" ]]
	then
	       	echo "Enter a song to search as first arg"
       	else
		echo "Searching please wait..."
		selection="youtube-dl --newline --get-title --default-search ytsearch10: $song"
		eval "$selection" | awk '{printf "%d %s\n", NR, $0}' | tee .YTStreamList
		if [ -s ".YTStreamList" ]
		then
			echo which track would you like to hear?
			read num
			echo "Loading..."
			newselect="sed -n "$num"p .YTStreamList"
			eval $newselect | cut -d " " -f 2- | tee .YTSelect | tr -s " " | tr -dc '[:alnum:]\n '
			play=$(cat ".YTSelect")
			mpv "$(youtube-dl -a .YTSelect --default-search ytsearch --get-url | tail -1)"
			#rm -rf .YTStreamList
		else
			echo "something went wrong! check your connection"
		fi
	fi
}


if [ $(dpkg-query -Wf='${Status}' mpv youtube-dl 2> /dev/null | grep -c "installed") -eq 0 ]
then
	install-dependencies
	SelectFromSearch $1
else
	SelectFromSearch $1
fi
