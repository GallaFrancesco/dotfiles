# Defined in - @ line 1
function shufwall --description 'alias shufwall=feh --bg-fill /home/fra/images/wall/(ls /home/fra/images/wall/ | shuf -n 1)'
	feh --bg-fill /home/fra/images/wall/(ls /home/fra/images/wall/ | shuf -n 1) $argv;
end
