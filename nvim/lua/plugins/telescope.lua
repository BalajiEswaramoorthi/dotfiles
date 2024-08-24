return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		enabled = true,
		lazy = true,
		config = function()
			require("telescope").setup({
				pickers = {
					find_files = {
						theme = "dropdown",
					},
					diagnostics = {
						theme = "dropdown",
					},
				},
				defaults = {
					file_ignore_patterns = {
						"node_modules"
					},
				},
			})
		end,
	},
}
