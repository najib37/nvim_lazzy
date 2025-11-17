return {
  "MisanthropicBit/winmove.nvim",
  opts = {},
  config = function()
    local winmove = require('winmove')
    winmove.configure({})
    
    -- Optional: Add keymaps to start modes
    vim.keymap.set('n', '<M-m>', function() winmove.start_mode('move') end, { desc = 'Start winmove move mode' })
    vim.keymap.set('n', '<leader>ws', function() winmove.start_mode('swap') end, { desc = 'Start winmove swap mode' })
    vim.keymap.set('n', '<leader>wr', function() winmove.start_mode('resize') end, { desc = 'Start winmove resize mode' })
  end,
}

