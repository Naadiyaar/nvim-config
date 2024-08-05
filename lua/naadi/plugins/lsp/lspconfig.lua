return {

    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
        {'hrsh7th/cmp-nvim-lsp'},
        {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
        -- This is where all the LSP shenanigans will live
        local lsp_zero = require('lsp-zero')
        lsp_zero.extend_lspconfig()

        --- if you want to know more about lsp-zero and mason.nvim
        --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
        -- lsp_zero.on_attach(function(client, bufnr)
        --     -- see :help lsp-zero-keybindings
        --     -- to learn the available actions
        --     lsp_zero.default_keymaps({buffer = bufnr})
        -- end)

        -- Custom keybindings


        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                -- NOTE: Remember that Lua is a real programming language, and as such it is possible
                -- to define small helper and utility functions so you don't have to repeat yourself.
                --
                -- In this case, we create a function that lets us more easily define mappings specific
                -- for LSP related items. It sets the mode, buffer and description for us each time.
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                -- Show diagnostics in a floating window
                map('<leader>lo', vim.diagnostic.open_float, 'Open Diagnostics')

                -- Jump to the definition of the word under your cursor.
                --  This is where a variable was first declared, or where a function is defined, etc.
                --  To jump back, press <C-t>.
                map('<leader>ld', require('telescope.builtin').lsp_definitions, 'Goto Definition')

                -- Find references for the word under your cursor.
                map('<leader>lr', require('telescope.builtin').lsp_references, 'Goto References')

                -- Jump to the implementation of the word under your cursor.
                --  Useful when your language has ways of declaring types without an actual implementation.
                map('<leader>li', require('telescope.builtin').lsp_implementations, 'Goto Implementation')

                -- Jump to the type of the word under your cursor.
                --  Useful when you're not sure what type a variable is and you want to see
                --  the definition of its *type*, not where it was *defined*.
                map('<leader>lD', require('telescope.builtin').lsp_type_definitions, 'Type Definition')

                -- Fuzzy find all the symbols in your current document.
                --  Symbols are things like variables, functions, types, etc.
                map('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')

                -- Fuzzy find all the symbols in your current workspace.
                --  Similar to document symbols, except searches over your entire project.
                map('<leader>ls', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

                -- Rename the variable under your cursor.
                --  Most Language Servers support renaming across files, etc.
                map('<leader>lr', vim.lsp.buf.rename, 'Rename')

                -- Execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your LSP for this to activate.
                map('<leader>la', vim.lsp.buf.code_action, 'Code Action')

                -- Opens a popup that displays documentation about the word under your cursor
                --  See `:help K` for why this keymap.
                map('<leader>lk', vim.lsp.buf.hover, 'Hover Documentation')

                -- WARN: This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header.
                map('<leader>lD', vim.lsp.buf.declaration, 'Goto Declaration')

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
            end,
        })

        require('mason-lspconfig').setup({
            ensure_installed = {"jdtls", "lua_ls"},
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    -- (Optional) Configure lua language server for neovim
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
                jdtls = lsp_zero.noop,
            }})
    end}
