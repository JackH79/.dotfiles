-- Global variables for luakit
globals = {
    homepage            = "http://www.google.com.au/",
    scroll_step         = 40,
    zoom_step           = 0.1,
    max_cmd_history     = 100,
    max_srch_history    = 100,
    default_window_size = "1280x800",

 -- Disables loading of hostnames from /etc/hosts (for large host files)
 -- load_etc_hosts      = false,
 -- Disables checking if a filepath exists in search_open function
 -- check_filepath      = false,
}

-- Make useragent
local arch = string.match(({luakit.spawn_sync("uname -sm")})[2], "([^\n]*)")
local lkv  = string.format("luakit/%s", luakit.version)
local wkv  = string.format("WebKitGTK+/%d.%d.%d", luakit.webkit_major_version, luakit.webkit_minor_version, luakit.webkit_micro_version)
local awkv = string.format("AppleWebKit/%s.%s+", luakit.webkit_user_agent_major_version, luakit.webkit_user_agent_minor_version)
globals.useragent = string.format("Mozilla/5.0 (%s) %s %s %s", arch, awkv, wkv, lkv)

-- Search common locations for a ca file which is used for ssl connection validation.
local ca_files = {
    -- $XDG_DATA_HOME/luakit/ca-certificates.crt
    luakit.data_dir .. "/ca-certificates.crt",
    "/etc/certs/ca-certificates.crt",
    "/etc/ssl/certs/ca-certificates.crt",
}
-- Use the first ca-file found
for _, ca_file in ipairs(ca_files) do
    if os.exists(ca_file) then
        soup.set_property("ssl-ca-file", ca_file)
        break
    end
end

-- Change to stop navigation sites with invalid or expired ssl certificates
soup.set_property("ssl-strict", false)

-- Set cookie acceptance policy
cookie_policy = { always = 0, never = 1, no_third_party = 2 }
soup.set_property("accept-policy", cookie_policy.always)

-- List of search engines. Each item must contain a single %s which is
-- replaced by URI encoded search terms. All other occurances of the percent
-- character (%) may need to be escaped by placing another % before or after
-- it to avoid collisions with lua's string.format characters.
-- See: http://www.lua.org/manual/5.1/manual.html#pdf-string.format
search_engines = {
    luakit      = "http://luakit.org/search/index/luakit?q=%s",
    --search engines
    goo         = "http://google.com/search?q=%s",                                                  -- Google search
      gmail     = "http://www.gmail.com/",                                                          -- Gmail
      image     = "http://google.com/images?q=%s",                                                  -- Google image search
      map       = "http://google.com/maps?q=%s",                                                    -- Google map search
      video     = "http://google.com/search?q=%s",                                                  -- Google video search
    duck        = "http://duckduckgo.com/?q=%s",                                                    -- DuckDuckGo search
    --reference
    wiki        = "http://en.wikipedia.org/wiki/Special:Search?search=%s",                          -- Wikipedia search
    imdb        = "http://imdb.com/find?s=all&q=%s",                                                -- Imdb search
    thes        = "http://thesaurus.reference.com/browse/%s",                                       -- Thesaurus search
    dict        = "http://dictionary.reference.com/browse/%s",                                      -- Dictionary search
    --computer
    sourceforge = "http://sf.net/search/?words=%s",                                                 -- Sourceforge search
    awiki       = "https://wiki.archlinux.org/index.php/Special:Search?search=%s",                  -- Arch Linux Wiki search
    aur         = "https://aur.archlinux.org/packages.php?O=0&K=%s",                                -- Arch Linux AUR search
    afor        = "https://bbs.archlinux.org/",                                                     -- Arch Linux Forum
    afos        = "http://www.google.com/search?q=site:bbs.archlinux.org+%s&tbo=1&tbs=qdr:y,sbd:1", -- Google results for Arch Forum, restricted to past year, sorted by date
    anew        = "https://bbs.archlinux.org/search.php?action=show_new",                           -- Arch Linux Forum show new threads
    git         = "https://github.com/JackH79/.dotfiles/",                                          -- JackH79's Git
    --news
    bbc         = "http://www.bbc.co.uk/news/",                                                     -- BBC News
    theaus      = "http://www.theaustralian.com.au/",                                               -- The Australian
    bullie      = "http://www.townsvillebulletin.com.au/",                                          -- Townsville Bulletin
    stuff       = "http://www.stuff.co.nz/",                                                        -- Stuff New Zealand
    nzherald    = "http://www.nzherald.co.nz/",                                                     -- New Zealand Herald
    --social
    face        = "http://www.facebook.com/",                                                       -- Facebook
}

-- Set google as fallback search engine
search_engines.default = search_engines.google
-- Use this instead to disable auto-searching
--search_engines.default = "%s"

-- Per-domain webview properties
-- See http://webkitgtk.org/reference/webkitgtk-WebKitWebSettings.html
domain_props = { 
    ["all"] = {
        ["enable-scripts"]          = true,
        ["enable-plugins"]          = true,
        ["enable-private-browsing"] = true,
        ["user-stylesheet-uri"]     = "",
    },
--    ["mail.google.com"] = {
--    ["enable-scripts"]          = true,
--    ["enable-plugins"]          = true,
--    ["enable-private-browsing"] = false,
--    },
   ["youtube.com"] = {
        ["enable-scripts"] = true,
        ["enable-plugins"] = true,
    },
    ["bbs.archlinux.org"] = {
        ["user-stylesheet-uri"]     = "file://" .. luakit.data_dir .. "/styles/archkiss.css",
        ["enable-private-browsing"] = true,
    },
}

-- vim: et:sw=4:ts=8:sts=4:tw=80
