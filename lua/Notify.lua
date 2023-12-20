return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	opts = {
		timeout = 100,
		-- to add some other things
	},
	config = function(_, opts)
		require("notify").setup{opts}
	end
}
