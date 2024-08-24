return {
	"nvim-lualine/lualine.nvim",
	event = {
		"BufReadPost",
		"BufNewFile",
	},
	opts = function()
		local function total_num_lines()
			return vim.api.nvim_buf_line_count(0)
		end

		return {
			options = {
				theme = "auto", -- "auto", "catppuccin",
			},
			extensions = {
				 ["nvim-tree"] = {
					 filetypes = { "NvimTree" },
					 sections = {
						 lualine_a = {},
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
						path = 0,							-- 0: Just the filename
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
					{
						total_num_lines,
						right_padding = 2,
						left_padding = 2,
					},
				},
			},
		}
	end,
}
