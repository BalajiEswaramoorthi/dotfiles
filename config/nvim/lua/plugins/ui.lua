return {
	{
		"lewis6991/satellite.nvim",
		config = function()
			require('satellite').setup({
				current_only = false,
				winblend = 50,
				zindex = 40,
				excluded_filetypes = {},
				width = 2,
				handlers = {
					cursor = {
						enable = true,
						-- Supports any number of symbols
						symbols = { '⎺', '⎻', '⎼', '⎽' }
						-- symbols = { '⎻', '⎼' }
						-- Highlights:
						-- - SatelliteCursor (default links to NonText
					},
					search = {
						enable = true,
						-- Highlights:
						-- - SatelliteSearch (default links to Search)
						-- - SatelliteSearchCurrent (default links to SearchCurrent)
					},
					diagnostic = {
						enable = true,
						signs = {'-', '=', '≡'},
						min_severity = vim.diagnostic.severity.HINT,
						-- Highlights:
						-- - SatelliteDiagnosticError (default links to DiagnosticError)
						-- - SatelliteDiagnosticWarn (default links to DiagnosticWarn)
						-- - SatelliteDiagnosticInfo (default links to DiagnosticInfo)
						-- - SatelliteDiagnosticHint (default links to DiagnosticHint)
					},
					gitsigns = {
						enable = false,
						signs = { -- can only be a single character (multibyte is okay)
							add = "│",
							change = "│",
							delete = "-",
						},
						-- Highlights:
						-- SatelliteGitSignsAdd (default links to GitSignsAdd)
						-- SatelliteGitSignsChange (default links to GitSignsChange)
						-- SatelliteGitSignsDelete (default links to GitSignsDelete)
					},
					marks = {
						enable = true,
						show_builtins = false, -- shows the builtin marks like [ ] < >
						key = 'm'
						-- Highlights:
						-- SatelliteMark (default links to Normal)
					},
					quickfix = {
						signs = { '-', '=', '≡' },
						-- Highlights:
						-- SatelliteQuickfix (default links to WarningMsg)
					}
				},
			})
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		enabled = false,
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
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		enabled = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require'treesitter-context'.setup{
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = nil,
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			}
		end
	},
	{
		"yamatsum/nvim-cursorline",
		enabled = true,
		config = function()
			require('nvim-cursorline').setup {
				cursorline = {
					enable = true,
					timeout = 1000,
					number = false,
				},
				cursorword = {
					enable = true,
					min_length = 3,
					hl = {
						underline = true,
						bold = true,
					},
				},
			}
		end
	},
}
