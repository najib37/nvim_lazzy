return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
    { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
  },
  config = function()
    require("CopilotChat").setup({
      model = "claude-sonnet-4.5",
      auto_follow_cursor = true,
      auto_insert_mode = true,
      show_help = true,

      mappings = {
        close = {
          normal = "q",
          insert = "<C-c>",
        },
        reset = {
          normal = "<C-7>",
          insert = "<C-7>",
        },
        accept_diff = {
          normal = "<C-y>",
          insert = "<C-y>",
        },
      },

      window = {
        layout = "float",
        relative = "cursor",
        width = 1,
        height = 0.8,
        row = 0.3,
      },
      sticky = {
        '#buffer',
      },
      prompts = {
        Explain = {
          prompt = "Explain this code in detail with examples.",
          system_prompt = "COPILOT_EXPLAIN"
        },
        Review = {
          prompt = "Review this code for bugs and improvements.",
          system_prompt = "COPILOT_REVIEW"
        },
        Refactor = {
          prompt = "Refactor this code to improve its structure and readability.",
        },
        FixBug = {
          prompt = "Analyze this code for bugs and provide fixes.",
        },
        OptimizePerf = {
          prompt = "Optimize this code for better performance.",
        },
      },
    })

    vim.api.nvim_set_keymap("n", "<C-Space>", [[::CopilotChatToggle<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>ce', ':CopilotChatExplain<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>cr', ':CopilotChatReview<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>cf', ':CopilotChatFixBug<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>co', ':CopilotChatOptimizePerf<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>ct', ':CopilotChatTests<CR>', { noremap = true, silent = true })
  end,
}
