-- SIGNALS
client.connect_signal("manage", function (c, startup)
-- 	-- uncomment for sloppy focus (focus follows mouse)
-- 	c:connect_signal("mouse::enter", function(c)
-- 		if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
-- 		and awful.client.focus.filter(c) then
-- 			client.focus = c
-- 		end
-- 	end)
	if not startup then
		if not c.size_hints.user_position and not c.size_hints.program_position then
			awful.placement.no_overlap(c)
			awful.placement.no_offscreen(c)
		end
	end
end)

client.connect_signal("focus",   function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
