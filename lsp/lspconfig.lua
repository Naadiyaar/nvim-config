return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap.set -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Go to declaration"
			keymap("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Smart rename"
			keymap("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show line diagnostics"
			keymap("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		vim.diagnostic.config({
			virtual_text = false, -- disable inline diagnostics
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				python = {
					analysis = {
						typeCheckingMode = "off",
					},
				},
			},
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
