-- MENU
networkmenu = {
	{ "luakit",      "luakit"                            },
	{ "firefox",     "firefox"                           },
	{ "mutt",        terminal .. " -e mutt"              },
	{ "irssi",       terminal .. " -e irssi"             },
	{ "wicd",        terminal .. " -e wicd-curses"       },
	{ "wvdial",      terminal .. " -e sudo wvdial optus" },
	{ "rtorrent",    terminal .. " -e rtorrent"          }
}
officemenu = {
	{ "abiword",     "abiword"              },
	{ "writer",      "libreoffice -writer"  },
	{ "gnumeric",    "gnumeric"             },
	{ "calc",        "libreoffice -calc"    },
	{ "impress",     "libreoffice -impress" },
	{ "speedcrunch", "speedcrunch"          },
	{ "r",           terminal .. " -e R"    }
}
editorsmenu = {
	{ "vim",         terminal .. " -e vim" },
	{ "geany",       "geany"               }
}
graphicsmenu = {
	{ "gimp",        "gimp"   },
	{ "sxiv",        "sxiv"   },
	{ "geeqie",      "geeqie" }
}
mediamenu = {
	{ "vlc",         "vlc"                     },
	{ "ncmpcpp",     terminal .. " -e ncmpcpp" },
	{ "audacity",    "audacity"                },
	{ "avidemux",    "avidemux2_gtk"           }
}
utilitiesmenu = {
	{ "xfburn",      "xfburn"    },
	{ "truecrypt",   "truecrypt" }
}
monitormenu = {
	{ "scroff",      "xrandr --output LVDS --off"        },
	{ "scron",       "xrandr --output LVDS --auto"       },
	{ "scrmax",      "xrandr --output VGA-0 --preferred" }
}
systemmenu = {
	{ "monitor",     monitormenu            },
	{ "htop",        terminal .. " -e htop" },
	{ "kill",        "xkill"                }
}
awesomemenu = {
	{ "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
	{ "restart",     awesome.restart                                               },
	{ "lock",        terminal .. " -e xscreensaver-command --lock"                 },
	{ "quit",        awesome.quit                                                  },
	{ "reboot",      terminal .. " -e reboot"                                      },
	{ "shutdown",    terminal .. " -e shutdown"                                    }
}
mainmenu = awful.menu({
	items = {
		{ "network",   networkmenu   },
		{ "office",    officemenu    },
		{ "editors",   editorsmenu   },
		{ "graphics",  graphicsmenu  },
		{ "media",     mediamenu     },
		{ "utilities", utilitiesmenu },
		{ "sytem",     systemmenu    },
		{ "awesome",   awesomemenu   }
	}
})
