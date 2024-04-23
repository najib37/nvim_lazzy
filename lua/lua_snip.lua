return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
	dependencies = {
    { "rafamadriz/friendly-snippets" }
	},
	keys = {
		{
			"<TAB>",
			function()
        require('luasnip').jump(1)
			end
		},
		{
			"<S-TAB>",
			function()
        require('luasnip').jump(-1)
			end
		},
  },
  build = "make install_jsregexp",
  config = function()

    local Luasnip = require('luasnip')
    Luasnip.setup{}
    require("luasnip.loaders.from_vscode").lazy_load()
  end
}
