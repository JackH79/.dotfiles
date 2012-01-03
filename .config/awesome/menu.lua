-- MENU
-- sub menus
networkmenu = {
	{ "opera",      "opera"                 },
	{ "firefox",    "firefox"               }
}
officemenu = {
	{ "writer",     "libreoffice -writer"   },
	{ "calc",       "libreoffice -calc"     },
	{ "impress",    "libreoffice -impress"  },
	{ "converter",  "convertall"            },
	{ "calculator", "kcalc"                 }
}
editorsmenu = {
	{ "kate",       "kate"                  }
}
graphicsmenu = {
	{ "gimp",       "gimp"                  },
	{ "gwenview",   "gwenview"              },
	{ "digikam",    "digikam"               }
}
utilitiesmenu = {
	{ "truecrypt",  "truecrypt"             }
}
awesomemenu = {
	{ "lock",       terminal .. " -e slock" },
	{ "restart",    awesome.restart         },
	{ "quit",       awesome.quit            },
	{ "reboot",     terminal .. " -e dbus-send --system --print-reply --dest='org.freedesktop.ConsoleKit' /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart" },
	{ "shutdown",   terminal .. " -e dbus-send --system --print-reply --dest='org.freedesktop.ConsoleKit' /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop" }
}

-- main menu
mymainmenu = awful.menu({
	items = {
		{ "network",   networkmenu       },
		{ "office",    officemenu        },
		{ "editors",   editorsmenu       },
		{ "graphics",  graphicsmenu      },
		{ "utilities", utilitiesmenu     },
		{ "awesome",   awesomemenu       },
		{ "terminal",  terminal          }
	}
})
