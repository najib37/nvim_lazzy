return {
	{'nvim-tree/nvim-web-devicons'},
	{"nvim-lua/plenary.nvim"},

  -- lsp config
	require "lsp.Mason",
	require "lsp.MasonLspConfig",
	require "lsp.LspConfig",
	require "lsp.serverSetting.TsTools",

  -- dap config
	require "dap.Dap",
	-- require "dap.nodeDap",

  -- plugins
	require 'plug.luarocks',
  require 'plug.tsComments',
	require "plug.Neorg",
	require 'plug.Treesitter',
	require 'plug.Comments',
	require 'plug.Nvimtree',
	require 'plug.Telescope',
	require 'plug.Bufferline',
	require "plug.Alpha",
	require "plug.Lualine",
  require "plug.Indentline",
	require "plug.Toggleterm",
	require "plug.Notify",
	require "plug.Noice",
	require "plug.TreeSj",
	require "plug.Lightspeed",
	require "plug.Autopaire",
	require "plug.Dressing",
	require "plug.Cmp",
	require "plug.Harpoon",
	require "plug.treeNav",
	require "plug.NeoGit",
	require "plug.GitSign",
	require "plug.lua_snip",
	require "plug.friendly",
	require "plug.autoTag",
	require "plug.TodoCmp", -- TODO fix the vs-snippets
  require "plug.oilNvim",
  --
  -- copilot setup
  require "plug.copilot",
  require "plug.copilotChat"

  -- trash
	-- require "NvimShip",
	-- require "NvimUfo", -- [commented till i fix the highlighte]
  -- require "plug.scoopNvim", -- TODO! keymaps
	-- require "NvimRest", -- INFO: fd error 
}
