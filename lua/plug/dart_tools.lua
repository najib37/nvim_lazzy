return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		vim.api.nvim_set_keymap("n", "<m-r>", ":FlutterRestart<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<m-s>", ":FlutterRun<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<m-f>", ":Telescope flutter commands<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<m-q>", ":FlutterLogClear<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<m-4>", ":FlutterOutlineToggle<CR>", { noremap = true, silent = true })
		require("flutter-tools").setup({
			outline = {
				open_cmd = "100rnew", -- the ! forces the split to open on the right
				auto_open = false, -- whether to auto open the outline

			},
			decorations = {
				statusline = {
					app_version = false,
					device = true,
					project_config = true,
				},
			},
			widget_guides = {
				enabled = true,
			},
		})
	end,
}
