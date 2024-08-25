return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  lazy = false,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
  keys = {
    {
      ",f",
      function()
        require('telescope.builtin').live_grep()
      end
    },
    {
      ",s",
      function()
        require('telescope.builtin').find_files()
      end
    },
    {
      ",m",
      function()
        require('telescope.builtin').man_pages()
      end
    },
    {
      ",d",
      function()
        require('telescope.builtin').lsp_document_symbols()
      end
    },
    {
      ",v",
      function()
        require('telescope.builtin').registers()
      end
    },
    {
      ",t",
      function()
        require('telescope.builtin').current_buffer_tags()
      end
    },
    {
      ",b",
      function()
        require('telescope.builtin').buffers()
      end
    },
    {
      ",p",
      function()
        local actions = require("CopilotChat.actions")
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end,
      desc = "CopilotChat - Prompt actions",
    },
  },
  config = function()
    require("telescope").setup {}
    require("telescope").load_extension("notify");
    require("telescope").load_extension("harpoon");
    -- require('telescope').extensions.notify.notify()
  end
}
