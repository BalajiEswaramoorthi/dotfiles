local Plugins = { }

Plugins.plugins = {
	require("plugins.automatum"),
	require("plugins.cokeline"),
	require("plugins.colorschemes"),
	require("plugins.copilot"),
	require("plugins.ui"),
	require("plugins.file-explorer"),
	require("plugins.git"),
	require("plugins.icons"),
	require("plugins.indent"),
	require("plugins.listchars"),
	require("plugins.noice"),
	require("plugins.outline"),
	require("plugins.peek"),
	require("plugins.rainbow-parentheses"),
	require("plugins.scrollbar"),
	require("plugins.telescope"),
	require("plugins.terminal"),
	--require("plugins.treesitter"),
	require("plugins.which-key"),

	require("plugins.mason"),	-- manage language server
	require("plugins.cmp"),		-- completion plugins
	require("plugins.lsp"),
	require("plugins.languages"),

	--require("plugins.tagbar")
}

return Plugins
