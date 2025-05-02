vim.filetype.add({
    pattern = {
		-- log file --
		[ ".*log.*" ] = "log",
		[ "messages.*" ] = "log",
		[ "hostapd%.txt.*"] = "log",

		-- config file --
		[".*%.conf"] = "dosini",
    },
	filename = {
		[ "messages" ] = "log",
	}
})
