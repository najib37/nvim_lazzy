return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	config = function()
		require("notify").setup({
			timeout = 200,
			stages = "fade_in_slide_out",
			minimum_width = 50,
			maxWidth = 50,
			-- to add some other things
		})
	end
}
