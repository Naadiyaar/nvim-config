local options = {
    -- has bug, report it
    -- clipboard = 'unnamedplus', -- Sync clipboard between OS and Neovim.

    backup = false, -- creates a backup file
	cmdheight = 1, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 2, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	incsearch = true,
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeout = true,
	timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 250, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 4, -- the number of spaces inserted for each indentation
	tabstop = 4, -- insert 2 spaces for a tab
	softtabstop = 4,
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = true, -- display lines as one long line
	linebreak = true, -- companion to wrap, don't split words
	sidescrolloff = 8, -- minimal number of screen columns either side of cursor if wrap is `false`
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
	wrapscan = false, -- no loop while search
	spelllang = "en_us", -- language for neovim spell checker
	spell = true, -- Built-in spell checker
    inccommand = 'split', -- Preview substitution live, as you type
    scrolloff = 10,
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Autocommand which hides numbers in terminal buffers
vim.cmd[[autocmd TermOpen * setlocal nonumber norelativenumber]]
