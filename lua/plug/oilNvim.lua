return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- vim.g.mapleader = " "
    -- vim.g.maplocalleader = " "
    require("oil").setup({
      default_file_explorer = true,
      buf_options = {
        buflisted = true,
      },
      view_options = {
        show_hidden = false,
      }
    })
  end
}
