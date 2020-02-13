#This only works on Debian based Linux distro's due to apt installation

# YT-musicplayer
plays Youtube music from terminal using mpv.

HOW TO USE:
1) chmod +x Play.sh
2) ./Play "[song name]" e.g. ./Play.sh "21 savage immortal"

HOW IT WORKS:
1) Function install-dependencies() will install youtube-dl and mpv using apt

2) Function PlayFromYT() checks if its first arg is not empty, if so display message else it would 
   search for the url and also plays the song through mpv

3) check if dependencies are installed  by checking dpkg-query and formating it to the status field
   then grep count to check if it is equal to zero, if true then execute install-dependencies else 
   execute PlayFromYT and an argument as the function checks the first arg
