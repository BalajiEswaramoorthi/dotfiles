return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/vim-vsnip",
		},
		config = function()
			require("cmp").setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					['<C-p>'] = require'cmp'.mapping.select_prev_item(),
					['<C-n>'] = require'cmp'.mapping.select_next_item(),
					-- Add tab support
					['<S-Tab>'] = require'cmp'.mapping.select_prev_item(),
					['<Tab>'] = require'cmp'.mapping.select_next_item(),
					['<C-S-f>'] = require'cmp'.mapping.scroll_docs(-4),
					['<C-f>'] = require'cmp'.mapping.scroll_docs(4),
					['<C-Space>'] = require'cmp'.mapping.complete(),
					['<C-e>'] = require'cmp'.mapping.close(),
					['<CR>'] = require'cmp'.mapping.confirm({
						behavior = require'cmp'.ConfirmBehavior.Insert,
						select = true,
					}) 
				},
				sources = {
					{ name = 'path' },                              -- file paths
					{ name = 'nvim_lsp', keyword_length = 3 },      -- from language server
					{ name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
					{ name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
					{ name = 'buffer', keyword_length = 2 },        -- source current buffer
					{ name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
				{ name = 'calc'},                               -- source for math calculation
				},
				window = {
					completion = require'cmp'.config.window.bordered(),
					documentation = require'cmp'.config.window.bordered(),
				},
				formatting = {
					fields = {'menu', 'abbr', 'kind'},
					format = function(entry, item)
						local menu_icon ={
							nvim_lsp = 'λ',
							vsnip = '⋗',
							buffer = 'Ω',
							path = '🖫',
						}
						item.menu = menu_icon[entry.source.name]
						return item
					end,
				},
			})
		end,
	},

}
