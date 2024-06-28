return {
  "nvim-neorg/neorg",
  version = "*",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.keymap.set("n", "<leader>n", ":silent Neorg journal<CR>")
    vim.keymap.set("n", "<leader>nt", ":silent Neorg journal tomorrow <CR>")
    vim.keymap.set("n", "<leader>nn", ":silent Neorg journal today <CR>")
    vim.keymap.set("n", "<leader>ns", ":silent Neorg workspace to_save <CR>")
    vim.keymap.set("n", "<leader>nw", ":silent Neorg workspace work<CR>")
    vim.keymap.set("n", "<leader>np", ":silent Neorg workspace projects<CR>")
    vim.keymap.set("n", "<leader>nm", ":silent Neorg workspace memo<CR>")
    require("neorg").setup {
      journal = {
        file_location = '~/Documents/neorg/journal/'
      },
      load = {
        ["core.defaults"] = {},  -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = {      -- Manages Neorg workspaces
          config = {
            workspaces = {
              work = "~/Documents/neorg/work",
              to_save = "~/Documents/neorg/to_save",
              notes = "~/Documents/neorg/notes",
              projects = "~/Documents/neorg/projects",
              memo = "~/Documents/neorg/memo",
            },
          },
        },
      },
    }
  end,
}
