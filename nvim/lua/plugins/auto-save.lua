return {
	{
		"okuuva/auto-save.nvim",
		enabled = true,
		cmd = "ASToggle",								-- optional for lazy loading on command
		event = {
			"TextChanged"
		},												-- optional for lazy loading on trigger events
		opts = {
			cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
			noautocmd = false, -- do not execute autocmds when saving
			debounce_delay = 1000, -- delay after which a pending save is executed
		},
	}
}
