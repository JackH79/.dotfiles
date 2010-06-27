#!/bin/sh
#
# ~/.xinitrc

#feh --bg-scale /home/jack/.config/awesome/background/bg.png &
#exec ck-launch-session dbus-launch --exit-with-session openbox-session

xset -dpms
xset s off
export GTK2_RC_FILES="/home/jack/.gtkrc-2.0"
xscreensaver &
exec ck-launch-session dbus-launch --exit-with-session awesome

