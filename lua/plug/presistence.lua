return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	opts = {
		vim.keymap.set("n", "<leader>s", function()
			require("persistence").select()
		end),
		-- add any custom options here
	},
}
