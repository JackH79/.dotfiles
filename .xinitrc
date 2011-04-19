#!/bin/sh
#
# ~/.xinitrc

### GENERAL STUFF
xset -dpms
xset s off
export GTK2_RC_FILES="/home/jack/.gtkrc-2.0"
xscreensaver &
unclutter -root -idle 3 &
xmodmap /home/jack/.Xmodmap &
urxvtd -q -o -f &
#xcompmgr -c &

### AWESOME
exec ck-launch-session awesome

### XMONAD
#imlibsetroot /home/jack/.background/bg.png &
#xsetroot -cursor_name left_ptr
#exec xmonad

### DWM
#imlibsetroot /home/jack/.background/bg.png &
#exec ck-launch-session dwm

### WMFS
#exec ck-launch-session wmfs
