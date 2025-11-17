-- -- setting the icons for the Diagnostics
-- local function diagnosticSetup()
--   local signs = {
--     { name = "DiagnosticSignError", text = "" },
--     { name = "DiagnosticSignWarn", text = "" },
--     { name = "DiagnosticSignHint", text = "" },
--     { name = "DiagnosticSignInfo", text = "" },
--   }
--
--   for _, sign in ipairs(signs) do
--     vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
--   end
--
--   local config = {
--     virtual_text = false, -- disable virtual text
--     signs = {
--       active = signs,     -- show signs
--     },
--     update_in_insert = true,
--     underline = true,
--     severity_sort = true,
--     float = {
--       focusable = true,
--       style = "minimal",
--       border = "rounded",
--       source = "always",
--       header = "",
--       prefix = "",
--     },
--   }
--   vim.diagnostic.config(config)
--
--   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--     border = "rounded",
--   })
--
--   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--     border = "rounded",
--   })
-- end
--
-- local function keymaps()
--   vim.keymap.set("n", "<PageUp>", vim.diagnostic.goto_prev)
--   vim.keymap.set("n", "<PageDown>", vim.diagnostic.goto_next)
--
--   vim.keymap.set("n", "<m-1>", vim.diagnostic.goto_prev)
--   vim.keymap.set("n", "<m-2>", vim.diagnostic.goto_next)
--   vim.keymap.set("n", "<m-3>", ":Telescope diagnostics<cr>", { silent = true })
--
--   vim.keymap.set("n", "<leader>qq", ":Telescope diagnostics<cr>")
--
--   -- Use LspAttach autocommand to only map the following keys
--   -- after the language server attaches to the current buffer
--   vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--     callback = function(ev)
--       -- Enable completion triggered by <c-x><c-o>
--       vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
--
--       -- Buffer local mappings.
--       -- See `:help vim.lsp.*` for documentation on any of the below functions
--       local opts = { buffer = ev.buf }
--       vim.keymap.set("n", "gf", vim.diagnostic.open_float)
--       vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
--       vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--       vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--       vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
--       vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
--       vim.keymap.set("n", ",w", vim.lsp.buf.add_workspace_folder, opts)
--       vim.keymap.set("n", ",a", vim.lsp.buf.add_workspace_folder, opts)
--       vim.keymap.set("n", ",wr", vim.lsp.buf.remove_workspace_folder, opts)
--       vim.keymap.set("n", ",wl", function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--       end, opts)
--       vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
--       vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
--       vim.keymap.set({ "n", "v" }, "<space>c", vim.lsp.buf.code_action, opts)
--       vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
--       vim.keymap.set("n", "<space>f", function()
--         require("conform").format({
--           lsp_fallback = true,
--         })
--         -- vim.lsp.buf.format { async = true }
--       end, opts)
--     end,
--   })
-- end
--
-- return {
--   "neovim/nvim-lspconfig",
--   -- lazy = false,
--   dependencies = {
--     "williamboman/mason-lspconfig.nvim",
--     "williamboman/mason.nvim",
--   },
--   config = function()
--     diagnosticSetup()
--     keymaps()
--
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     capabilities.textDocument.completion.completionItem.snippetSupport = true
--
--     require("lsp.serverSetting.lua_ls") -- lua_ls setup
--     -- require("lsp.serverSetting.clangd") -- clangd setup
--
--     require('lspconfig').ansiblels.setup({})
--
--     require("lspconfig").prismals.setup({
--       capabilities = capabilities,
--       single_file_support = true,
--     })
--
--     require("lspconfig").docker_compose_language_service.setup({
--       capabilities = capabilities,
--       -- cmd = {"docker-compose-langserver", "--stdio"},
--       single_file_support = true,
--       filetypes = { "yaml.*", "*.yaml", "*.yml", "yml.*" },
--     })
--
--     require 'lspconfig'.kotlin_language_server.setup {
--       capabilities = capabilities,
--     }
--
--     vim.lsp.config['luals'] = {
--       cmd = { 'lua-language-server' },
--       filetypes = { 'lua' },
--       root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
--       settings = {
--         Lua = {
--           runtime = {
--             version = 'LuaJIT',
--           }
--         }
--       }
--     }
--
--
--     require("lspconfig").dockerls.setup({
--       capabilities = capabilities,
--       single_file_support = true,
--     })
--
--     require("lspconfig").jsonls.setup({
--       capabilities = capabilities,
--       single_file_support = true,
--     })
--
--
--     require("lspconfig").pyright.setup({
--       capabilities = capabilities,
--       single_file_support = true,
--       settings = {
--         pyright = {
--           disableLanguageServices = false,
--           disableOrganizeImports = false,
--         },
--         python = {
--           analysis = {
--             autoImportCompletions = true,
--             autoSearchPaths = true,
--             diagnosticMode = "workspace", -- openFilesOnly, workspace
--             typeCheckingMode = "basic",   -- off, basic, strict
--             useLibraryCodeForTypes = true,
--           },
--         },
--       },
--     })
--
--     require("lspconfig").helm_ls.setup {
--       settings = {
--         ['helm-ls'] = {
--           logLevel = "info",
--           valuesFiles = {
--             mainValuesFile = "values.yaml",
--             lintOverlayValuesFile = "values.lint.yaml",
--             additionalValuesFilesGlobPattern = "values*.yaml"
--           },
--           yamlls = {
--             enabled = true,
--             enabledForFilesGlob = "*.{yaml,yml}",
--             diagnosticsLimit = 50,
--             showDiagnosticsDirectly = false,
--             path = "yaml-language-server",
--             config = {
--               schemas = {
--                 kubernetes = "templates/**",
--               },
--               completion = true,
--               hover = true,
--               -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
--             }
--           }
--         }
--       }
--     }
--
--     require("lspconfig").yamlls.setup({
--       capabilities = capabilities,
--     })
--
--     require("lspconfig").cssls.setup({
--       capabilities = capabilities,
--     })
--
--     require("lspconfig").html.setup({
--       capabilities = capabilities,
--       cmd = { "vscode-html-language-server", "--stdio" },
--       filetypes = { "html", "htmldjango", "*.httl" },
--       init_options = {
--         configurationSection = { "html", "css", "javascript" },
--         embeddedLanguages = {
--           css = true,
--           javascript = true,
--         },
--         provideFormatter = true,
--       },
--       settings = {},
--       single_file_support = true,
--     })
--
--     require('lspconfig').ruff.setup({
--       capabilities = capabilities,
--       init_options = {
--         settings = {
--         }
--       }
--     })
--
--     -- require("lspconfig").dartls.setup({})
--
--     -- require "lsp.serverSetting.tsserver"
--     -- require "lsp.serverSetting.Tstoolserver" -- clangd setup
--   end,
-- }

