return {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {"mfussenegger/nvim-jdtls"},
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
        -- Disable automatic setup, we are doing it manually
        vim.g.lsp_zero_extend_cmp = 0
        vim.g.lsp_zero_extend_lspconfig = 0
    end,
}
