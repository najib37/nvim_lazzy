return {
	"williamboman/mason.nvim",
	-- dependencies = {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	"neovim/nvim-lspconfig",
	-- },
	lazy = false,
	opts = {
		ui = {
			border = "none",
			icons = {
				package_installed = "◍",
				package_pending = "◍",
				package_uninstalled = "◍",
			},
		},
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
	},
	config = function(_, opts)
		require("mason").setup(opts);
	end
}
