return {
	{
		"aliqyan-21/darkvoid.nvim",
	},
	{
		"flrnd/plastic.vim",
	},
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				default_integrations = true,
				integrations = {
					gitsigns = true,
					neotree = true,
					treesitter = true,
					notify = true,
					diffview = true,
					rainbow_delimiters = true,
					telescope = {
						enabled = true,
						-- style = "nvchad"
					}
				},
				flavour = "auto", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
				transparent_background = false, -- disables setting the background color.
				show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
				term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
				dim_inactive = {
					enabled = false, -- dims the background color of inactive window
					shade = "dark",
					percentage = 0.15, -- percentage of the shade to apply to the inactive window
				},
				no_italic = true, -- Force no italic
				no_bold = false, -- Force no bold
				no_underline = false, -- Force no underline
				styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
					comments = {}, -- Change the style of comments
					conditionals = {},
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
					miscs = {}, -- Uncomment to turn off hard-coded styles
				},
				color_overrides = {
					mocha = {
						-- custom everforest dark hard port
						--rosewater = "#fed1cb",
						--flamingo  = "#ff9185",
						-- red yellow = "#FF0000",
						--pink      = "#d699b6",
						--mauve     = "#cb7ec8",
						--red       = "#e06062",
						--maroon    = "#e67e80",
						--peach     = "#e69875",
						--yellow    = "#d3ad63",
						green     = "#06F52B",
						--teal      = "#6db57f",
						--sky       = "#7fbbb3",
						--sapphire  = "#60aaa0",
						--blue      = "#59a6c3",
						--lavender  = "#e0d3d4",
						--text      = "#e8e1bf",
						--text		= "#ffffff",
						--subtext1  = "#e0d7c3",
						--subtext0  = "#d3c6aa",
						--overlay2  = "#9da9a0",
						--overlay1  = "#859289",
						--overlay0  = "#6d6649",
						--surface2  = "#585c4a",
						--surface1  = "#414b50",
						--surface0  = "#374145",
						base = "#000000",
						--mantle = "#000000",
						--crust = "#000000",
					},
					latte = {
						-- custom everforest light hard port
						rosewater = "#a43b35",
						flamingo  = "#da3537",
						pink      = "#d332a1",
						mauve     = "#aa3685",
						red       = "#ff3532",
						maroon    = "#de3631",
						peach     = "#f36c0b",
						yellow    = "#bd8800",
						green     = "#596600",
						teal      = "#287e5e",
						sky       = "#52b1c7",
						sapphire  = "#3fb4b8",
						blue      = "#317da7",
						lavender  = "#474155",
						text      = "#4d4742",
						subtext1  = "#5b5549",
						subtext0  = "#6d6655",
						overlay2  = "#786d5a",
						overlay1  = "#8c7c62",
						overlay0  = "#a18d66",
						surface2  = "#c9bea5",
						surface1  = "#d8d3ba",
						surface0  = "#e8e2c8",
						base      = "#ebe4c8",
						mantle    = "#e1dab5",
						crust     = "#bdc0a0",
					},
				},
			})

			-- inside GNU screen this colorscheme is not working
			env_sty = os.getenv("STY")
			if (env_sty == nil) then
				--vim.cmd("colorscheme catppuccin-mocha")
				--vim.cmd("colorscheme darkvoid")
			end
		end
	},
	{
		'uloco/bluloco.nvim',
		lazy = false,
		dependencies = {
			"rktjmp/lush.nvim",
		},
		config = function()
			require("bluloco").setup({
				-- your optional config goes here, see below.
			})
			env_sty = os.getenv("STY")
			if (env_sty == nil) then
				--vim.cmd("colorscheme catppuccin-mocha")
				--vim.cmd("colorscheme bluloco-dark")
			end
		end,
	},
	{
		"navarasu/onedark.nvim",
		config = function()
			require('onedark').setup  {
				style = 'dark', -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				transparent = false,  -- Show/hide background
				term_colors = true, -- Change terminal color as per the selected theme style
				ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
				cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

				-- toggle theme style ---
				toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
				toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

				-- Change code style ---
				-- Options are italic, bold, underline, none
				-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
				code_style = {
					comments = 'none',
					keywords = 'bold',
					functions = 'none',
					strings = 'none',
					variables = 'none'
				},

				-- Lualine options --
				lualine = {
					transparent = false, -- lualine center bar transparency
				},

				-- Custom Highlights --
				colors = {}, -- Override default colors
				highlights = {}, -- Override highlight groups

				-- Plugins Config --
				diagnostics = {
					darker = true, -- darker colors for diagnostic
					undercurl = true,   -- use undercurl instead of underline for diagnostics
					background = true,    -- use background color for virtual text
				},
			}

			--env_sty = os.getenv("STY")
			--if (env_sty == nil) then
			--	vim.cmd("colorscheme onedark")
			--end
		end
	},
	{
		"nekowinston/milspec.nvim",
		config = function()
			env_sty = os.getenv("STY")
			if (env_sty == nil) then
				vim.cmd("colorscheme milspec")
			end
		end
	},
}
