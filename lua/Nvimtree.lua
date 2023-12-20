return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
	  "nvim-tree/nvim-web-devicons",
  },
  keys = {
	  {
		  "<leader>e",
		  function()
			  vim.cmd":NvimTreeToggle"
		  end
	  },
  },
  config = function()
	  require("nvim-tree").setup {
		  sort = {
			  sorter = "modification_time",
		  },
		  view = {
			  width = 20,
			  side = 'left',
		  },
		  renderer = {
			  group_empty = true,
		  },
		  filters = {
			  dotfiles = true,
		  },
		  renderer = {
			  root_folder_modifier = ":t",
			  icons = {
				  glyphs = {
					  default = "",
					  symlink = "",
					  folder = {
						  arrow_open = "",
						  arrow_closed = "",
						  default = "",
						  open = "",
						  empty = "",
						  empty_open = "",
						  symlink = "",
						  symlink_open = "",
					  },
					  git = {
						  unstaged = "",
						  staged = "S",
						  unmerged = "",
						  renamed = "➜",
						  untracked = "U",
						  deleted = "",
						  ignored = "◌",
					  },
				  },
			  },
		  },
		  diagnostics = {
			  enable = true,
			  show_on_dirs = true,
			  icons = {
				  hint = "",
				  info = "",
				  warning = "",
				  error = "",
			  },
		  },

	  }
  end
}
