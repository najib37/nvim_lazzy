-- local function keymaps()
--
-- 	for a = 1, 9, 1 do
-- 		local key = "<leader>m" .. tostring(a)
--
-- 		vim.keymap.set('n', key, function(a)
-- 			require"harpoon.ui".nv_file(a)
-- 		end)
-- 	end
-- end

return {
	"ThePrimeagen/harpoon",
	-- lazy = "VeryLazy",
	keys = {
		{
			"<leader>j",
			function()
				require("harpoon.ui").nav_prev()
			end
		},
		{
			"<leader>h",
			function()
				require("harpoon.ui").nav_next()
			end
		},
		{
			"<leader>t",
			function()
				require("harpoon.mark").add_file()
			end
		},
		{
			"<C-T>",
			function()
				require("harpoon.ui").toggle_quick_menu()
			end
		},
	},
	config = function()
		require("harpoon").setup({
			-- keymaps()
		})
	end,
}
