return {
	{
		"altermo/ultimate-autopair.nvim",
		event = {
			"InsertEnter",
			"CmdlineEnter",
		},
		branch='v0.6', --recommended as each new version will have breaking changes
		opts={
			--Config goes here
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = {
			"BufReadPost",
			"BufNewFile"
		},
		-- lazy = false,
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		version = "*",
		enabled = true,
		config = function()
			vim.opt.runtimepath:append("$HOME/.local/share/treesitter")
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all" (the listed parsers MUST always be installed)
				ensure_installed = {
					"c",
					"cpp",
					"bash",
					"python",
					"rust",
					"diff",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"vimdoc",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = false,

				-- List of parsers to ignore installing (or "all")
				ignore_install = {
					"javascript",
				},

				parser_install_dir = "$HOME/.local/share/treesitter",

				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

				highlight = {
					enable = true,

					-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
					-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
					-- the name of the parser)
					-- list of language that will be disabled
					-- disable = { "rust" },
					-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
					disable = function(lang, buf)
						local max_filesize = 1000 * 1024 -- 1000 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

						if ok and stats and stats.size > max_filesize then
							return true
						end
						return false
					end,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			require('ufo').setup({
				provider_selector = function(bufnr, filetype, buftype)
					return ''
				end
			})
		end
	},
}
