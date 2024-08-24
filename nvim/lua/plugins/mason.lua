return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = 'Mason',
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "",
						package_pending = "",
						package_uninstalled = "",
					},
				}
			})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = {
			"BufReadPre",
			"BufNewFile"
		},
		dependencies = {
			'williamboman/mason.nvim'
		},
	},
}
