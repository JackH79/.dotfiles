#!/bin/sh
#
# ~/.xinitrc
#
# JackH79
# May 2012

### ADDITIONAL FONT PATHS
xset +fp /usr/share/fonts/local
xset fp rehash

### SCREENSAVERS OFF
# for X
xset -dpms
xset s off
xset s noblank
xset s noexpose
# for tty
setterm -blank 0
setterm -powerdown 0

### SET KEY REPEAT RATE
xset r rate 340 25

### CTRL-ALT-BKSP TO KILL X
setxkbmap -option terminate:ctrl_alt_bksp &

### UPDATE XRESOURCES
xrdb -merge ~/.Xresources

### URXVT DAEMON
urxvtd -q -o -f &

### AUTOCUTSEL
#autocutsel -fork &
#autocutsel -selection PRIMARY -fork &

### WALLPAPER
imlibsetroot -s /home/jack/.backgrounds/convent.jpg &

### XCOMPMGR
xcompmgr -cCfFD 3 &

### REDSHIFT
# redshift -l -19.25:146.81 -t 6500:5000 -b 1.0:0.6 &
redshift -l 51.19:6.60 -t 6500:5000 -b 1.0:0.6 &

#### REMOVE CAPS LOCK
(sleep 3 && xmodmap -e "remove Lock = Caps_Lock" && xmodmap -e "keysym Caps_Lock = Shift_L") &

### FOR JERRY
xsetroot -cursor_name left_ptr
unclutter -root -idle 3 &
keynav &

### EXECUTE WM and POWERMANAGER
#exec ck-launch-session bash -c "xfce4-power-manager & xmonad"
exec ck-launch-session dbus-launch xmonad
