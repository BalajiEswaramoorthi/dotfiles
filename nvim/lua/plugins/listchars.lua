return {
	{
		"fraso-dev/nvim-listchars",
		keys = {
			{ "<leader>lct", "<cmd>ListcharsToggle<CR>", desc = "Toggle listchars" },
		},
		opts = {
			save_state = false,							-- If enabled, save toggled state in a cache file.
			-- Will overwrite current `vim.opt.list` value.
			listchars = { -- `listchars` to be displayed. See available options by running `:help listchars`
				tab		= "» ",
				trail	= ".",
				nbsp	= "+",
				--space	= ".",
			},
			exclude_filetypes = {},						-- List of filetypes where `listchars` is disabled
			lighten_step = 5,							-- Amount to add/remove from base color
		},
	},
}
