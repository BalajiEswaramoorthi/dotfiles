
-- Disable syntax highlighting for big files
vim.api.nvim_create_autocmd("BufReadPre", {
  	callback = function(args)
    	local stats = vim.loop.fs_stat(args.file)
		if stats and stats.size > 1024 * 1000 then  -- 1000KB threshold
    		print(string.format("Large file (%.1f KB), syntax off", stats.size / 1024))
      		vim.cmd("syntax off")
      		vim.opt_local.foldmethod = "manual"
    	end
  	end,
})

