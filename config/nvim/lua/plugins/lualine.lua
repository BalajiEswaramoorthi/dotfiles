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
				theme = "milspec", -- "auto", "catppuccin",
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
}
