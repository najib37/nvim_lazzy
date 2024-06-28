return {
  'hrsh7th/nvim-cmp',
  event = false,
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { "saadparwaiz1/cmp_luasnip" },
  },
  config = function()
    local cmp = require 'cmp'
    local kind_icons = require "plug.kindicons"
    local luasnip = require "luasnip"

    cmp.setup({
      snippet = { -- snippet a l7mar
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      formatting = {
        fields = { "kind", "abbr", "menu" },
        preselect = cmp.PreselectMode.None,
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
      window = {
        documentation = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
      mapping = {
        ["<C-e>"] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },

        -- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping.complete(),

        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ["<S-tab>"] = cmp.mapping.select_prev_item(),
        ["<tab>"] = cmp.mapping.select_next_item(),

        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --     fallback()
        --   else
        --     fallback()
        --   end
        -- end, {
        --   "i",
        --   "s",
        -- }),
        --
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   else
        --     fallback()
        --   end
        -- end, {
        --   "i",
        --   "s",
        -- }),
      },

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      }),

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    })
  end
}
