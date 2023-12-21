return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	lazy = false,
	dependencies = {
		{'nvim-lua/plenary.nvim'},
	},
	keys = {
		{
			"<leader>fg",
			function()
				require('telescope.builtin').live_grep()
			end
		},
		{
			"<leader>s",
			function()
				require('telescope.builtin').find_files()
			end
		},
		{
			"<leader>fm",
			function()
				require('telescope.builtin').man_pages()
			end
		},
	},
	config = function()
		require("telescope").setup{}
	end
}
