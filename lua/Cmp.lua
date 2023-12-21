return {
	'hrsh7th/nvim-cmp',
	event = false,
	dependencies = {
		{ 'neovim/nvim-lspconfig' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'hrsh7th/cmp-cmdline' },
	},
	config = function()
		local cmp = require'cmp'
		local kind_icons = require"kindicons"
		cmp.setup({
			formatting = {
				fields = { "kind", "abbr", "menu" },
				preselect = cmp.PreselectMode.None,
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						-- luasnip = "[Snippet]",
						buffer = "[Buffer]",
						path = "[Path]",
					})[entry.source.name]
					return vim_item
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				-- { name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			window = {
				documentation = {
					border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
				},
			},

			mapping = {
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-e>"] = cmp.mapping {
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				},
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
						fallback()
					else
						fallback()
					end
				end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, {
			"i",
			"s",
		}),
	},
})
	end
}


-- confirm_opts = {
	-- 	behavior = cmp.ConfirmBehavior.Replace,
	-- 	select = false,
	-- },
