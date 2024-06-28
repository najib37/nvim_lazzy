function newTerm(mycmd, type)
	local Terminal  = require('toggleterm.terminal').Terminal
	return Terminal:new(
	{ 
		cmd = mycmd, 
		dir = "git_dir",
		direction = type,
		float_opts = {
			border = "double",
		},
		hidden = true,
	})
end

return {
	'akinsho/toggleterm.nvim',
	version = "*", 
	keys = {
		{
			"<leader>tt",
			function()
				newTerm(nil, "float"):toggle()
			end,
			desc = "float terminal"
		},
		{
			"<leader>th",
			function()
				newTerm(nil, "horizontal"):toggle()
			end,
			desc = "horizontal terminal"
		},
	},
	config = function() 
		require("toggleterm").setup{};
	end

}
