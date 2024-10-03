return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	keys = {
		{
			"<m-r>",
			function()
				vim.api.nvim_set_keymap("n", "<m-r>", ":FlutterRestart<cr>", { noremap = true, silent = true })
			end,
		},
		{
			"<m-s>",
			function()
				vim.api.nvim_set_keymap("n", "<m-s>", ":FlutterRun<cr>", { noremap = true, silent = true })
			end,
		},
	},
	config = true,
}