-- local function diagnosticSetup()
--   local signs = {
--     { name = "DiagnosticSignError", text = "" },
--     { name = "DiagnosticSignWarn", text = "" },
--     { name = "DiagnosticSignHint", text = "" },
--     { name = "DiagnosticSignInfo", text = "" },
--   }
--
--   for _, sign in ipairs(signs) do
--     vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
--   end
--
--   local config = {
--     virtual_text = false, -- disable virtual text
--     signs = {
--       active = signs,     -- show signs
--     },
--     update_in_insert = true,
--     underline = true,
--     severity_sort = true,
--     float = {
--       focusable = true,
--       style = "minimal",
--       border = "rounded",
--       source = "always",
--       header = "",
--       prefix = "",
--     },
--   }
--   vim.diagnostic.config(config)
--
--   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--     border = "rounded",
--   })
--
--   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--     border = "rounded",
--   })
-- end
--


local function diagnosticSetup()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  local config = {
    virtual_text = false,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = signs[1].text,
        [vim.diagnostic.severity.WARN] = signs[2].text,
        [vim.diagnostic.severity.HINT] = signs[3].text,
        [vim.diagnostic.severity.INFO] = signs[4].text,
      }
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
  vim.keymap.set("n", "<PageUp>", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "<PageDown>", vim.diagnostic.goto_next)

  vim.keymap.set("n", "<m-1>", vim.diagnostic.goto_prev)
  vim.keymap.set("n", "<m-2>", vim.diagnostic.goto_next)
  vim.keymap.set("n", "<m-3>", ":Telescope diagnostics<cr>", { silent = true })

  vim.keymap.set("n", "<leader>qq", ":Telescope diagnostics<cr>")

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gf", vim.diagnostic.open_float)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", ",w", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", ",a", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", ",wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", ",wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<space>c", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "<space>f", function()
        require("conform").format({
          lsp_fallback = true,
        })
        -- vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })
