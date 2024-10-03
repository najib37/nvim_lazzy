return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			buf_options = {
				buflisted = false,
			},
			view_options = {
				show_hidden = false,
			},
			vim.keymap.set("n", "<leader>o", ":Oil<CR>", {
				noremap = true,
				silent = true,
			}),
		})
	end,
}
