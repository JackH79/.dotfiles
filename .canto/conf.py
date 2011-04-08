from canto.extra import *
import os
if os.getenv("TERM") == "linux":
	link_handler("links \"%u\"", text=True)
	image_handler("fbi \"%u\"", text=True, fetch=True)
else:
	link_handler("luakit \"%u\"")
	image_handler("sxiv \"%u\"", fetch=True)

colors[0] = ("white", "default")
colors[1] = ("blue", "default")
colors[2] = ("white", "default")
colors[3] = ("green", "default")
colors[4] = ("magenta", "default")
colors[5] = ("white", "black")
colors[6] = ("blue", "default")
reader_lines = 20
default_rate(30)
default_keep(20)
add("http://www.nationstates.net/cgi-bin/rss.cgi?nation=ngaloo&key=881276&nh=1")
add("http://www.archlinux.org/feeds/news/")
add("http://rss.gmane.org/messages/complete/gmane.comp.window-managers.awesome")
