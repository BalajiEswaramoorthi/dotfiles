local Plugins = { }

Plugins.plugins = {
	require("plugins.autopair"),
	require("plugins.auto-save"),
	require("plugins.bufferline"),
	require("plugins.code-format"),
	require("plugins.colorschemes"),
	require("plugins.dropbar"),
	require("plugins.file-explorer"),
	require("plugins.git"),
	require("plugins.lastplace"),
	require("plugins.listchars"),
	require("plugins.lualine"),
	require("plugins.noice"),
	require("plugins.rainbow-parentheses"),
	require("plugins.scrollbar"),
	require("plugins.telescope"),
	require("plugins.terminal"),
	require("plugins.treesitter"),
	require("plugins.utils"),

	require("plugins.mason"),	-- manage language server
	require("plugins.cmp"),		-- completion plugins
	require("plugins.lsp"),
	require("plugins.c"),		-- c language server support
	require("plugins.rust"),	-- rust language server support

	require("plugins.tagbar")
}

return Plugins