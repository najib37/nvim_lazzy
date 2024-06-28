return {
  'javiorfo/nvim-ship',
  lazy = VeryLazy,
  ft = 'ship',
  cmd = { "ShipCreate", "ShipCreateEnv" },
  dependencies = { 'javiorfo/nvim-spinetta', 'javiorfo/nvim-popcorn' },
  config = function()
    vim.keymap.set("n", "<C-S>", ":silent Ship<CR>")
    require 'ship'.setup {
      request = {
        timeout = 30,
        -- autosave = true
      },
      response = {
        show_headers = 'all',
        window_type = 'h',
        size = 20,
        redraw = true
      },
      output = {
        save = false,
        override = true,
        folder = "/tmp/response/",
      },
      internal = {
        log_debug = false,
      }
    }

    -- Not necessary. Only if you want to change the setup calling require'ship'.setup{...}
  end
}
