local Plugins = { }

Plugins.plugins = {
	require("plugins.bufferline"),		-- show available buffers
	require("plugins.code-format"),
	require("plugins.colorschemes"),
	require("plugins.git"),
	require("plugins.lualine"),			-- status line plugin
	require("plugins.ui"),
	require("plugins.utils"),
	require("plugins.dropbar"),

	require("plugins.mason"),	-- manage language server
	require("plugins.cmp"),		-- completion plugins
	require("plugins.lsp"),
	require("plugins.c"),		-- c language server support
	require("plugins.rust"),	-- rust language server support

	require("plugins.tagbar")
}

return Plugins
