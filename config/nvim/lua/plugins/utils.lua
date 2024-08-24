return {
	{
		"fraso-dev/nvim-listchars",
		keys = {
			{ "<leader>lct", "<cmd>ListcharsToggle<CR>", desc = "Toggle listchars" },
		},
		config = function()
			require("nvim-listchars").setup({
				save_state = false,							-- If enabled, save toggled state in a cache file.
				-- Will overwrite current `vim.opt.list` value.
				listchars = { -- `listchars` to be displayed. See available options by running `:help listchars`
					tab		= "» ",
					trail	= ".",
					nbsp	= "+",
					space	= ".",
				},
				exclude_filetypes = {},						-- List of filetypes where `listchars` is disabled
				lighten_step = 5,							-- Amount to add/remove from base color
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<leader>cmd", "<cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
		},
		version = "*",
		opts = {
			shell = "bash",
			direction = "tab",
		}
	},
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
	},
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
		"farmergreg/vim-lastplace",
		config = function()
			vim.g.lastplace_ignore = "gitcommit,gitrebase,hgcommit,svn,xxd"
			vim.g.lastplace_ignore_buftype = "help,nofile,quickfix"
		end
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		keys = {
			{ "<leader>nt", "<cmd>Neotree<CR>", desc = "NeoTree open" },
		}
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
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
		}
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
