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
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false						-- Don't use swapfile
vim.opt.smoothscroll = true

vim.opt.syntax = 'off'
vim.opt.splitright = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.scrolloff = 5
vim.opt.fileencoding = "utf-8"

vim.opt.wildmenu = true
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true}

vim.api.nvim_set_option('updatetime', 300)

vim.opt.mouse = "ncr"

vim.opt.background = "dark"
vim.cmd("colorscheme lunaperche")

vim.loader.enable()								-- Speed up loading Lua modules in Neovim to improve startup time.
