--vim.opt.expandtab = true

vim.opt.number = false							-- Don't display the line number in front of each line.
vim.opt.relativenumber = false					-- Don't display the line number relative to the line with the cursor in front of each line.
vim.opt.cursorline = false						-- Don't highlight the screen line of the cursor with CursorLine.

vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
--vim.opt.incsearch = true

vim.opt.swapfile = false						-- Don't use swapfile
vim.opt.syntax = 'off'
vim.opt.splitright = true
--vim.opt.wrap = false
--vim.opt.breakindent = true
--vim.opt.scrolloff = 5
vim.opt.smoothscroll = true
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"								-- enable mouse in all modes
vim.opt.signcolumn = "yes"						-- This will avoid an annoying layout shift in the screen

vim.loader.enable()								-- Speed up loading Lua modules in Neovim to improve startup time.
vim.opt.clipboard = "unnamedplus"

-- lsp configuation --
vim.diagnostic.config(
	{
		virtual_text = true,
		virtual_lines = true,
		signs = true,
		underline = true,
		update_in_insert = false,
	}
)
