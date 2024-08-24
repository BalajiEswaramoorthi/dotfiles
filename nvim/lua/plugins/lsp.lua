return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			--require'lspconfig'.clangd.setup{}
			require'lspconfig'.pyright.setup{}
			require'lspconfig'.rust_analyzer.setup {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
					},
				},
			}
		end
	},
}
