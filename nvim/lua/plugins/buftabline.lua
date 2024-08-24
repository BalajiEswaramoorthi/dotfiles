return {
	{
		"jose-elias-alvarez/buftabline.nvim",
		requires = {"kyazdani42/nvim-web-devicons"},
		config = function()
			require("buftabline").setup {}
		end
	},
}
