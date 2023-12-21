return {
	"ThePrimeagen/harpoon",
	lazzy = VeryLazy,
	keys = {
		{
			"<leader>j",
			function()
				require("harpoon.ui").nav_prev()
			end
		},
		{
			"<leader>h",
			function()
				require("harpoon.ui").nav_next()
			end
		},

		{
			"<leader>t",
			function()
				require("harpoon.mark").add_file()
			end
		},
		{
			"<C-T>",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end
		},

	},
	config = function() require("harpoon").setup({}) ; end,
}

