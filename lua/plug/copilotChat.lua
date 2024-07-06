return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
  },
  config = function()
    require("CopilotChat").setup {}
    vim.api.nvim_set_keymap('n', '<M-c>', ':CopilotChatToggle<CR>',
      { noremap = true, silent = true })
  end
}
