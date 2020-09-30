#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -n "`/etc/X11/chooser.sh`" ]; then
 command="`/etc/X11/chooser.sh`"
else
 failsafe="yes"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if [ -n "$failsafe" ]; then
 hour=$(date +"%H")
 exec urxvtd &
 exec emacs --daemon &
 while true; do
	 xsetroot -name " $(vpn) | $(battery) | $(date +"%F %R %s") "
   sleep 1s    # Update time every second
 done &
 exec setxkbmap us -variant colemak &
 exec xmodmap ~/.Xmodmap &
 exec feh --bg-fill /home/fra/images/wall/dino.jpg &
 exec redshift -t 6501:3500 &
 exec dwm
else
 exec $command
fi
