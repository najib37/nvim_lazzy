return {
	'Wansmer/treesj',
	dependencies = { 'nvim-treesitter/nvim-treesitter' },
	keys = {
		{
			"<C-m>",
			function()
				require('treesj').toggle()
			end
		}
	},
	config = function()
		require('treesj').setup({
			use_default_keymaps = false,
		})
	end,
}
