#!/bin/sh
#
# ~/.xinitrc
#
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
autocutsel -fork &
autocutsel -selection PRIMARY -fork &

### FOR JERRY
xsetroot -cursor_name left_ptr
unclutter -root -idle 3 &
keynav &

### WALLPAPER
imlibsetroot -s /home/jack/.backgrounds/wanaka.jpg &

### XCOMPMGR
xcompmgr -cCfFD 3 &

#### REMOVE CAPS LOCK
(sleep 3 && xmodmap -e "remove Lock = Caps_Lock" && xmodmap -e "keysym Caps_Lock = Shift_L") &

### EXECUTE WM and POWERMANAGER
#exec ck-launch-session bash -c "xfce4-power-manager & xmonad"
exec ck-launch-session dbus-launch xmonad
