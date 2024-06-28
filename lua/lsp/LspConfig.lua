-- setting the icons for the Diagnostics
local function diagnosticSetup()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false, -- disable virtual text
    signs = {
      active = signs,     -- show signs
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }
  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

local function keymaps()
  vim.keymap.set('n', '<PageUp>', vim.diagnostic.goto_prev)
  vim.keymap.set('n', '<PageDown>', vim.diagnostic.goto_next)
  vim.keymap.set('n', '<leader>qq', ":Telescope diagnostics<cr>")

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gf', vim.diagnostic.open_float)
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', ',w', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', ',a', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', ',wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', ',wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>c', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })
end


return {
  "neovim/nvim-lspconfig",
  -- lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",

  },
  config = function()
    diagnosticSetup()
    keymaps();

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    require "lsp.serverSetting.lua_ls" -- lua_ls setup
    require "lsp.serverSetting.clangd" -- clangd setup

    require 'lspconfig'.prismals.setup {
      capabilities = capabilities,
      single_file_support = true,
    }

    require 'lspconfig'.docker_compose_language_service.setup {
      capabilities = capabilities,
      -- cmd = {"docker-compose-langserver", "--stdio"},
      single_file_support = true,
      filetypes = { "yaml.*", "*.yaml", "*.yml", "yml.*" }
    }

    require 'lspconfig'.dockerls.setup {
      capabilities = capabilities,
      single_file_support = true,
    }

    require 'lspconfig'.jsonls.setup {
      capabilities = capabilities,
      single_file_support = true,
    }

    require('lspconfig').yamlls.setup {
      capabilities = capabilities,
    }

    require 'lspconfig'.pyright.setup {
      capabilities = capabilities,
      single_file_support = true,
      settings = {
        pyright = {
          disableLanguageServices = false,
          disableOrganizeImports = false
        },
        python = {
          analysis = {
            autoImportCompletions = true,
            autoSearchPaths = true,
            diagnosticMode = "workspace", -- openFilesOnly, workspace
            typeCheckingMode = "basic",   -- off, basic, strict
            useLibraryCodeForTypes = true
          }
        }
      },
    }

    require 'lspconfig'.cssls.setup {
      capabilities = capabilities,
    }

    require 'lspconfig'.html.setup {
      capabilities = capabilities,
      cmd = { "vscode-html-language-server", "--stdio" },
      filetypes = { "html", "htmldjango", "*.httl" },
      init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
          css = true,
          javascript = true
        },
        provideFormatter = true
      },
      settings = {},
      single_file_support = true
    }

    -- require "lsp.serverSetting.tsserver"
    -- require "lsp.serverSetting.Tstoolserver" -- clangd setup
  end
}
