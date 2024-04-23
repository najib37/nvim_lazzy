return {
  "tiagovla/scope.nvim",
  config = function()

    vim.opt.sessionoptions = { -- required
      "buffers",
      "tabpages",
      "globals",
    }

    require("scope").setup({})
    require("telescope").load_extension("scope")
  end
}
