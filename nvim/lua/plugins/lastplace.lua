return {
	{
		"farmergreg/vim-lastplace",
		event = {
			"BufWinEnter",
			"BufEnter",
		},
		config = function()
			vim.g.lastplace_ignore = "gitcommit,gitrebase,hgcommit,svn,xxd"
			vim.g.lastplace_ignore_buftype = "help,nofile,quickfix"
		end
	},
}
