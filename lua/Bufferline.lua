return {
	'akinsho/bufferline.nvim', 
	version = "*", 
	lazy = false,
	opts = {
		mode = "buffers",
		middle_mouse_command = "bdelete! %d",
		buffer_close_icon = '󰅖',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 10,
		max_prefix_length = 10, -- prefix used when a buffer is de-duplicated
		truncate_names = true, -- whether or not tab names should be truncated
	},
	config = function(_, opts)
		require("bufferline").setup{ options = opts }
	end,
}
