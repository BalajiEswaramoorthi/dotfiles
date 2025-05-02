return {
	{
		'nacro90/numb.nvim',
		event = {
			'CmdlineEnter',
		},
		config = function()
			require('numb').setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		keys = {
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", desc = "GitSigns preview hunk" },
			{ "<leader>gt", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle Current Line Blame" },
		},
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
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		lazy = false, -- neo-tree will lazily load itself
		---@module "neo-tree"
		---@type neotree.Config?
		opts = {
			-- fill any relevant options here
		},
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
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		enabled = true,
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						width = { padding = 0 },
						height = { padding = 0 },
						preview_width = 0.5,
					},
					vertical = { width = 0.5 }
					-- other layout configuration here
				},
				file_ignore_patterns = {
					"node_modules",
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
				},
				diagnostics = {
					theme = "dropdown",
				},
			},
		},
		keys = {
			{
				"<leader>tgw",
				function()
					require("telescope.builtin").live_grep({
						default_text = vim.fn.expand("<cWORD>"),
					})
				end,
				desc = "Live grep word address under cursor",
			},
		}
	},
}
