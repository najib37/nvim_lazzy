return {
  'akinsho/bufferline.nvim',
  version = "*",
  lazy = false,
  opts = {
    vim.keymap.set("n", "<leader>x", ":bdelete<CR>"),
    mode = "buffers",
    middle_mouse_command = "bdelete! %d",
    buffer_close_icon = '󰅖',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 10,
    max_prefix_length = 10,
    truncate_names = true,

  },
  config = function(_, opts)
    require("bufferline").setup {
      options = opts,
    }

    -- local groups = require('bufferline.groups')
    -- groups = {
    --   items = {
    --     {
    --       name = "front",
    --    },
    --     groups.builtin.ungrouped,
    --     {
    --       name = "back",
    --     },
    --   }
    -- }
  end,
}
