return {
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = function()
			local function total_num_lines()
				return vim.api.nvim_buf_line_count(0)
			end

			return {
				options = {
					theme = "auto", -- "auto", "catppuccin",
				},
				sections = {
					lualine_a = {
						{
							"mode",
							icons_enabled = true, -- Enables the display of icons alongside the component.
							right_padding = 2,
						},
					},
					lualine_b = {
						{
							"branch",
							icon = ''
						},
						{
							"diff",
							icon = "",
							colored = false,					-- Displays a colored diff status if set to true
							diff_color = {
								-- Same color values as the general color option can be used here.
								added    = 'LuaLineDiffAdd',    -- Changes the diff's added color
								modified = 'LuaLineDiffChange', -- Changes the diff's modified color
								removed  = 'LuaLineDiffDelete', -- Changes the diff's removed color you
							},
							symbols = {
								added = '+',
								modified = '~',
								removed = '-'
							},									-- Changes the symbols used by the diff.
							source = nil,						-- A function that works as a data source for diff.
							-- It must return a table as such:
							-- { added = add_count, modified = modified_count, removed = removed_count }
							-- or nil on failure. count <= 0 won't be displayed.
						}
					},
					lualine_c = {
						{
							"filename",
							file_status = true,					-- Displays file status (readonly status, modified status)
							newfile_status = false,				-- Display new file status (new file means no write after created)
							path = 1,							-- 0: Just the filename
							-- 1: Relative path
							-- 2: Absolute path
							-- 3: Absolute path, with tilde as the home directory
							-- 4: Filename and parent dir, with tilde as the home directory
							shorting_target = 40,				-- Shortens path to leave 40 spaces in the window for other components
							symbols = {
								modified = '[+]',				-- Text to show when the file is modified.
								readonly = '[-]',				-- Text to show when the file is non-modifiable or readonly.
								unnamed = '[No Name]',			-- Text to show for unnamed buffers.
								newfile = '[New]',				-- Text to show for newly created file before first write
							},
							icon = "",
						},
						{
							"searchcount",
							maxcount = 999,
							timeout = 500,
						},
					},
					lualine_x = {
						{
							"encoding",
							show_bomb = true,					-- Show '[BOM]' when the file has a byte-order mark
						},
					},
					lualine_y = {
						{
							"fileformat",
						},
						{
							"filetype",
							colored = true,						-- Displays filetype icon in color if set to true
							icon_only = false,					-- Display only an icon for filetype
							icon = {
								align = 'left'
							},									-- Display filetype icon on the left hand side
							-- icon =    {'X', align='right'}
							-- Icon string ^ in table is ignored in filetype component
						},
					},
					lualine_z = {
						{
							"%l:%c",							-- location
						},
						{
							"progress",
						},
						{
							total_num_lines,
							right_padding = 2,
							left_padding = 2,
						},
					},
				},
			}
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require("scrollbar").setup({
			})
		end
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
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
		"akinsho/bufferline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		keys = {
			-- pick a buffer to view from the buffer list
			{ "<leader>bs", "<cmd>BufferLinePick<CR>", desc = "select buffer" },
			-- pick a buffer to closes from the buffer list
			{
				"<leader>bc",
				"<cmd>BufferLinePickClose<CR>",
				desc = "close selected buffer",
			},
			{
				"<leader>bcl",
				"<cmd>BufferLineCloseLeft<CR>",
				desc = "close buffers to the left",
			},
			{
				"<leader>bcr",
				"<cmd>BufferLineCloseRight<CR>",
				desc = "close buffers to the right",
			},
			{
				"<leader>bcu",
				"<cmd>BufferLineGroupClose ungrouped<CR>",
				desc = "close ungrouped buffers",
			},
			{
				"<leader>bcp",
				"<cmd>BufferLineGroupClose pinned<CR>",
				desc = "close pinned buffers",
			},
			{
				"<leader>bp",
				"<Cmd>BufferLineTogglePin<CR>",
				desc = "Toggle pin",
			},
			{
				"<leader>bP",
				"<Cmd>BufferLineGroupToggle pinned<CR>",
				desc = "Toggle displaying pinned buffers",
			},
			{
				"<leader>bU",
				"<Cmd>BufferLineGroupToggle ungrouped<CR>",
				desc = "Toggle displaying ungrouped buffers",
			},
			{
				"<leader>bgt1",
				"<Cmd>BufferLineGoToBuffer 1<CR>",
				desc = "",
			},
			{
				"<leader>bgt2",
				"<Cmd>BufferLineGoToBuffer 2<CR>",
				desc = "",
			},
			{
				"<leader>bgt3",
				"<Cmd>BufferLineGoToBuffer 3<CR>",
				desc = "",
			},
			{
				"<leader>bgt4",
				"<Cmd>BufferLineGoToBuffer 4<CR>",
				desc = "",
			},
			{
				"<leader>bgt5",
				"<Cmd>BufferLineGoToBuffer 5<CR>",
				desc = "",
			},
			{
				"<leader>bgt6",
				"<Cmd>BufferLineGoToBuffer 6<CR>",
				desc = "",
			},
			{
				"<leader>bgt7",
				"<Cmd>BufferLineGoToBuffer 7<CR>",
				desc = "",
			},
			{
				"<leader>bgt8",
				"<Cmd>BufferLineGoToBuffer 8<CR>",
				desc = "",
			},
			{
				"<leader>bgt9",
				"<Cmd>BufferLineGoToBuffer 9<CR>",
				desc = "",
			},
		},
		opts = {
			options = {
				numbers = function(opts)
					return string.format("%s", opts.ordinal)
				end,
				max_name_length = 30,
				max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
				tab_size = 30,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left", --[[| "center" | "right",]]
					},
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				show_buffer_icons = true,				--| false, -- disable filetype icons for buffers
				show_buffer_close_icons = true,			--| false,
				show_close_icon = true,					--| false,
				show_tab_indicators = true,				--| false,
				persist_buffer_sort = true,				-- whether or not custom sorted buffers should persist
				-- can also be a table containing 2 custom separators
				-- [focused and unfocused]. eg: { '|', '|' }
				separator_style = "thick",				--| "thick" | "thin" | { 'any', 'any' },
				enforce_regular_tabs = false,			--| true,
				always_show_bufferline = true,			--| false,
				diagnostics = "nvim_lsp",
				--- count is an integer representing total count of errors
				--- level is a string "error" | "warning"
				--- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
				--- this should return a string
				--- Don't get too fancy as this function will be executed a lot
				diagnostics_indicator = function(
					count,
					level,
					diagnostics_dict,
					context
					)
					_ = context
					_ = diagnostics_dict
					local icon = level:match("error") and " "
					or (level:match("warning") and " " or "")
					return " " .. icon .. count
				end,
				groups = {
					options = {
						toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
					},
					items = {
						{
							name = "Tests", -- Mandatory
							highlight = { underline = true, sp = "blue" }, -- Optional
							priority = 2, -- determines where it will appear relative to other groups (Optional)
							icon = "", -- Optional
							matcher = function(buf) -- Mandatory
								return buf.name:match("%_test")
									or buf.name:match("%_spec")
							end,
						},
						{
							name = "Docs",
							highlight = { undercurl = true, sp = "green" },
							auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
							matcher = function(buf)
								return buf.name:match("%.md")
									or buf.name:match("%.txt")
							end,
							separator = { -- Optional
								-- style = require('bufferline.groups').separator.tab
							},
						},
					},
				},
			},
		},
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
}
