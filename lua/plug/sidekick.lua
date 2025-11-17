return {

  "folke/sidekick.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua", -- Ensure copilot is loaded first
    "github/copilot.vim",
  },
  event = false,
  opts = {
    cli = {
      -- mux = {
      --   backend = "zellij",
      --   enabled = true,
      -- },
      win = {
        layout = "right",
        split = {
          width = 80,
          height = 20,
        },
      },
      tools = {
        copilot = {
          cmd = { "copilot", "--banner" },
          url = "https://github.com/github/copilot-cli"
        },
      },
    },
    copilot = {
      status = {
        enabled = true,
      },
    },
    nes = {
      enabled = true,
      debounce = 100,
      trigger = {
        events = { "InsertLeave", "TextChanged", "User SidekickNesDone" },
      },
      clear = {
        events = { "TextChangedI", "TextChanged", "BufWritePre", "InsertEnter" },
        esc = true,
      },
      diff = {
        inline = "words",
      },
    },
  },
  config = function(_, opts)
    require("sidekick").setup(opts)

    -- Enable native inline completion for better integration
    if vim.fn.has("nvim-0.12") == 1 then
      vim.lsp.inline_completion.enable()
    end
  end,
  keys = {
    {
      "<tab>",
      function()
        -- Priority: sidekick next edit suggestions
        if require("sidekick").nes_jump_or_apply() then
          return
        end

        -- Fallback to native inline completions
        if vim.lsp.inline_completion.get() then
          return
        end

        -- Final fallback to normal tab
        return "<tab>"
      end,
      mode = { "i", "n" },
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<leader>aa",
      function()
        require("sidekick.cli").toggle({ name = "copilot", focus = true })
      end,
      mode = { "n", "v" },
      desc = "Sidekick Toggle Copilot CLI",
    },
    {
      "<leader>as",
      function()
        require("sidekick.cli").select()
      end,
      desc = "Sidekick Select CLI",
    },
    {
      "<leader>ap",
      function()
        require("sidekick.cli").prompt()
      end,
      mode = { "n", "v" },
      desc = "Sidekick Select Prompt",
    },
    {
      "<leader>af",
      function()
        require("sidekick.cli").ask({ prompt = "fix", submit = true })
      end,
      mode = { "n", "v" },
      desc = "Sidekick Fix Code",
    },
    {
      "<leader>ar",
      function()
        require("sidekick.cli").ask({ prompt = "review", submit = true })
      end,
      mode = { "n", "v" },
      desc = "Sidekick Review Code",
    },
    {
      "<c-.>",
      function()
        require("sidekick.cli").focus()
      end,
      mode = { "n", "x", "i", "t" },
      desc = "Sidekick Switch Focus",
    },
  },

}
