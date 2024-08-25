return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = false,
        hide_during_completion = true,
        debounce = 50,
        keymap = {
          accept = "<M-p>",
          accept_word = "<M-n>",
          accept_line = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
    })
    require("copilot.suggestion").toggle_auto_trigger()
    require("copilot.suggestion").is_visible()
    vim.keymap.set('n', ',e', ":Copilot toggle<CR>", { noremap = true, silent = true })
  end,
}
