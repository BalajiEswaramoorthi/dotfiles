return {
	{
		"nvim-lualine/lualine.nvim",
		event = {
			"BufReadPost",
			"BufNewFile",
		},
		opts = {
			options = {
				theme = "nightfox", -- "auto", "catppuccin"
			},
			extensions = {
				["FileType-Mode"] = {
					filetypes	= {
						"copilot-chat",
					},
					sections	= {
						lualine_a = {
							{
								"mode",
							}
						},
						lualine_b = {
							{
								"filename",
							}
						},
						lualine_c = {},
						lualine_x = {},
						lualine_y = {},
						lualine_z = {},
					},
				},
				["FileType"] = {
					filetypes = {
						"NvimTree",
						"neo-tree",
					},
					sections = {
						lualine_a = {
							{
								"filename",
							}
						},
						lualine_b = {},
						lualine_c = {},
						lualine_x = {},
						lualine_y = {},
						lualine_z = {},
					},
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = fmt_mode,
						icon = { "" },
					},
				},
				lualine_b = {
					{
						"branch",
						icon = { " ", },
						separator = "",
						padding = 1,
					},
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
						padding = 1,
					},
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
						"location",
						icon = { "", align = "left" },
					},
					{
						"progress",
						icon = { "", align = "left" },
					},
				},
			},
		}
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			vim.notify = require("notify")
		end
	},
	{
		'gelguy/wilder.nvim',
	},
	{
		'Bekaboo/dropbar.nvim',
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		},
	},
	{
		"dstein64/nvim-scrollview",
		event = {
			"BufWinEnter",
			"BufEnter",
		},
		opts = {
			excluded_filetypes = {
				"NvimTree",
			},
		}
	},
	{
		"willothy/nvim-cokeline",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons"
		},
		opts = {
			show_if_buffers_are_at_least = 1,
			default_hl = {
				fg = function(buffer)
					return buffer.is_focused and vim.api.nvim_get_hl(0, { name = 'Normal' }).fg or vim.api.nvim_get_hl(0, { name = 'Comment' }).fg
				end,
				bg = vim.api.nvim_get_hl(0, { name = 'ColorColumn' }).bg
			},
			components = {
				{
					text = ' ',
					fg = vim.api.nvim_get_hl(0, { name = 'ColorColumn' }).bg,
					bg = vim.api.nvim_get_hl(0, { name = 'Normal' }).bg,
				},
				{
					text = '',
					fg = vim.api.nvim_get_hl(0, { name = 'ColorColumn' }).bg,
					bg = vim.api.nvim_get_hl(0, { name = 'Normal' }).bg,
				},
				{
					text = function(buffer) return buffer.devicon.icon end,
					fg = function(buffer) return buffer.devicon.color end,
				},
				{
					text = function(buffer) return buffer.filename end,
					bold = function(buffer)	return buffer.is_focused end
				},
				-- LSP diagnostics indicator
				{
					text = function(buffer)
						local errors = vim.diagnostic.get(buffer.number, { severity = vim.diagnostic.severity.ERROR })
						local warnings = vim.diagnostic.get(buffer.number, { severity = vim.diagnostic.severity.WARN })
						if #errors > 0 then
							return '  '
						elseif #warnings > 0 then
							return'  '
						else
							return ''
						end
					end,
					fg = function(buffer)
						local errors = vim.diagnostic.get(buffer.number, { severity = vim.diagnostic.severity.ERROR })
						if #errors > 0 then return '#bf616a' end
						local warnings = vim.diagnostic.get(buffer.number, { severity = vim.diagnostic.severity.WARN })
						if #warnings > 0 then return '#ebcb8b' end
						return nil
					end,
				},
				{
					text = function(buffer) return buffer.is_modified and ' ●' or '' end,
				},
				-- Close button
				{
					text = ' 󰅚 ',
					delete_buffer_on_left_click = true,
				},
				{
					text = '',
					fg = vim.api.nvim_get_hl(0, { name = 'ColorColumn' }).bg,
					bg = vim.api.nvim_get_hl(0, { name = 'Normal' }).bg,
				},
			},
			sidebar = {
				filetype = {
					'NvimTree',
					'neo-tree',
				},
				components = {
					{
						text = ' File Explorer ',
						fg = '#7fbbb3',
						bg = '#1e1e2e',
						style = 'bold',
					},
				},
			},
		}
	},
}
