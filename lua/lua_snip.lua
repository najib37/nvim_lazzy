return {
  "L3MON4D3/LuaSnip",
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  config = function()
    local Luasnip = require('luasnip')
    require("luasnip.loaders.from_vscode").load {
   }
  end
}