end

local function setupLspServers()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  -- Configure all LSP servers using vim.lsp.config
  vim.lsp.config('ansiblels', {
    capabilities = capabilities,
  })

  vim.lsp.config('prismals', {
    capabilities = capabilities,
    single_file_support = true,
  })

  vim.lsp.config('docker_compose_language_service', {
    capabilities = capabilities,
    single_file_support = true,
    filetypes = { "yaml", "yml" },
  })

  vim.lsp.config('kotlin_language_server', {
    capabilities = capabilities,
  })

  vim.lsp.config('luals', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        }
      }
    }
  })

  vim.lsp.config('dockerls', {
    capabilities = capabilities,
    single_file_support = true,
  })

  vim.lsp.config('jsonls', {
    capabilities = capabilities,
    single_file_support = true,
  })

  vim.lsp.config('pyright', {
    capabilities = capabilities,
    single_file_support = true,
    settings = {
      pyright = {
        disableLanguageServices = false,
        disableOrganizeImports = false,
      },
      python = {
        analysis = {
          autoImportCompletions = true,
          autoSearchPaths = true,
          diagnosticMode = "workspace", -- openFilesOnly, workspace
          typeCheckingMode = "basic",   -- off, basic, strict
          useLibraryCodeForTypes = true,
        },
      },
    },
  })

  vim.lsp.config('helm_ls', {
    capabilities = capabilities,
    settings = {
      ['helm-ls'] = {
        logLevel = "info",
        valuesFiles = {
          mainValuesFile = "values.yaml",
          lintOverlayValuesFile = "values.lint.yaml",
          additionalValuesFilesGlobPattern = "values*.yaml"
        },
        yamlls = {
          enabled = true,
          enabledForFilesGlob = "*.{yaml,yml}",
          diagnosticsLimit = 50,
          showDiagnosticsDirectly = false,
          path = "yaml-language-server",
          config = {
            schemas = {
              kubernetes = "templates/**",
            },
            completion = true,
            hover = true,
            -- any other config from https://github.com/redhat-developer/yaml-language-server#language-server-settings
          }
        }
      }
    }
  })

  vim.lsp.config('yamlls', {
    capabilities = capabilities,
  })

  vim.lsp.config('cssls', {
    capabilities = capabilities,
  })

  vim.lsp.config('html', {
    capabilities = capabilities,
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "htmldjango" },
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true,
      },
      provideFormatter = true,
    },
    settings = {},
    single_file_support = true,
  })

  vim.lsp.config('ruff', {
    capabilities = capabilities,
    init_options = {
      settings = {
      }
    }
  })

  -- Enable all configured servers
  local servers = {
    'ansiblels',
    'prismals',
    'docker_compose_language_service',
    'kotlin_language_server',
    'luals',
    'dockerls',
    'jsonls',
    'pyright',
    'helm_ls',
    'yamlls',
    'cssls',
    'html',
    'ruff',
  }

  for _, server in ipairs(servers) do
    vim.lsp.enable(server)
  end
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    diagnosticSetup()
    keymaps()
    setupLspServers()

    -- require("lsp.serverSetting.lua_ls") -- lua_ls setup
    -- require("lsp.serverSetting.clangd") -- clangd setup

    -- require("lsp.serverSetting.tsserver")
    -- require("lsp.serverSetting.Tstoolserver") -- clangd setup
  end,
}
