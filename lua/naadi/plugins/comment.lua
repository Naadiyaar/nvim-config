return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- import comment plugin safely
		local comment = require("Comment")
		-- enable comment
		comment.setup({
			---Add a space b/w comment and the line
			padding = true,
		})
	end,
}
