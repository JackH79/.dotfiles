# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# Set a background color
# BG=""
# if which hsetroot >/dev/null 2>&1; then
#     BG=hsetroot
# else
#     if which esetroot >/dev/null 2>&1; then
# 	BG=esetroot
#     else
# 	if which xsetroot >/dev/null 2>&1; then
# 	    BG=xsetroot
# 	fi
#    fi
# fi
# test -z $BG || $BG -solid "#000000"

# D-bus
if which dbus-launch >/dev/null 2>&1 && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Make GTK apps look and behave how they were set up in the gnome config tools
# if test -x /usr/libexec/gnome-settings-daemon >/dev/null; then
#   /usr/libexec/gnome-settings-daemon &
# elif which gnome-settings-daemon >/dev/null 2>&1; then
#   gnome-settings-daemon &
# Make GTK apps look and behave how they were set up in the XFCE config tools
# elif which xfce-mcs-manager >/dev/null 2>&1; then
#  xfce-mcs-manager n &
# fi

# Preload stuff for KDE apps
# if which start_kdeinit >/dev/null 2>&1; then
#   LD_BIND_NOW=true start_kdeinit --new-startup +kcminit_startup &
# fi

# Run XDG autostart things.  By default don't run anything desktop-specific
# See xdg-autostart --help more info
# DESKTOP_ENV=""
# if which /usr/lib/openbox/xdg-autostart >/dev/null 2>&1; then
#  /usr/lib/openbox/xdg-autostart $DESKTOP_ENV
# fi
feh --bg-scale /home/jack/Pictures/Backgrounds/flamegirl.jpeg &
stalonetray --dockapp-mode simple &
(sleep 2 && conky) &
thunar --daemon &
