return {
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			auto_install = true,
			sync_install = false,
			highlight = { enable = true },
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
			}
		})
	end

}
