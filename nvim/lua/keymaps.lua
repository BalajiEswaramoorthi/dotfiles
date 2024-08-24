vim.g.mapleader = " " -- leader key

function toggleMouse()
	if vim.o.mouse == "a" then
		vim.o.mouse = ""
		print "toggleMouse: Mouse Disabled"
	else
		vim.o.mouse = "a"
		print "toggleMouse: Mouse Enabled"
	end
end
vim.keymap.set("n", "<leader>m", ":lua toggleMouse()<CR>", { noremap = true, silent = true, desc = "Toggle mouse (Enable/Disable)" })

vim.keymap.set("n", "<leader>sc", ":close<CR>", { noremap = true, silent = true, desc = "close the current window" })
