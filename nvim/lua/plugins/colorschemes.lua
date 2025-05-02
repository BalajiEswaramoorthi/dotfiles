return {
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
					functions = { bold },
					keywords = { bold },
					strings = {},
					variables = { bold },
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
						rosewater	= "#fed1cb",
						flamingo	= "#ff9185",
						yellow		= "#FF0000",
						pink		= "#d699b6",
						mauve		= "#cb7ec8",
						red			= "#e06062",
						maroon		= "#e67e80",
						peach		= "#e69875",
						yellow		= "#d3ad63",
						green		= "#06F52B",
						teal		= "#ffffff",
						sky			= "#7fbbb3",
						sapphire	= "#60aaa0",
						blue		= "#59a6c3",
						lavender	= "#e0d3d4",
						text		= "#ffffff",
						subtext1	= "#e0d7c3",
						subtext0	= "#d3c6aa",
						overlay2	= "#786d5a",
						overlay1	= "#8c7c62",
						overlay0	= "#a18d66",
						surface2	= "#c9bea5",
						surface1	= "#d8d3ba",
						surface0	= "#e8e2c8",
						base		= "#000000",
						mantle		= "#000000",
						crust		= "#000000",
					},
				},
				custom_highlights = function(colors)
					return {
						Comment = { fg = colors.sky },
						--TabLineSel = { bg = colors.pink },
						--CmpBorder = { fg = colors.surface2 },
						--Pmenu = { bg = colors.none },
					}
				end
			})
		end
	},
	{
		"EdenEast/nightfox.nvim",
		opts = {
			options = {
				-- Compiled file's destination location
				compile_path = vim.fn.stdpath("cache") .. "/nightfox",
				compile_file_suffix = "_compiled", -- Compiled file suffix
				transparent = false,     -- Disable setting background
				terminal_colors = false,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
				dim_inactive = false,    -- Non focused panes set to alternative background
				module_default = true,   -- Default enable value for modules
				colorblind = {
					enable = false,        -- Enable colorblind support
				},
				styles = {							-- Style to be applied to different syntax groups
					comments		= "NONE",		-- Value is any valid attr-list value `:help attr-list`
					conditionals	= "bold",
					constants		= "NONE",
					functions		= "bold",
					keywords		= "bold",
					numbers			= "NONE",
					operators		= "bold",
					strings			= "NONE",
					types			= "bold",
					variables		= "NONE",
				},
				modules = {				-- List of various plugins and additional options
					--"treesitter",
				},
			},
			palettes = {
				carbonfox = {
					bg1			= "#000000",		-- Black background
					red			= "#F50623",
					green		= "#00FF00",
					white		= "#FFFFFF",
					blue		= "#0000FF",
					orange		= "#FF6E13",
				},
			},
			specs = {
				-- As with palettes, the values defined under `all` will be applied to every style.
				all = {
					syntax = {
						-- Specs allow you to define a value using either a color or template. If the string does
						-- start with `#` the string will be used as the path of the palette table. Defining just
						-- a color uses the base version of that color.
					},
					git = {
						-- A color define can also be used
						changed = "#f4a261",
					},
				},
				carbonfox = {
					syntax = {
						bracket     = "green",				-- Brackets and Punctuation
						builtin0    = "red.base",			-- Builtin variable
						builtin1    = "cyan.bright",		-- Builtin type
						builtin2    = "orange.bright",		-- Builtin const
						builtin3    = "red",				-- Not used
						comment     = "white.dim",			-- Comment
						conditional = "magenta.bright",		-- Conditional and loop
						const       = "orange.bright",		-- Constants, imports and booleans
						dep         = "white",				-- Deprecated
						field       = "blue.base",			-- Field
						func        = "orange",				-- Functions and Titles
						ident       = "cyan.base",			-- Identifiers
						keyword     = "magenta.base",		-- Keywords
						number      = "yellow",				-- Numbers
						operator    = "white",				-- Operators
						preproc     = "pink.bright",		-- PreProc
						regex       = "yellow.bright",		-- Regex
						statement   = "magenta.base",		-- Statements
						string      = "red",				-- Strings
						type        = "yellow.base",		-- Types
						variable    = "orange",				-- Variables
					},
				},
			},
			groups = {},
		},
		enabled = true,
	},
}
