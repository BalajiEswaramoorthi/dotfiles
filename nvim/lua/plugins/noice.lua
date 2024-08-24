return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-notify",
		},
		opts = {
			presets = {
				bottom_search = false,					-- Use a classic bottom cmdline for search
				command_palette = true,					-- Position the cmdline and popupmenu together
				long_message_to_split = true,			-- Long messages will be sent to a split
				lsp_doc_border = false,					-- Add a border to hover docs and signature help
			},
			routes = {
				-- Hide written message
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = {
						skip = true
					},
				},
			},
			cmdline = {
				--view = "cmdline",
			},
		},
	}
}
