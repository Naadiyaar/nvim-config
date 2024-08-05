-- Options
local netrw = {
	netrw_liststyle = 0,
	netrw_keepdir = 0,
	netrw_winsize = 50,
	netrw_banner = 0,
	netrw_localcopydircmd = "cp -r",
}

for k, v in pairs(netrw) do
	vim.g[k] = v
end

-- Keymaps
local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "<leader>nv", "<CMD>Vexplore!<CR>", { desc = "open Netrw vertically at right" }, opts)
keymap("n", "<leader>nh", "<CMD>Hexplore<CR>", { desc = "open Netrw horizontaly at bottom" }, opts)
keymap("n", "<leader>nb", "<CMD>Explore<CR>", { desc = "open Netrw in new buffer" }, opts)
keymap(
	"n",
	"<leader>nm",
	[[<CMD>echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>]],
	{ desc = "show a list of marked files" },
	opts
)
keymap(
	"n",
	"<leader>nt",
	[[<CMD>echo 'Target:' . netrw#Expose("netrwmftgt")<CR>]],
	{ desc = "show the target directory" },
    opts
)
