return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		vim.keymap.set("n", "<leader>x", ":bdelete<CR>"),
		mode = {"buffers"},
		middle_mouse_command = "bdelete! %d",
		buffer_close_icon = "󰅖",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		-- truncate_names = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Explorer",
				highlight = "Directory",
				text_align = "left",
				separator = true,
			},
			{
				filetype = "aerial",
				text = "Aerial Files Symbols ",
				highlight = "Directory",
				text_align = "left",
				separator = true,
			},
		},
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
	config = function(_, opts)
		require("bufferline").setup({
			options = opts,
		})

	-- 	local groups = require("bufferline.groups")
	-- 	groups = {
	-- 		items = {
	-- 			{ name = "front" },
	-- 			groups.builtin.ungrouped,
	-- 			{ name = "back" },
	-- 		},
	-- 	}
	end,
}
