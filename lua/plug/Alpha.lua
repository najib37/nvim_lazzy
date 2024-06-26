return {
  "goolord/alpha-nvim",
  lazy = true,
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    math.randomseed(os.time())

    local function pick_color()
      local colors = { "String", "Identifier", "Keyword", "Number" }
      return colors[math.random(#colors)]
    end
    local header = {
      type = "text",
      val = {
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀",
        "⠀⠀⠀ ⠀⣶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠞⣿⠀⠀⠀⠀",
        "⣀⣀⣀⣀⣀⣸⣿⣿⣷⣄⣀⣄⣄⣠⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⡴⠋⠀⣸⣧⣤⣤⣤⣤",
        "⣿⠉⣉⣉⣉⣉⣹⣿⣿⣿⣿⣄⣀⣀⣀⣈⣉⣉⣉⣉⠉⢁⣁⣀⣀⣀⣉⣉⣉⣉⣉⡽⠋⠀⠀⣠⣟⣀⣀⣀⠀⣿",
        "⣿⠀⡿⣿⣯⡉⠉⠙⣿⣿⣿⣿⣯⡉⠉⠉⠉⠉⠉⣿⠀⢸⡏⠉⠉⠉⠉⠉⢉⡽⠋⠀⠀⢀⣴⠋⣩⡿⢻⣿⠀⣿",
        "⣿⠀⡇⠘⣿⣿⣷⣄⡈⠛⢿⣿⣿⡇⣶⣄⠀⠀⠀⣿⠀⢸⡇⠀⠀⠀⢀⡴⢻⡇⠀⢀⣴⢟⡵⠟⠁⢀⡾⢸⠀⣿",
        "⣿⠀⡇⠀⠹⣿⣿⣿⣿⣶⣄⡙⢿⡇⣿⣿⣷⣄⠀⣿⠀⢸⡇⠀⢀⡴⠋⠀⢸⣇⣴⡿⠟⠉⠀⠀⢀⣼⠃⢸⡀⣿",
        "⣿⠀⣷⣶⣦⣌⡛⢿⣿⣿⣿⣧⢰⣅⠻⣿⣿⣿⣷⣿⠀⢸⣇⠴⠋⠀⠀⣠⣾⠟⣿⠇⠀⢀⣠⣾⠿⠓⠋⢩⡇⣿",
        "⣿⠀⡟⢿⣿⣿⣿⣶⣌⡻⢿⣿⣸⣿⣷⣌⠻⣿⣿⣿⣧⣾⡇⠀⢀⣴⣾⠟⠁⢰⣿⣠⣴⡿⠛⠁⠀⠀⣠⢿⠀⣿",
        "⣿⠀⣇⠀⠙⠿⣿⣿⣿⣿⣇⢉⡙⢿⣿⣿⣧⠈⣹⠟⠁⣿⣇⣴⣿⠟⠁⠀⣠⣾⢿⣿⠉⠀⠀⣀⣴⣾⡧⣼⠀⣿",
        "⣿⠀⣿⣿⣶⣦⣌⠛⠿⣿⣿⡜⣿⣦⡻⠋⣡⠎⠀⠀⢀⣿⣿⡏⠁⠀⣠⡾⠟⠁⣼⡇⣀⣴⣾⠿⠛⠁⢀⣿⡅⣿",
        "⣿⠀⣿⣿⣿⣿⣿⣿⣦⡈⠙⠃⠹⣿⡿⢸⠃⠀⣠⣾⠿⢋⣿⠃⣠⡾⠋⠀⠀⣠⣿⣿⡿⠋⠀⠀⠀⢀⡞⢹⠂⣿",
        "⣿⠀⠿⠿⠿⢿⣿⣿⣿⣷⡌⢿⣦⣽⣷⡏⢀⣴⠟⠁⠀⢸⣿⡿⠋⠀⠀⣠⡾⠟⢩⣿⠃⠀⠀⢀⡴⣛⣛⣿⡁⣿",
        "⣿⠀⣰⣶⣦⣤⣙⣻⣿⣿⣷⡘⣿⣿⣿⣷⡿⠋⠀⢀⣴⢿⣿⠀⢀⣴⠾⠋⠀⢀⣿⡏⣠⣴⣾⡿⠟⠉⢀⣾⠀⣿",
        "⣿⠀⡟⢻⣿⣿⣿⣿⣭⣉⠙⠃⠘⢿⣿⡏⠀⢀⣴⠟⠁⣸⣿⣾⡟⠁⠀⠀⣀⣼⣿⣿⡿⠛⠁⠀⠀⢠⡞⢹⠀⣿",
        "⣿⠀⡇⠀⠙⢿⣿⣿⣿⣿⣆⢲⣤⣄⣹⢁⣴⠟⠁⢀⣴⠟⢻⣿⠀⢀⣤⣾⡿⠛⣹⡟⠀⠀⢀⣠⣴⣋⣀⢸⠀⣿",
        "⣿⠀⣧⣴⣦⣤⣈⡙⠻⣿⣿⡌⣿⣿⣿⡿⠋⢀⣴⠟⠃⢀⣿⣷⣾⠿⠋⠁⠀⢠⣿⣣⣴⠾⠛⠋⠉⣹⠏⢸⡄⣿",
        "⣿⠀⣿⠈⠻⣿⣿⣿⣷⣦⡈⠁⠘⠻⣿⠀⣠⡾⠃⢀⣴⣿⣿⡟⠁⠀⣀⣴⣾⣿⣿⠟⠁⠀⠀⢀⡼⠃⠀⢸⠆⣿",
        "⣿⠀⣿⠀⠀⠈⠻⣿⣿⣿⣿⡌⢿⣷⣿⡾⠋⢀⣴⠟⠉⢸⣿⣠⣶⡿⠟⠛⠉⣼⡏⢀⣠⣤⣶⠿⠶⣶⠀⢸⡀⣿",
        "⣿⠀⣿⠰⣿⣿⣶⣦⣌⡉⠛⠻⠈⢿⡏⢀⡴⠟⠁⣠⣴⣿⣿⡟⠉⠀⠀⣀⣸⣿⣾⠿⠛⠉⠀⣀⡾⠃⠀⢸⠀⣿",
        "⣿⠀⣿⠀⠈⠛⢿⣿⣿⣿⣿⣦⢠⣼⡷⢋⣠⣶⡿⠟⠋⣽⣏⣀⣤⣶⣿⠿⢻⣿⠁⠀⣀⣤⠾⠋⠀⠀⠀⢸⡀⣿",
        "⣿⠀⡇⠀⠀⠀⢠⣬⣉⡛⠿⢿⣧⣹⣶⡿⠛⠉⢀⣠⣴⣿⠿⠟⠋⠁⠀⣠⣿⣷⠶⠛⠛⢋⡿⠁⠀⠀⠀⢸⡇⣿",
        "⣿⠀⢷⣄⡀⠀⠈⠻⣿⣿⣿⣶⣦⡟⠉⣀⣤⠶⠛⢉⣿⠇⣀⣠⡴⠶⠛⣽⡟⠀⠀⢀⣠⠟⠀⠀⠀⣀⣤⡾⠃⣿",
        "⠻⢦⣄⡈⠛⠶⣤⣀⠈⠙⠛⠿⣿⡷⠟⠋⢀⣠⣴⣿⡿⠛⠉⠁⣀⣠⣾⣿⣴⡶⠿⢯⣤⣀⣤⡶⠟⠋⣁⣤⡶⠟",
        "⠀⠀⠉⠻⢶⣤⣈⠙⠳⣿⣿⣷⣏⣤⣴⠾⠛⠉⣠⣿⣣⣴⡶⠿⣻⡿⠋⠉⠀⠀⢀⣴⠿⠛⢁⣠⡴⠞⠋⠁⠀⠀",
        "⠀⠀⠀⠀⠀⠈⠙⠷⣦⣄⣽⠿⠋⠉⠀⢀⣠⣾⣿⣯⣭⣤⣤⣾⣿⣤⣤⣤⣶⣾⣿⣤⣴⠾⠋⠁⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⢀⣴⠟⠁⣀⣤⡶⠛⠻⣯⣄⣿⠀⠀⣿⣩⣴⠾⠛⢉⣬⣿⠿⠿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⢀⣴⣯⡵⠞⠋⠁⠈⠛⠷⣦⣄⠉⠛⠀⠀⠛⢉⣠⣴⠾⠛⠉⠀⠀⠀⠀⠈⠙⠻⠦⡀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⢶⣤⣴⡾⠟⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      },
      opts = {
        position = "center",
        hl = pick_color(),
        color = "green",
      }
    }

    local date = os.date(" %A, %b %d")

    local function button(sc, txt, keybind)
      local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

      local opts = {
        position = "center",
        text = txt,
        shortcut = sc,
        width = 44,
        align_shortcut = "right",
        hl_shortcut = "Operator",
        hl = "Conditonal",
      }
      if keybind then
        opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
      end

      return {
        type = "button",
        val = txt,
        on_press = function()
          local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
          vim.api.nvim_feedkeys(key, "normal", false)
        end,
        opts = opts,
      }
    end

    local buttons = {
      type = "group",
      val = {
        button("f", "󰱼 " .. " Find File", ":Telescope find_files <CR>"),
        button("e", "󰦛 " .. " Restore Session", ":lua require('persistence').load({ last = true}) <CR>"),
        button("p", " " .. " Find Project", ":lua require('telescope').extensions.projects.projects{}<CR>"),
        button("r", " " .. " Recent Files", ":Telescope oldfiles <CR>"),
        button("c", " " .. " Config", ":e ~/.config/nvim/lua <CR>"),
        button("q", " " .. " Quit", ":qa<CR>"),
      },
      opts = {
        position = 'center',
        spacing = 1,
      },
    }

    local footer = {
      type = "text",
      val = "Date: " .. date,
      opts = {
        position = "center",
        hl = "Text",
      }
    }


    local plugins_gen = io.popen('fd -d 2 . "$HOME/.local/share/nvim/lazy" | head -n -2 | ls | wc -l | tr -d "\n" ')
    local plugins = plugins_gen:read("*a")
    plugins_gen:close()


    local footer_2 = {
      type = "text",
      val = "downloaded " .. plugins .. " plugins",
      opts = {
        position = "center",
        hl = "Function",
      },
    }


    local section = {
      header = header,
      buttons = buttons,
      footer = footer,
      footer_2 = footer_2,
    }

    local opts = {
      layout = {
        { type = "padding", val = 0 },
        section.header,
        { type = "padding", val = 1 },
        section.heading,
        { type = "padding", val = 1 },
        section.buttons,
        { type = "padding", val = 0 },
        section.footer,
        { type = "padding", val = 0 },
        section.footer_2,
      },
      opts = {
        margin = 44,
      },
    }

    require('alpha').setup(opts)
  end
}
