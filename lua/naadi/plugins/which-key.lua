return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        require("which-key").setup({
            triggers = {
                { "<auto>", mode = "nixsotc" },
            },
            spec = {
                { "<leader>n", group = "Netrw" },
                { "<leader>b", group = "Buffers" },
                { "<leader>l", group = "LSP" },
                { "<leader>s", group = "Search" },
                { "<leader>o", group = "Obsidian" },
            },
            preset = "modern",
            delay = 500, -- in milliseconds
            win = {
                border = "single", -- none, single, double, shadow
            },
            show_help = false,
            icons = {
                mappings = false,
            }
        })
    end,
}
