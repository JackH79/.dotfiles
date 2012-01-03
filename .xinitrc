#!/bin/sh
#
# ~/.xinitrc

### Power-/Screen-savers off
# for tty
setterm -blank 0
setterm -powerdown 0
# for X
xset -dpms
xset s off
xset s noblank
xset s noexpose
xset r rate 340 25

### Use Ctrl-Alt-BkSp to kill X
setxkbmap -option terminate:ctrl_alt_bksp &

### Update Xresources
xrdb -merge ~/.Xresources

### Urxvt daemon
urxvtd -q -o -f &

### Additional font paths
xset +fp /usr/share/fonts/local
xset fp rehash

### Set wallpaper
imlibsetroot -s /home/jack/.backgrounds/pale-moss.jpg &

### Unclutter
unclutter -root -idle 3 &

### Autocutsel
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

### Execute window manager
exec ck-launch-session bash -c "xfce4-power-manager & awesome"
