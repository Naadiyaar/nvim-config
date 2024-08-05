return {
	"nvim-telescope/telescope.nvim",
    event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		local keymap = vim.keymap.set
		keymap("n", "<leader>sf", builtin.find_files, { desc = "Search filse"})
		keymap("n", "<leader>sg", builtin.live_grep, { desc = "Search by grep"})
        keymap('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = 'Search in open files' })
	end,
}
