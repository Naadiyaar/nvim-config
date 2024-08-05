return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
                    "c",
                    "query",
					"yaml",
					"markdown",
					"markdown_inline",
					"bash",
					"lua",
					"python",
					"java",
                    "vimdoc",
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				-- auto install above language parsers
				auto_install = false,

                additional_vim_regex_highlighting = false,
			})
		end,
	},
}
