return {
	{
		"tpope/vim-fugitive",
	},
	{
		"lewis6991/gitsigns.nvim",
		--keys = {
		--	{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "GitSigns preview hunk" },
		--	{ "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Current Line Blame" },
		--},
		config = function()
			require("gitsigns").setup({
			})
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},
}
