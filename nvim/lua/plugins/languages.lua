return {
	-----	C	-----
	{
		"p00f/clangd_extensions.nvim",
		lazy = true,
		config = function() end,
		opts = {
			inlay_hints = {
				inline = false,
			},
			ast = {
				--These require codicons (https://github.com/microsoft/vscode-codicons)
				role_icons = {
					type = "",
					declaration = "",
					expression = "",
					specifier = "",
					statement = "",
					["template argument"] = "",
				},
				kind_icons = {
					Compound = "",
					Recovery = "",
					TranslationUnit = "",
					PackExpansion = "",
					TemplateTypeParm = "",
					TemplateTemplateParm = "",
					TemplateParamObject = "",
				},
			},
		},
	},
	{
		"bfrg/vim-c-cpp-modern",
		ft = {
			"c",
			"cpp",
		},
	},
	{
		"dhananjaylatkar/cscope_maps.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim", -- optional [for picker="telescope"]
		},
		ft = {
			"c",
			"cpp",
		},
		opts = {
			-- maps related defaults
			disable_maps = false, -- "true" disables default keymaps
			skip_input_prompt = true, -- "true" doesn't ask for input
			prefix = "<leader>c", -- prefix to trigger maps
			-- cscope related defaults
			cscope = {
				-- location of cscope db file
				db_file = "./cscope.out", -- DB or table of DBs
				-- NOTE:
				--   when table of DBs is provided -
				--   first DB is "primary" and others are "secondary"
				--   primary DB is used for build and project_rooter
				-- cscope executable
				exec = "cscope", -- "cscope" or "gtags-cscope"
				-- choose your fav picker
				picker = "telescope", -- "quickfix", "telescope", "fzf-lua", "mini-pick" or "snacks"
				-- size of quickfix window
				qf_window_size = 5, -- any positive integer
				-- position of quickfix window
				qf_window_pos = "bottom", -- "bottom", "right", "left" or "top"
				-- "true" does not open picker for single result, just JUMP
				skip_picker_for_single_result = true, -- "false" or "true"
				-- custom script can be used for db build
				db_build_cmd = { script = "default", args = { "-bqkv" } },
				-- statusline indicator, default is cscope executable
				statusline_indicator = nil,
				-- try to locate db_file in parent dir(s)
				project_rooter = {
					enable = false, -- "true" or "false"
					-- change cwd to where db_file is located
					change_cwd = false, -- "true" or "false"
				},
			},
			-- stack view defaults
			stack_view = {
				tree_hl = true, -- toggle tree highlighting
			}
		}
	},

	-----	Rust	-----
	{
		"mrcjkb/rustaceanvim",
		ft = { "rust" },
	},
}
