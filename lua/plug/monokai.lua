return {
	"tanvirtin/monokai.nvim",
	config = function()
		require("monokai").setup({
			palette = require("monokai").pro,
			italics = false,
		})
	end,
}
