-- MENU
networkmenu = {
	{ "firefox",     "firefox"                 },
	{ "ktorrent",    "ktorrent"                }
}
officemenu = {
	{ "kontact",     "kontact"                 },
	{ "abiword",     "abiword"                 },
	{ "writer",      "libreoffice -writer"     },
	{ "calc",        "libreoffice -calc"       },
	{ "impress",     "libreoffice -impress"    },
	{ "kcalc",       "kcalc"                   },
	{ "r",           terminal .. " -e R"       }
}
editorsmenu = {
	{ "vim",         terminal .. " -e vim"     },
	{ "kate",       "kate"                     }
}
graphicsmenu = {
	{ "gimp",        "gimp"                    },
	{ "gwenview",    "gwenview"                }
}
mediamenu = {
	{ "vlc",         "vlc"                     },
	{ "ncmpcpp",     terminal .. " -e ncmpcpp" },
	{ "audacity",    "audacity"                }
}
utilitiesmenu = {
	{ "k3b",         "k3b"                     },
	{ "truecrypt",   "truecrypt"               }
}
systemmenu = {
	{ "htop",        terminal .. " -e htop"    },
	{ "kill",        "xkill"                   }
}
awesomemenu = {
	{ "restart",     awesome.restart                                               },
	{ "quit",        awesome.quit                                                  },
	{ "reboot",      terminal .. " -e dbus-send --system --print-reply --dest='org.freedesktop.ConsoleKit' /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart" },
	{ "shutdown",    terminal .. " -e dbus-send --system --print-reply --dest='org.freedesktop.ConsoleKit' /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop" }
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
