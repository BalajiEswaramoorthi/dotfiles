return {
	"willothy/nvim-cokeline",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	priority = 998,
	event = "VeryLazy",
	config = function()
		local get_hex = require('cokeline.hlgroups').get_hl_attr
		local is_picking_focus = require('cokeline.mappings').is_picking_focus
		local is_picking_close = require('cokeline.mappings').is_picking_close

		local prev_buffer = function(buffer)
			if buffer.index == 1 then
				return nil
			end
			return require('cokeline.buffers').get_visible()[buffer.index - 1]
		end

		require('cokeline').setup {
			show_if_buffers_are_at_least = 1,

			buffers = {
				-- A function to filter out unwanted buffers. Takes a buffer table as a
				-- parameter (see the following section for more infos) and has to return
				-- either `true` or `false`.
				-- default: `false`.
				---@type false | fun(buf: Buffer):boolean
				filter_valid = false,

				-- A looser version of `filter_valid`, use this function if you still
				-- want the `cokeline-{switch,focus}-{prev,next}` mappings to work for
				-- these buffers without displaying them in your bufferline.
				-- default: `false`.
				---@type false | fun(buf: Buffer):boolean
				filter_visible = false,

				-- Which buffer to focus when a buffer is deleted, `prev` focuses the
				-- buffer to the left of the deleted one while `next` focuses the one the
				-- right.
				-- default: 'next'.
				focus_on_delete = 'next',

				-- If set to `last` new buffers are added to the end of the bufferline,
				-- if `next` they are added next to the current buffer.
				-- if set to `directory` buffers are sorted by their full path.
				-- if set to `number` buffers are sorted by bufnr, as in default Neovim
				-- default: 'last'.
				---@type 'last' | 'next' | 'directory' | 'number' | fun(a: Buffer, b: Buffer):boolean
				new_buffers_position = 'last',

				-- If true, right clicking a buffer will close it
				-- The close button will still work normally
				-- Default: true
				---@type boolean
				delete_on_right_click = false,
			},

			mappings = {
				-- Controls what happens when the first (last) buffer is focused and you
				-- try to focus/switch the previous (next) buffer. If `true` the last
				-- (first) buffers gets focused/switched, if `false` nothing happens.
				-- default: `true`.
				---@type boolean
				cycle_prev_next = true,

				-- Disables mouse mappings
				-- default: `false`.
				---@type boolean
				disable_mouse = false,
			},

			-- Maintains a history of focused buffers using a ringbuffer
			history = {
				---@type boolean
				enabled = true,
				---The number of buffers to save in the history
				---@type integer
				size = 5,
			},

			default_hl = {
				fg = function(buffer)
					return buffer.is_focused
					and get_hex('TabLineSel', 'fg')
					or get_hex('TabLine', 'fg')
				end,
				bg = function(buffer)
					return buffer.is_focused
					and get_hex('TabLineSel', 'bg')
					or get_hex('TabLine', 'bg')
				end
			},
			fill_hl = 'TabLineFill',
			components = {
				{
					text = function(buffer)
						if buffer.is_focused then
							return ''
						elseif buffer.index > 1
							and prev_buffer(buffer).is_focused then
							return ''
						end
						return ''
					end,
					fg = function(buffer)
						if buffer.is_focused or buffer.index > 1
							and prev_buffer(buffer).is_focused then
							return get_hex('TabLine', 'bg')
						end
						return get_hex('TabLineSel', 'fg')
					end,
					bg = function(buffer)
						if buffer.is_focused or buffer.index > 1
							and prev_buffer(buffer).is_focused then
							return get_hex('TabLineSel', 'bg')
						end
						return get_hex('TabLine', 'bg')
					end
				},
				{
					text = ' ',
				},
				{
					text = function(buffer)
						return ((is_picking_focus() or is_picking_close())
						and buffer.pick_letter
						or buffer.index) .. ':  '
					end,
					fg = function(buffer)
						return (is_picking_focus() or is_picking_close())
						and get_hex('ErrorMsg', 'fg')
						or (buffer.is_focused
						and get_hex('TabLineSel', 'fg')
						or get_hex('TabLine', 'fg'))
					end
				},
				{
					text = function(buffer) return buffer.devicon.icon end,
					fg = function(buffer) return buffer.devicon.color end,
				},
				{
					text = function(buffer)
						return buffer.unique_prefix .. buffer.filename
					end,
					bold = function(buffer) return buffer.is_focused end,
					italic = function(buffer) return buffer.is_modified end,
				},
				{
					text = function(buffer)
						return buffer.is_modified and '*' or ''
					end,
					italic = true
				},
				{
					text = ' ',
				},
				{
					text = '  ',
					on_click = function(_, _, _, _, buffer)
						buffer:delete()
					end,
				},
				{
					text = function(buffer)
						return (buffer.is_last and buffer.is_focused)
						and ''
						or ''
					end,
					fg = get_hex('TabLineSel', 'bg'),
					bg = get_hex('TabLine', 'bg')
				}
			},
			sidebar = {
				filetype = { "NvimTree", "CHADTree" },
				components = {
					{
						text = function()
							return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
						end,
						bg = get_hex('TabLine', 'bg'),
						fg = get_hex('TabLine', 'fg')
					},
				},
			},
		}
	end
}
