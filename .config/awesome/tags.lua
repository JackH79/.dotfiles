-- TAGS
-- Layouts
layouts =
{
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.max,
	awful.layout.suit.floating
}

-- Shifty: predefined tags
shifty.config.tags   = {
	["1"]        = { init = true, position = 1, layout = awful.layout.suit.tile        },
	["2-net"]    = { position = 2, layout = awful.layout.suit.max, spawn = "opera"     },
	["3-office"] = { position = 3, layout = awful.layout.suit.max                      },
	["4-video"]  = { position = 4, layout = awful.layout.suit.floating                 },
	["5-music"]  = { position = 5, layout = awful.layout.suit.tile.bottom              },
	["6-gimp"]   = { position = 6, layout = awful.layout.suit.floating, spawn = "gimp" },
	["7"]        = { position = 7, layout = awful.layout.suit.max                      },
	["8"]        = { position = 8, layout = awful.layout.suit.max                      },
	["9"]        = { position = 9, layout = awful.layout.suit.max                      },
	["torrent"]  = { layout = awful.layout.suit.max                                    },
	["picture"]  = { layout = awful.layout.suit.max                                    },
	["dial"]     = { layout = awful.layout.suit.max                                    },
 }

-- Shifty: tags matching and client rules
shifty.config.apps = {
	-- net
	{ match = { "Opera", "Firefox"       }, tag = "2-net",                                               },
	{ match = { "mutt"                   }, tag = "2-net",                                               },
	{ match = { "irssi"                  }, tag = "2-net",                                               },
	--office
	{ match = { "VCLSalFrame", "Zathura" }, tag = "3-office",                                            },
	{ match = { "coed11.exe", "Artha"    }, tag = "3-office",                                            },
	-- gimp
	{ match = { "Gimp"                   }, tag = "6-gimp",                                              },
	{ match = { "gimp%-image%-window"    }, geometry = {176,15,929,800},                border_width = 0 },
	{ match = { "^gimp%-toolbox$"        }, geometry = {0,15,175,800},    slave = true, border_width = 0 },
	{ match = { "^gimp%-dock$"           }, geometry = {930,15,1280,800}, slave = true, border_width = 0 },
	--video
	{ match = { "MPlayer", "Vlc"         }, tag = "4-video", geometry = {15,30,nil,nil}, float = true    },
	-- music
	{ match = { "ncmpcpp"                }, tag = "5-music",                                             },
	-- miscellaneous
	{ match = { "rtorrent"               }, tag = "torrent",                                             },
	{ match = { "sxiv"                   }, tag = "picture",                                             },
	{ match = { "wicd%-curses"           }, tag = "dial",                                                },
	{ match = { "Convertall", "Kcalc"    }, float = true                                                 },
	
	-- client manipulation
	{ match = { "" },
		honorsizehints = false,
		buttons = awful.util.table.join (
		awful.button({        }, 1, function (c) client.focus = c; c:raise() end),
		awful.button({ modkey }, 1, awful.mouse.client.move),
		awful.button({ modkey }, 3, awful.mouse.client.resize))
	},
}

-- shifty: defaults
shifty.config.defaults = {
	layout = awful.layout.suit.max,
}
shifty.config.layouts = layouts
shifty.init()
