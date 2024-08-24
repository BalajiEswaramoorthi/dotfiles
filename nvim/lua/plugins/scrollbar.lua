return {
	{
		"dstein64/nvim-scrollview",
		event = {
			"BufWinEnter",
			"BufEnter",
		},
		opts = {
			excluded_filetypes = {
				"NvimTree",
			},
		}
	}
}
