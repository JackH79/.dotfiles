-- TAGS + TAG MATCHING
-- layouts
layouts = {
	awful.layout.suit.fair,
	awful.layout.suit.fair.horizontal,
	awful.layout.suit.tile,
	awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.tile.top,
	awful.layout.suit.max,
	awful.layout.suit.floating,
}

-- shifty: predefined tags
shifty.config.tags   = {
	["1"]        = { init = true, position = 1, layout = awful.layout.suit.tile                    },
	["2-web"]    = { position = 2, layout = awful.layout.suit.max, spawn = "luakit"                },
	["3-com"]    = { position = 3, layout = awful.layout.suit.max,  spawn = terminal .. " -e mutt" },
	["4-office"] = { position = 4, layout = awful.layout.suit.tile.bottom                          },
	["5-pdf"]    = { position = 5, layout = awful.layout.suit.tile.bottom                          },
	["6-gimp"]   = { position = 6, layout = awful.layout.suit.floating, spawn = "gimp"             },
	["7-video"]  = { position = 7, layout = awful.layout.suit.floating                             },
	["8-music"]  = { position = 8, layout = awful.layout.suit.tile.bottom                          },
	["torrent"]  = { layout = awful.layout.suit.max                                                },
	["picture"]  = { layout = awful.layout.suit.max                                                },
	["dial"]     = { layout = awful.layout.suit.max                                                },
}

-- shifty: tags matching and client rules
shifty.config.apps = {
	-- web
	{ match = { "Firefox", "luakit"                  }, tag = "2-web",                                               },
	-- communications
	{ match = { "mutt", "Lanikai"                    }, tag = "3-com",                                               },
	{ match = { "canto"                              }, tag = "3-com",                                               },
	{ match = { "irssi"                              }, tag = "3-com",                                               },
	--office
	{ match = { "VCLSalFrame", "abiword", "Gnumeric" }, tag = "4-office",                                            },
	{ match = { "geany"                              }, tag = "4-office",                                            },
	{ match = { "Zathura"                            }, tag = "5-pdf",                                               },
	-- gimp
	{ match = { "Gimp"                               }, tag = "6-gimp",                                              },
	{ match = { "gimp%-image%-window"                }, geometry = {175,15,930,770}, border_width = 0                },
	{ match = { "^gimp%-toolbox$"                    }, geometry = {0,15,175,770}, slave = true, border_width = 0    },
	{ match = { "^gimp%-dock$"                       }, geometry = {1105,15,175,770}, slave = true, border_width = 0 },
	--video
	{ match = { "MPlayer", "Vlc", "Audacity"         }, tag = "7-video",                                             },
	{ match = { "MPlayer"                            }, geometry = {0,15,nil,nil}, float = true                      },
	-- music
	{ match = { "ncmpcpp"                            }, tag = "8-music",                                             },
	-- miscellaneous
	{ match = { "rtorrent"                           }, tag = "torrent",                                             },
	{ match = { "Geeqie", "sxiv", "feh", "qiv"       }, tag = "picture",                                             },
	{ match = { "wicd%-curses", "wvdial"             }, tag = "dial",                                                },

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
