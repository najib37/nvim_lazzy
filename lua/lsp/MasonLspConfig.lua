return {
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	opts = {
		-- servers = {
			--
			-- }
	},
	config = function(_, opts)
		local masonlsp = require("mason-lspconfig")
		masonlsp.setup(opts)
	end
}
