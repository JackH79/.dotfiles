#!/bin/sh
#
# ~/.xinitrc

xset -dpms
xset s off
export GTK2_RC_FILES="/home/jack/.gtkrc-2.0"
urxvtd -q -o -f &
unclutter -root -idle 3 &
xmodmap /home/jack/.Xmodmap &
exec ck-launch-session awesome
