local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " " -- leader key

function toggleMouse()
	if vim.o.mouse == "nicr" then
		vim.o.mouse = ""
		print "toggleMouse: Mouse enabled"
	else
		vim.o.mouse = "a"
		print "toggleMouse: Mouse disabled"
	end
end
vim.api.nvim_set_keymap("n", "<leader>m", ":lua toggleMouse()<CR>", { noremap = true, silent = true })		-- Toggle mouse (Enable/Disable)
