return {
	{
		"AckslD/nvim-neoclip.lua",
		enabled = false,
		dependencies = {
			-- you'll need at least one of these
			{ "nvim-telescope/telescope.nvim" },
			-- {'ibhagwan/fzf-lua'},
		},
		config = function()
			require('neoclip').setup()
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"hedyhli/outline.nvim",
		config = function()
			-- Example mapping to toggle outline
			vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

			require("outline").setup {
				-- Your setup opts here (leave empty to use defaults)
			}
		end,
	}
}
