return {
	"williamboman/mason-lspconfig.nvim",
	-- lazy = false,
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = require("lsp.servers"),
		automatic_installation = true,
	},
	config = function(_, opts)
		local masonlsp = require("mason-lspconfig")
		masonlsp.setup(opts)
	end
}
