return {

  "joseConseco/windows.nvim",
  -- "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  config = function()
    vim.o.winwidth = 20
    -- vim.o.winminwidth = 10
    vim.o.equalalways = false

    require("windows").setup({
    })
    -- vim.keymap.set("n", "<M-8>", "<Cmd>WindowsToggeleAutoboth<CR>")
    vim.keymap.set("n", "<M-9>", "<Cmd>WindowsDisableAutoboth<CR><Cmd>WindowsMaximize<CR>")
  end,
}
